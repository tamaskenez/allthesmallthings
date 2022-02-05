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

