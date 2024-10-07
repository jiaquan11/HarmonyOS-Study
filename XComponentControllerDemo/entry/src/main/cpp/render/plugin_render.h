#ifndef XCOMPONENTCONTROLLERDEMO_PLUGIN_RENDER_H
#define XCOMPONENTCONTROLLERDEMO_PLUGIN_RENDER_H

#include <unordered_map>
#include <native_window/external_window.h>

#include "egl_core.h"

namespace NativeXComponentSample {

class PluginRender {
public:
    explicit PluginRender();
    ~PluginRender();
    
public:
    static PluginRender* GetInstance(int64_t& id);
    void InitNativeWindow(OHNativeWindow *nativeWindow);
    void UpdateNativeWindowSize(int width, int height);
    void DrawPattern();
    void ChangeColor();
    int32_t HasDraw() {
        return m_hasDraw;
    }
    int32_t HasChangedColor() {
        return m_hasChangeColor;
    }

public:
    static std::unordered_map<int64_t, PluginRender*> m_instance;
    static int32_t m_hasChangeColor;
    static int32_t m_hasDraw;
    EGLCore* m_eglCore;
};

} // namespace NativeXComponentSample


#endif //XCOMPONENTCONTROLLERDEMO_PLUGIN_RENDER_H
