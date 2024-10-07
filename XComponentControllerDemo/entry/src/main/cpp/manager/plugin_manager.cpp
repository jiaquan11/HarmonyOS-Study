#include "plugin_manager.h"

#include <cstdint>
#include <js_native_api.h>
#include <js_native_api_types.h>

#include "hilog/log.h"
#include <native_window/external_window.h>

#include "common/common.h"
#include "render/plugin_render.h"

namespace NativeXComponentSample {

std::unordered_map<int64_t, OHNativeWindow *> windowMap_;

int64_t ParseId(napi_env env, napi_callback_info info) {
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_status operStatus = napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    if (operStatus != napi_ok) {
        return -1;
    }
    napi_valuetype paraDataType = napi_undefined;
    operStatus = napi_typeof(env, args[0], &paraDataType); // 检测参数的数据类型
    if ((operStatus != napi_ok) || (paraDataType != napi_bigint)) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "PluginManager", "ParseId: type is not match");
        return -1;
    }
    
    int64_t surfaceId = 0;
    bool lossless = true;
    operStatus = napi_get_value_bigint_int64(env, args[0], &surfaceId, &lossless);
    if (operStatus != napi_ok) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "PluginManager", "ParseId: get id value failed");
        return -1;
    }
    return surfaceId; 
}

//设置SurfaceId，基于SurfaceId完成对NativeWindow的初始化
napi_value PluginManager::SetSurfaceId(napi_env env, napi_callback_info info) {
    int64_t surfaceId = ParseId(env, info);
    OHNativeWindow *nativeWindow;
    if (windowMap_.find(surfaceId) == windowMap_.end()) {
        OH_NativeWindow_CreateNativeWindowFromSurfaceId(surfaceId, &nativeWindow);
        windowMap_[surfaceId] = nativeWindow;
    }
    PluginRender *pluginRender = PluginRender::GetInstance(surfaceId);
    pluginRender->InitNativeWindow(nativeWindow);
    return nullptr;
}

//根据传入的surfaceId、width、height实现surface大小的变动
napi_value PluginManager::ChangeSurface(napi_env env, napi_callback_info info) {
    if ((env == nullptr) || (info == nullptr)) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "PluginManager", "ChangeSurface: OnLoad env or info is null");
        return nullptr;
    }
    int64_t surfaceId = 0;
    size_t argc = 3;
    napi_value args[3] = {nullptr};
    if (napi_ok != napi_get_cb_info(env, info, &argc, args, nullptr, nullptr)) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "PluginManager", "ChangeSurface: GetContext napi_get_cb_info failed");
    }
    bool lossless = true;
    int index = 0;
    if (napi_ok != napi_get_value_bigint_int64(env, args[index++], &surfaceId, &lossless)) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "PluginManager", "ChangeSurface: Get value failed");
    }
    double width;
    if (napi_ok != napi_get_value_double(env, args[index++], &width)) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "PluginManager", "ChangeSurface: Get width failed");
    }
    double height;
    if (napi_ok != napi_get_value_double(env, args[index++], &height)) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "PluginManager", "ChangeSurface: Get height failed");
    }
    
    PluginRender *pluginRender = PluginRender::GetInstance(surfaceId);
    if (pluginRender == nullptr) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "PluginManager", "ChangeSurface: Get pluginRender failed");
        return nullptr;
    }
    pluginRender->UpdateNativeWindowSize(width, height);
    return nullptr;
}

//销毁surface
napi_value PluginManager::DestroySurface(napi_env env, napi_callback_info info) {
    int64_t surfaceId = ParseId(env, info);
    PluginRender *pluginRender = PluginRender::GetInstance(surfaceId);
    if (pluginRender != nullptr) {
        delete pluginRender;
        pluginRender = nullptr;
    }
    auto windowMapIter = windowMap_.find(surfaceId);
    if (windowMapIter != windowMap_.end()) {
        OH_NativeWindow_DestroyNativeWindow(windowMapIter->second);
        windowMap_.erase(windowMapIter);
    }
    return nullptr;
}

// 实现EGL绘画逻辑
napi_value PluginManager::DrawPattern(napi_env env, napi_callback_info info) {
    int64_t surfaceId = ParseId(env, info);
    PluginRender *pluginRender = PluginRender::GetInstance(surfaceId);
    if (pluginRender == nullptr) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "PluginManager", "DrawPattern: Get pluginRender failed");
        return nullptr;
    }
    pluginRender->DrawPattern();
    return nullptr;
}

//实现改变绘制图形颜色的功能
napi_value PluginManager::ChangeColor(napi_env env, napi_callback_info info) {
    int64_t surfaceId = ParseId(env, info);
    PluginRender *pluginRender = PluginRender::GetInstance(surfaceId);
    if (pluginRender == nullptr) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "PluginManager", "ChangeColor: Get pluginRender failed");
        return nullptr;
    }
    pluginRender->ChangeColor();
    return nullptr;
}

//获得xcomponent状态，并返回至ArkTS侧
napi_value PluginManager::GetXComponentStatus(napi_env env, napi_callback_info info) {
    int64_t surfaceId = ParseId(env, info);
    PluginRender *pluginRender = PluginRender::GetInstance(surfaceId);
    if (pluginRender == nullptr) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "PluginManager", "GetXComponentStatus: Get pluginRender failed");
        return nullptr;
    }
    napi_value hasDraw;
    napi_value hasChangeColor;
    napi_status ret = napi_create_int32(env, pluginRender->HasDraw(), &(hasDraw));
    if (ret != napi_ok) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "PluginManager", "GetXComponentStatus: napi_create_int32 hasDraw_ error");
        return nullptr;
    }
    ret = napi_create_int32(env, pluginRender->HasChangedColor(), &(hasChangeColor));
    if (ret != napi_ok) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "PluginManager", "GetXComponentStatus: napi_create_int32 hasChangeColor_ error");
        return nullptr;
    }
    napi_value obj;
    ret = napi_create_object(env, &obj);
    if (ret != napi_ok) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "PluginManager", "GetXComponentStatus: napi_create_object error");
        return nullptr;
    }
    ret = napi_set_named_property(env, obj, "hasDraw", hasDraw);
    if (ret != napi_ok) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "PluginManager", "GetXComponentStatus: napi_set_named_property hasDraw error");
        return nullptr;
    }
    ret = napi_set_named_property(env, obj, "hasChangeColor", hasChangeColor);
    if (ret != napi_ok) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "PluginManager", "GetXComponentStatus: napi_set_named_property hasChangeColor error");
        return nullptr;
    }
    return obj;
}

}