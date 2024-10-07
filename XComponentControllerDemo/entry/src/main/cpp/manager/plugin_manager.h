#ifndef XCOMPONENTCONTROLLERDEMO_PLUGIN_MANAGER_H
#define XCOMPONENTCONTROLLERDEMO_PLUGIN_MANAGER_H

#include <napi/native_api.h>

namespace NativeXComponentSample {

class PluginManager {
public:
    static napi_value SetSurfaceId(napi_env env, napi_callback_info info);
    static napi_value ChangeSurface(napi_env env, napi_callback_info info);
    static napi_value DestroySurface(napi_env env, napi_callback_info info);
    static napi_value DrawPattern(napi_env env, napi_callback_info info);
    static napi_value ChangeColor(napi_env env, napi_callback_info info);
    static napi_value GetXComponentStatus(napi_env env, napi_callback_info info);
};

}

#endif //XCOMPONENTCONTROLLERDEMO_PLUGIN_MANAGER_H
