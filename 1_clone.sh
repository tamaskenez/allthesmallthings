#!/usr/bin/env bash
set -euo pipefail

git_dep () {
    url="$1"
    name="$2"
    if [[ -n "${3+x}" ]]; then
    	branch="$3"
    else
    	branch=""
    fi
    if [[ -z "$url" ]]; then
        echo "git_dep: missing url (\$1)" >&2
        exit 1
    fi
    if [[ -z "$name" ]]; then
        echo "git_dep: missing dependency name (\$2)" >&2
        exit 1
    fi
    if [[ ! -d "d/$name" ]]; then
        if [[ -n "$branch" ]]; then
  		    echo -e "-- Cloning [$name]: git clone $url d/$name -b $branch"
        	git clone "$url" "d/$name" --depth 1 -b "$branch"
        else
            echo -e "-- Cloning [$name]: git clone $url d/$name"
        	git clone "$url" "d/$name" --depth 1
        fi
    else
        echo "-- cd d/$name"
        cd "d/$name"
        if [[ -n "$branch" ]]; then
            echo -e "-- git checkout $branch"
            git checkout "$branch"
        fi
        echo -e "-- Updating [$name]: git pull --ff-only"
        git pull --ff-only
        cd -
    fi
}

git_dep https://github.com/juce-framework/JUCE.git JUCE
git_dep https://github.com/fmtlib/fmt.git fmt
git_dep https://github.com/gflags/gflags.git gflags
git_dep https://github.com/google/glog.git glog
git_dep https://github.com/google/googletest.git googletest
git_dep https://github.com/glfw/glfw.git glfw
git_dep https://github.com/ocornut/imgui.git imgui
git_dep https://github.com/libsdl-org/SDL.git SDL
git_dep https://github.com/libsdl-org/SDL_image.git SDL_image
git_dep https://github.com/erincatto/box2d.git box2d
git_dep https://github.com/avaneev/r8brain-free-src.git r8brain-free
git_dep https://github.com/kfrlib/kfr.git kfr
git_dep https://github.com/abseil/abseil-cpp.git abseil
git_dep https://github.com/ddiakopoulos/libnyquist.git libnyquist
git_dep https://github.com/cameron314/readerwriterqueue.git readerwriterqueue
git_dep https://github.com/g-truc/glm.git glm
git_dep https://gitlab.com/libeigen/eigen.git eigen

rm -rf d/fftw3
readonly fftw_tarball_name='fftw-3.3.10'
tar -xf "${fftw_tarball_name}.tar.gz" -C d
mv "d/${fftw_tarball_name}" d/fftw3

readonly STEAMAUDIO_RELEASE='4.1.1'
readonly STEAMAUDIO_FILENAME_STEM="steamaudio_${STEAMAUDIO_RELEASE}"
if [[ ! -d "d/steamaudio" ]]; then
    exit 1
    rm ${STEAMAUDIO_FILENAME_STEM}.zip
    wget \
        https://github.com/ValveSoftware/steam-audio/releases/download/v${STEAMAUDIO_RELEASE}/${STEAMAUDIO_FILENAME_STEM}.zip
    unzip -q ${STEAMAUDIO_FILENAME_STEM}.zip -d d
    rm ${STEAMAUDIO_FILENAME_STEM}.zip
fi

