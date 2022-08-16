# Compute the installation prefix relative to this file.
cmake_path(SET _IMPORT_PREFIX NORMALIZE "${CMAKE_CURRENT_LIST_FILE}/../../../..")

if(APPLE AND NOT IOS)
  add_library(steamaudio::steamaudio SHARED IMPORTED)
  set_property(TARGET steamaudio::steamaudio APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
  set_target_properties(steamaudio::steamaudio PROPERTIES
    INTERFACE_INCLUDE_DIRECTORIES "${_IMPORT_PREFIX}/include"
  )
  set_target_properties(steamaudio::steamaudio PROPERTIES
    IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/lib/libphonon.dylib"
    IMPORTED_SONAME_RELEASE "@rpath/libphonon.dylib"
  )
else()
  message(FATAL_ERROR "steamaudio-config.cmake does not support the current system yet.")
endif()
