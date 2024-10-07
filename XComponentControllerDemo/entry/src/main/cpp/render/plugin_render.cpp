#include "plugin_render.h"

#include <cstdint>
#include <string>

namespace NativeXComponentSample {

std::unordered_map<int64_t, PluginRender*> PluginRender::m_instance;
int32_t PluginRender::m_hasDraw = 0;
int32_t PluginRender::m_hasChangeColor = 0;

PluginRender::PluginRender() {
    m_eglCore = new EGLCore();
}

PluginRender::~PluginRender() {
    m_eglCore->Release();
    delete m_eglCore;
    m_eglCore = nullptr;
}

PluginRender* PluginRender::GetInstance(int64_t& id) {
    if (m_instance.find(id) == m_instance.end()) {
        PluginRender* instance = new PluginRender();
        m_instance[id] = instance;
        return instance;
    } else {
        return m_instance[id];
    }
}

void PluginRender::InitNativeWindow(OHNativeWindow *nativeWindow) {
    m_eglCore->Init(nativeWindow);
}

void PluginRender::UpdateNativeWindowSize(int width, int height) {
    m_eglCore->UpdateSize(width, height);
}

void PluginRender::DrawPattern() {
    m_eglCore->Draw(m_hasDraw);
}

void PluginRender::ChangeColor() {
    m_eglCore->ChangeColor(m_hasChangeColor);
}

} // namespace NativeXComponentSample
