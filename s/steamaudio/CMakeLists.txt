cmake_minimum_required(VERSION 3.20)
project(steamaudio)

if(NOT STEAMAUDIO_DIR)
    message(FATAL_ERROR "STEAMAUDIO_DIR must be set to the steamaudio root directory")
endif()

set(ROOT ${STEAMAUDIO_DIR})

file(GLOB HEADERS CONFIGURE_DEPENDS ${ROOT}/include/*)

if(APPLE AND NOT IOS)
    set(LIBS ${ROOT}/lib/osx/libphonon.dylib)
else()
  message(FATAL_ERROR "This steamaudio cmake installer does not support the current system yet.")
endif()

install(FILES steamaudio-config.cmake DESTINATION lib/cmake/steamaudio)
install(FILES ${HEADERS} DESTINATION include)
install(FILES ${LIBS} DESTINATION lib)
