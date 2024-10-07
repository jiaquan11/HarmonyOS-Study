cmake_minimum_required(VERSION 3.5.0)
project(XComponentControllerDemo)

set(NATIVERENDER_ROOT_PATH ${CMAKE_CURRENT_SOURCE_DIR})
add_definitions(-DOHOS_PLATFORM)

if(DEFINED PACKAGE_FIND_FILE)
    include(${PACKAGE_FIND_FILE})
endif()

include_directories(${NATIVERENDER_ROOT_PATH}
                    ${NATIVERENDER_ROOT_PATH}/include)

add_library(nativerender SHARED
            render/egl_core.cpp
            render/plugin_render.cpp
            manager/plugin_manager.cpp
            napi_init.cpp)

find_library(
    EGL-lib
    EGL
)

find_library(
    GLES-lib
    GLESv3
)

find_library(
    hilog-lib
    hilog_ndk.z
)

find_library(
    libace-lib
    ace_ndk.z
)

find_library(
    libnapi-lib
    ace_napi.z
)

find_library(
    libuv-lib
    uv
)

target_link_libraries(nativerender PUBLIC
                      ${EGL-lib}
                      ${GLES-lib}
                      ${hilog-lib}
                      ${libace-lib}
                      ${libnapi-lib}
                      ${libuv-lib}
                      libnative_window.so)