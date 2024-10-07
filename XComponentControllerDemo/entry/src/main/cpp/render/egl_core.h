#ifndef NATIVE_XCOMPONENT_EGL_CORE_H
#define NATIVE_XCOMPONENT_EGL_CORE_H

#include <EGL/egl.h>
#include <EGL/eglext.h>
#include <GLES3/gl3.h>

namespace NativeXComponentSample {

class EGLCore {
public:
    bool Init(void* window);
    bool CreateEnvironment();
    void Draw(int& hasDraw);
    void ChangeColor(int& hasChangeColor);
    void Release();
    void UpdateSize(int width, int height);

private:
    GLuint LoadShader(GLenum type, const char* shaderSrc);
    GLuint CreateProgram(const char* vertexShader, const char* fragShader);
    GLint PrepareDraw();
    bool ExecuteDraw(GLint position, const GLfloat* color, const GLfloat shapeVertices[], unsigned long vertSize);
    bool FinishDraw();
    void Rotate2d(GLfloat centerX, GLfloat centerY, GLfloat* rotateX, GLfloat* rotateY, GLfloat theta);
    
private:
    EGLNativeWindowType m_eglWindow;
    EGLDisplay m_eglDisplay = EGL_NO_DISPLAY;
    EGLConfig m_eglConfig = EGL_NO_CONFIG_KHR;
    EGLSurface m_eglSurface = EGL_NO_SURFACE;
    EGLContext m_eglContext = EGL_NO_CONTEXT;
    GLuint m_program;
    bool m_flag = false;
    int m_width;
    int m_height;
};

} // namespace NativeXComponentSample

#endif // NATIVE_XCOMPONENT_EGL_CORE_H
