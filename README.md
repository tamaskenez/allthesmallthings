# ALLTHESMALLTHINGS

The `1_clone.sh` script clones, the `2_make.sh` script builds and installs the following libraries (to `${PWD}/i`)

- https://github.com/juce-framework/JUCE.git JUCE (headers installed to `i_juce` because I'm using JUCE as subdirectory)
- https://github.com/fmtlib/fmt.git fmt
- https://github.com/gflags/gflags.git gflags
- https://github.com/google/glog.git glog
- https://github.com/google/googletest.git googletest
- https://github.com/glfw/glfw.git glfw
- https://github.com/ocornut/imgui.git imgui (builds with local `CMakeLists.txt`, the library and few backends/examples)
- https://github.com/libsdl-org/SDL.git SDL
- https://github.com/libsdl-org/SDL_image.git SDL_image
- https://github.com/erincatto/box2d.git box2d
- https://github.com/avaneev/r8brain-free-src.git r8brain-free (local `CMakeLists.txt` incomplete)
- https://github.com/kfrlib/kfr.git kfr