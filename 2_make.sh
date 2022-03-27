#!/usr/bin/env bash
set -euo pipefail

export CMAKE_BUILD_PARALLEL_LEVEL=8

if true; then
	cmake -Hd/JUCE -Bb/JUCE -GXcode -DCMAKE_INSTALL_PREFIX=$PWD/i_juce \
		-DJUCE_BUILD_EXAMPLES=1 -DJUCE_BUILD_EXTRAS=1 -DJUCE_ENABLE_MODULE_SOURCE_GROUPS=1	
	cmake --build b/JUCE --config Debug --target install
fi

cmake -Hd/gflags -Bb/gflags -DCMAKE_INSTALL_PREFIX=$PWD/i \
	-DCMAKE_BUILD_TYPE=Release \
	-DBUILD_STATIC_LIBS=1 \
	-DBUILD_gflags_nothreads_LIB=0 \
	-DREGISTER_INSTALL_PREFIX=0
cmake --build b/gflags --target install


cmake -Hd/googletest -Bb/googletest -DCMAKE_INSTALL_PREFIX=$PWD/i \
	-DCMAKE_BUILD_TYPE=Release
cmake --build b/googletest --target install

cmake -Hd/glog -Bb/glog -DCMAKE_INSTALL_PREFIX=$PWD/i \
	-DCMAKE_BUILD_TYPE=Release \
	-DBUILD_SHARED_LIBS=0 \
	-DWITH_GTEST=1 \
	-DWITH_PKGCONFIG=0
cmake --build b/glog --target install

cmake -Hd/fmt -Bb/fmt -DCMAKE_INSTALL_PREFIX=$PWD/i \
	-DCMAKE_BUILD_TYPE=Release \
	-DFMT_TEST=0 -DFMT_DOC=0
cmake --build b/fmt --target install

cmake -Hd/glfw -Bb/glfw -DCMAKE_INSTALL_PREFIX=$PWD/i \
	-DCMAKE_BUILD_TYPE=Release \
	-DGLFW_BUILD_EXAMPLES=0 \
	-DGLFW_BUILD_TESTS=0
cmake --build b/glfw --target install

rm -rf b/SDL
cmake -Hd/SDL -Bb/SDL -DCMAKE_INSTALL_PREFIX=$PWD/i -DCMAKE_DEBUG_POSTFIX=d \
	-DSDL_SHARED=0 -DSDL_TEST=0 -DCMAKE_BUILD_TYPE=Release
cmake --build b/SDL --config Release --target install
cmake --build b/SDL --config Debug --target install


cmake -Hd/SDL_image -Bb/SDL_image -DCMAKE_INSTALL_PREFIX=$PWD/i -DCMAKE_DEBUG_POSTFIX=d \
	-DCMAKE_BUILD_TYPE=Release \
	-DSUPPORT_JPG=0 -DBUILD_SHARED_LIBS=0
cmake --build b/SDL_image --target install

cmake -Hd/box2d -Bb/box2d -GXcode -DCMAKE_INSTALL_PREFIX=$PWD/i -DCMAKE_DEBUG_POSTFIX=d \
	-DBOX2D_BUILD_UNIT_TESTS=0 -DBOX2D_BUILD_TESTBED=0
cmake --build b/box2d --config Debug --target install
cmake --build b/box2d --config Release --target install

cmake -Hs/imgui -Bb/imgui -GXcode -DCMAKE_PREFIX_PATH=$PWD/i -DCMAKE_INSTALL_PREFIX=$PWD/i \
	-DIMGUI_DIR=$PWD/d/imgui
cmake --build b/imgui --config Debug --target install
cmake --build b/imgui --config Release --target install

cmake -Hs/r8brain-free -Bb/r8brain-free -GXcode -DCMAKE_PREFIX_PATH=$PWD/i -DCMAKE_INSTALL_PREFIX=$PWD/i \
	-DROOT=$PWD/d/r8brain-free
cmake --build b/r8brain-free --config Debug --target install
cmake --build b/r8brain-free --config Release --target install


cmake -Hd/kfr -Bb/kfr -GXcode -DCMAKE_PREFIX_PATH=$PWD/i -DCMAKE_INSTALL_PREFIX=$PWD/i \
	-DKFR_STD_COMPLEX=1 -DCMAKE_DEBUG_POSTFIX=d
cmake --build b/kfr --config Debug --target install
cmake --build b/kfr --config Release --target install


cmake -Hd/fftw3 -Bb/fftw3 -GXcode -DCMAKE_PREFIX_PATH=$PWD/i -DCMAKE_INSTALL_PREFIX=$PWD/i -DCMAKE_DEBUG_POSTFIX=_d \
	-DBUILD_SHARED_LIBS=0 -DBUILD_TESTS=0 -DDISABLE_FORTRAN=1 \
	-DENABLE_AVX=1 -DENABLE_AVX2=1 -DENABLE_FLOAT=0 -DENABLE_SSE=1 -DENABLE_SSE2=1
cmake --build b/fftw3 --config Debug --target install
cmake --build b/fftw3 --config Release --target install

cmake -Hd/fftw3 -Bb/fftw3f -GXcode -DCMAKE_PREFIX_PATH=$PWD/i -DCMAKE_INSTALL_PREFIX=$PWD/i -DCMAKE_DEBUG_POSTFIX=_d \
	-DBUILD_SHARED_LIBS=0 -DBUILD_TESTS=0 -DDISABLE_FORTRAN=1 \
	-DENABLE_AVX=1 -DENABLE_AVX2=1 -DENABLE_FLOAT=1 -DENABLE_SSE=1 -DENABLE_SSE2=1
cmake --build b/fftw3f --config Debug --target install
cmake --build b/fftw3f --config Release --target install

cmake -Hd/abseil -Bb/abseil -GXcode -DCMAKE_PREFIX_PATH=$PWD/i -DCMAKE_INSTALL_PREFIX=$PWD/i \
	-DCMAKE_CXX_STANDARD=20 -DABSL_PROPAGATE_CXX_STD=1 -DBUILD_TESTING=0 -DABSL_LOCAL_GOOGLETEST_DIR=$PWD/d/googletest \
	-DCMAKE_DEBUG_POSTFIX=d
cmake --build b/abseil --config Debug --target install
cmake --build b/abseil --config Release --target install

