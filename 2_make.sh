#!/usr/bin/env bash
set -euo pipefail

if false; then
	cmake -Hd/JUCE -Bb/JUCE -GXcode -DCMAKE_INSTALL_PREFIX=$PWD/i \
		-DJUCE_BUILD_EXAMPLES=0 -DJUCE_BUILD_EXTRAS=0 -DJUCE_ENABLE_MODULE_SOURCE_GROUPS=1	
	cmake --build b/JUCE --config Debug --target install -j8
fi

cmake -Hd/gflags -Bb/gflags -DCMAKE_INSTALL_PREFIX=$PWD/i \
	-DBUILD_STATIC_LIBS=1 \
	-DBUILD_gflags_nothreads_LIB=0 \
	-DREGISTER_INSTALL_PREFIX=0
cmake --build b/gflags --config Release --target install -j8

cmake -Hd/glog -Bb/glog -DCMAKE_INSTALL_PREFIX=$PWD/i \
	-DBUILD_SHARED_LIBS=0 \
	-DWITH_GTEST=0 \
	-DWITH_PKGCONFIG=0
cmake --build b/glog --config Release --target install -j8
