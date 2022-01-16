#!/usr/bin/env bash
set -euo pipefail

export CMAKE_BUILD_PARALLEL_LEVEL=1

if false; then
	cmake -Hd/JUCE -Bb/JUCE -GXcode -DCMAKE_INSTALL_PREFIX=$PWD/i \
		-DJUCE_BUILD_EXAMPLES=0 -DJUCE_BUILD_EXTRAS=0 -DJUCE_ENABLE_MODULE_SOURCE_GROUPS=1	
	cmake --build b/JUCE --config Debug --target install
fi

cmake -Hd/gflags -Bb/gflags -DCMAKE_INSTALL_PREFIX=$PWD/i \
	-DBUILD_STATIC_LIBS=1 \
	-DBUILD_gflags_nothreads_LIB=0 \
	-DREGISTER_INSTALL_PREFIX=0
cmake --build b/gflags --config Release --target install

cmake -Hd/glog -Bb/glog -DCMAKE_INSTALL_PREFIX=$PWD/i \
	-DBUILD_SHARED_LIBS=0 \
	-DWITH_GTEST=0 \
	-DWITH_PKGCONFIG=0
cmake --build b/glog --config Release --target install

cmake -Hd/fmt -Bb/fmt -DCMAKE_INSTALL_PREFIX=$PWD/i \
	-DFMT_TEST=0 -DFMT_DOC=0
cmake --build b/fmt --config Release --target install
