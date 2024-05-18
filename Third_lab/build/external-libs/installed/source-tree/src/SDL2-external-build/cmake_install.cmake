# Install script for directory: D:/labexample/build/external-libs/installed/source-tree/src/SDL2-external

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "D:/labexample/build/external-libs/installed")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "Release")
  endif()
  message(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
endif()

# Set the component getting installed.
if(NOT CMAKE_INSTALL_COMPONENT)
  if(COMPONENT)
    message(STATUS "Install component: \"${COMPONENT}\"")
    set(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  else()
    set(CMAKE_INSTALL_COMPONENT)
  endif()
endif()

# Is this installation the result of a crosscompile?
if(NOT DEFINED CMAKE_CROSSCOMPILING)
  set(CMAKE_CROSSCOMPILING "FALSE")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  if(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Dd][Ee][Bb][Uu][Gg])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY FILES "D:/labexample/build/external-libs/installed/source-tree/src/SDL2-external-build/Debug/SDL2maind.lib")
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Rr][Ee][Ll][Ee][Aa][Ss][Ee])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY FILES "D:/labexample/build/external-libs/installed/source-tree/src/SDL2-external-build/Release/SDL2main.lib")
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Mm][Ii][Nn][Ss][Ii][Zz][Ee][Rr][Ee][Ll])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY FILES "D:/labexample/build/external-libs/installed/source-tree/src/SDL2-external-build/MinSizeRel/SDL2main.lib")
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Rr][Ee][Ll][Ww][Ii][Tt][Hh][Dd][Ee][Bb][Ii][Nn][Ff][Oo])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY FILES "D:/labexample/build/external-libs/installed/source-tree/src/SDL2-external-build/RelWithDebInfo/SDL2main.lib")
  endif()
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  if(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Dd][Ee][Bb][Uu][Gg])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY FILES "D:/labexample/build/external-libs/installed/source-tree/src/SDL2-external-build/Debug/SDL2-staticd.lib")
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Rr][Ee][Ll][Ee][Aa][Ss][Ee])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY FILES "D:/labexample/build/external-libs/installed/source-tree/src/SDL2-external-build/Release/SDL2-static.lib")
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Mm][Ii][Nn][Ss][Ii][Zz][Ee][Rr][Ee][Ll])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY FILES "D:/labexample/build/external-libs/installed/source-tree/src/SDL2-external-build/MinSizeRel/SDL2-static.lib")
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Rr][Ee][Ll][Ww][Ii][Tt][Hh][Dd][Ee][Bb][Ii][Nn][Ff][Oo])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY FILES "D:/labexample/build/external-libs/installed/source-tree/src/SDL2-external-build/RelWithDebInfo/SDL2-static.lib")
  endif()
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  if(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Dd][Ee][Bb][Uu][Gg])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY FILES "D:/labexample/build/external-libs/installed/source-tree/src/SDL2-external-build/Debug/SDL2_test.lib")
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Rr][Ee][Ll][Ee][Aa][Ss][Ee])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY FILES "D:/labexample/build/external-libs/installed/source-tree/src/SDL2-external-build/Release/SDL2_test.lib")
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Mm][Ii][Nn][Ss][Ii][Zz][Ee][Rr][Ee][Ll])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY FILES "D:/labexample/build/external-libs/installed/source-tree/src/SDL2-external-build/MinSizeRel/SDL2_test.lib")
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Rr][Ee][Ll][Ww][Ii][Tt][Hh][Dd][Ee][Bb][Ii][Nn][Ff][Oo])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY FILES "D:/labexample/build/external-libs/installed/source-tree/src/SDL2-external-build/RelWithDebInfo/SDL2_test.lib")
  endif()
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/cmake/SDL2mainTargets.cmake")
    file(DIFFERENT _cmake_export_file_changed FILES
         "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/cmake/SDL2mainTargets.cmake"
         "D:/labexample/build/external-libs/installed/source-tree/src/SDL2-external-build/CMakeFiles/Export/272ceadb8458515b2ae4b5630a6029cc/SDL2mainTargets.cmake")
    if(_cmake_export_file_changed)
      file(GLOB _cmake_old_config_files "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/cmake/SDL2mainTargets-*.cmake")
      if(_cmake_old_config_files)
        string(REPLACE ";" ", " _cmake_old_config_files_text "${_cmake_old_config_files}")
        message(STATUS "Old export file \"$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/cmake/SDL2mainTargets.cmake\" will be replaced.  Removing files [${_cmake_old_config_files_text}].")
        unset(_cmake_old_config_files_text)
        file(REMOVE ${_cmake_old_config_files})
      endif()
      unset(_cmake_old_config_files)
    endif()
    unset(_cmake_export_file_changed)
  endif()
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/cmake" TYPE FILE FILES "D:/labexample/build/external-libs/installed/source-tree/src/SDL2-external-build/CMakeFiles/Export/272ceadb8458515b2ae4b5630a6029cc/SDL2mainTargets.cmake")
  if(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Dd][Ee][Bb][Uu][Gg])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/cmake" TYPE FILE FILES "D:/labexample/build/external-libs/installed/source-tree/src/SDL2-external-build/CMakeFiles/Export/272ceadb8458515b2ae4b5630a6029cc/SDL2mainTargets-debug.cmake")
  endif()
  if(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Mm][Ii][Nn][Ss][Ii][Zz][Ee][Rr][Ee][Ll])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/cmake" TYPE FILE FILES "D:/labexample/build/external-libs/installed/source-tree/src/SDL2-external-build/CMakeFiles/Export/272ceadb8458515b2ae4b5630a6029cc/SDL2mainTargets-minsizerel.cmake")
  endif()
  if(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Rr][Ee][Ll][Ww][Ii][Tt][Hh][Dd][Ee][Bb][Ii][Nn][Ff][Oo])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/cmake" TYPE FILE FILES "D:/labexample/build/external-libs/installed/source-tree/src/SDL2-external-build/CMakeFiles/Export/272ceadb8458515b2ae4b5630a6029cc/SDL2mainTargets-relwithdebinfo.cmake")
  endif()
  if(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Rr][Ee][Ll][Ee][Aa][Ss][Ee])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/cmake" TYPE FILE FILES "D:/labexample/build/external-libs/installed/source-tree/src/SDL2-external-build/CMakeFiles/Export/272ceadb8458515b2ae4b5630a6029cc/SDL2mainTargets-release.cmake")
  endif()
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/cmake/SDL2staticTargets.cmake")
    file(DIFFERENT _cmake_export_file_changed FILES
         "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/cmake/SDL2staticTargets.cmake"
         "D:/labexample/build/external-libs/installed/source-tree/src/SDL2-external-build/CMakeFiles/Export/272ceadb8458515b2ae4b5630a6029cc/SDL2staticTargets.cmake")
    if(_cmake_export_file_changed)
      file(GLOB _cmake_old_config_files "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/cmake/SDL2staticTargets-*.cmake")
      if(_cmake_old_config_files)
        string(REPLACE ";" ", " _cmake_old_config_files_text "${_cmake_old_config_files}")
        message(STATUS "Old export file \"$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/cmake/SDL2staticTargets.cmake\" will be replaced.  Removing files [${_cmake_old_config_files_text}].")
        unset(_cmake_old_config_files_text)
        file(REMOVE ${_cmake_old_config_files})
      endif()
      unset(_cmake_old_config_files)
    endif()
    unset(_cmake_export_file_changed)
  endif()
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/cmake" TYPE FILE FILES "D:/labexample/build/external-libs/installed/source-tree/src/SDL2-external-build/CMakeFiles/Export/272ceadb8458515b2ae4b5630a6029cc/SDL2staticTargets.cmake")
  if(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Dd][Ee][Bb][Uu][Gg])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/cmake" TYPE FILE FILES "D:/labexample/build/external-libs/installed/source-tree/src/SDL2-external-build/CMakeFiles/Export/272ceadb8458515b2ae4b5630a6029cc/SDL2staticTargets-debug.cmake")
  endif()
  if(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Mm][Ii][Nn][Ss][Ii][Zz][Ee][Rr][Ee][Ll])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/cmake" TYPE FILE FILES "D:/labexample/build/external-libs/installed/source-tree/src/SDL2-external-build/CMakeFiles/Export/272ceadb8458515b2ae4b5630a6029cc/SDL2staticTargets-minsizerel.cmake")
  endif()
  if(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Rr][Ee][Ll][Ww][Ii][Tt][Hh][Dd][Ee][Bb][Ii][Nn][Ff][Oo])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/cmake" TYPE FILE FILES "D:/labexample/build/external-libs/installed/source-tree/src/SDL2-external-build/CMakeFiles/Export/272ceadb8458515b2ae4b5630a6029cc/SDL2staticTargets-relwithdebinfo.cmake")
  endif()
  if(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Rr][Ee][Ll][Ee][Aa][Ss][Ee])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/cmake" TYPE FILE FILES "D:/labexample/build/external-libs/installed/source-tree/src/SDL2-external-build/CMakeFiles/Export/272ceadb8458515b2ae4b5630a6029cc/SDL2staticTargets-release.cmake")
  endif()
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/cmake/SDL2testTargets.cmake")
    file(DIFFERENT _cmake_export_file_changed FILES
         "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/cmake/SDL2testTargets.cmake"
         "D:/labexample/build/external-libs/installed/source-tree/src/SDL2-external-build/CMakeFiles/Export/272ceadb8458515b2ae4b5630a6029cc/SDL2testTargets.cmake")
    if(_cmake_export_file_changed)
      file(GLOB _cmake_old_config_files "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/cmake/SDL2testTargets-*.cmake")
      if(_cmake_old_config_files)
        string(REPLACE ";" ", " _cmake_old_config_files_text "${_cmake_old_config_files}")
        message(STATUS "Old export file \"$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/cmake/SDL2testTargets.cmake\" will be replaced.  Removing files [${_cmake_old_config_files_text}].")
        unset(_cmake_old_config_files_text)
        file(REMOVE ${_cmake_old_config_files})
      endif()
      unset(_cmake_old_config_files)
    endif()
    unset(_cmake_export_file_changed)
  endif()
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/cmake" TYPE FILE FILES "D:/labexample/build/external-libs/installed/source-tree/src/SDL2-external-build/CMakeFiles/Export/272ceadb8458515b2ae4b5630a6029cc/SDL2testTargets.cmake")
  if(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Dd][Ee][Bb][Uu][Gg])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/cmake" TYPE FILE FILES "D:/labexample/build/external-libs/installed/source-tree/src/SDL2-external-build/CMakeFiles/Export/272ceadb8458515b2ae4b5630a6029cc/SDL2testTargets-debug.cmake")
  endif()
  if(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Mm][Ii][Nn][Ss][Ii][Zz][Ee][Rr][Ee][Ll])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/cmake" TYPE FILE FILES "D:/labexample/build/external-libs/installed/source-tree/src/SDL2-external-build/CMakeFiles/Export/272ceadb8458515b2ae4b5630a6029cc/SDL2testTargets-minsizerel.cmake")
  endif()
  if(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Rr][Ee][Ll][Ww][Ii][Tt][Hh][Dd][Ee][Bb][Ii][Nn][Ff][Oo])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/cmake" TYPE FILE FILES "D:/labexample/build/external-libs/installed/source-tree/src/SDL2-external-build/CMakeFiles/Export/272ceadb8458515b2ae4b5630a6029cc/SDL2testTargets-relwithdebinfo.cmake")
  endif()
  if(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Rr][Ee][Ll][Ee][Aa][Ss][Ee])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/cmake" TYPE FILE FILES "D:/labexample/build/external-libs/installed/source-tree/src/SDL2-external-build/CMakeFiles/Export/272ceadb8458515b2ae4b5630a6029cc/SDL2testTargets-release.cmake")
  endif()
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Devel" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/cmake" TYPE FILE FILES
    "D:/labexample/build/external-libs/installed/source-tree/src/SDL2-external-build/SDL2Config.cmake"
    "D:/labexample/build/external-libs/installed/source-tree/src/SDL2-external-build/SDL2ConfigVersion.cmake"
    )
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  if(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Dd][Ee][Bb][Uu][Gg])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/SDL2" TYPE FILE FILES
      "D:/labexample/build/external-libs/installed/source-tree/src/SDL2-external/include/SDL.h"
      "D:/labexample/build/external-libs/installed/source-tree/src/SDL2-external/include/SDL_assert.h"
      "D:/labexample/build/external-libs/installed/source-tree/src/SDL2-external/include/SDL_atomic.h"
      "D:/labexample/build/external-libs/installed/source-tree/src/SDL2-external/include/SDL_audio.h"
      "D:/labexample/build/external-libs/installed/source-tree/src/SDL2-external/include/SDL_bits.h"
      "D:/labexample/build/external-libs/installed/source-tree/src/SDL2-external/include/SDL_blendmode.h"
      "D:/labexample/build/external-libs/installed/source-tree/src/SDL2-external/include/SDL_clipboard.h"
      "D:/labexample/build/external-libs/installed/source-tree/src/SDL2-external/include/SDL_copying.h"
      "D:/labexample/build/external-libs/installed/source-tree/src/SDL2-external/include/SDL_cpuinfo.h"
      "D:/labexample/build/external-libs/installed/source-tree/src/SDL2-external/include/SDL_egl.h"
      "D:/labexample/build/external-libs/installed/source-tree/src/SDL2-external/include/SDL_endian.h"
      "D:/labexample/build/external-libs/installed/source-tree/src/SDL2-external/include/SDL_error.h"
      "D:/labexample/build/external-libs/installed/source-tree/src/SDL2-external/include/SDL_events.h"
      "D:/labexample/build/external-libs/installed/source-tree/src/SDL2-external/include/SDL_filesystem.h"
      "D:/labexample/build/external-libs/installed/source-tree/src/SDL2-external/include/SDL_gamecontroller.h"
      "D:/labexample/build/external-libs/installed/source-tree/src/SDL2-external/include/SDL_gesture.h"
      "D:/labexample/build/external-libs/installed/source-tree/src/SDL2-external/include/SDL_guid.h"
      "D:/labexample/build/external-libs/installed/source-tree/src/SDL2-external/include/SDL_haptic.h"
      "D:/labexample/build/external-libs/installed/source-tree/src/SDL2-external/include/SDL_hidapi.h"
      "D:/labexample/build/external-libs/installed/source-tree/src/SDL2-external/include/SDL_hints.h"
      "D:/labexample/build/external-libs/installed/source-tree/src/SDL2-external/include/SDL_joystick.h"
      "D:/labexample/build/external-libs/installed/source-tree/src/SDL2-external/include/SDL_keyboard.h"
      "D:/labexample/build/external-libs/installed/source-tree/src/SDL2-external/include/SDL_keycode.h"
      "D:/labexample/build/external-libs/installed/source-tree/src/SDL2-external/include/SDL_loadso.h"
      "D:/labexample/build/external-libs/installed/source-tree/src/SDL2-external/include/SDL_locale.h"
      "D:/labexample/build/external-libs/installed/source-tree/src/SDL2-external/include/SDL_log.h"
      "D:/labexample/build/external-libs/installed/source-tree/src/SDL2-external/include/SDL_main.h"
      "D:/labexample/build/external-libs/installed/source-tree/src/SDL2-external/include/SDL_messagebox.h"
      "D:/labexample/build/external-libs/installed/source-tree/src/SDL2-external/include/SDL_metal.h"
      "D:/labexample/build/external-libs/installed/source-tree/src/SDL2-external/include/SDL_misc.h"
      "D:/labexample/build/external-libs/installed/source-tree/src/SDL2-external/include/SDL_mouse.h"
      "D:/labexample/build/external-libs/installed/source-tree/src/SDL2-external/include/SDL_mutex.h"
      "D:/labexample/build/external-libs/installed/source-tree/src/SDL2-external/include/SDL_name.h"
      "D:/labexample/build/external-libs/installed/source-tree/src/SDL2-external/include/SDL_opengl.h"
      "D:/labexample/build/external-libs/installed/source-tree/src/SDL2-external/include/SDL_opengl_glext.h"
      "D:/labexample/build/external-libs/installed/source-tree/src/SDL2-external/include/SDL_opengles.h"
      "D:/labexample/build/external-libs/installed/source-tree/src/SDL2-external/include/SDL_opengles2.h"
      "D:/labexample/build/external-libs/installed/source-tree/src/SDL2-external/include/SDL_opengles2_gl2.h"
      "D:/labexample/build/external-libs/installed/source-tree/src/SDL2-external/include/SDL_opengles2_gl2ext.h"
      "D:/labexample/build/external-libs/installed/source-tree/src/SDL2-external/include/SDL_opengles2_gl2platform.h"
      "D:/labexample/build/external-libs/installed/source-tree/src/SDL2-external/include/SDL_opengles2_khrplatform.h"
      "D:/labexample/build/external-libs/installed/source-tree/src/SDL2-external/include/SDL_pixels.h"
      "D:/labexample/build/external-libs/installed/source-tree/src/SDL2-external/include/SDL_platform.h"
      "D:/labexample/build/external-libs/installed/source-tree/src/SDL2-external/include/SDL_power.h"
      "D:/labexample/build/external-libs/installed/source-tree/src/SDL2-external/include/SDL_quit.h"
      "D:/labexample/build/external-libs/installed/source-tree/src/SDL2-external/include/SDL_rect.h"
      "D:/labexample/build/external-libs/installed/source-tree/src/SDL2-external/include/SDL_render.h"
      "D:/labexample/build/external-libs/installed/source-tree/src/SDL2-external/include/SDL_rwops.h"
      "D:/labexample/build/external-libs/installed/source-tree/src/SDL2-external/include/SDL_scancode.h"
      "D:/labexample/build/external-libs/installed/source-tree/src/SDL2-external/include/SDL_sensor.h"
      "D:/labexample/build/external-libs/installed/source-tree/src/SDL2-external/include/SDL_shape.h"
      "D:/labexample/build/external-libs/installed/source-tree/src/SDL2-external/include/SDL_stdinc.h"
      "D:/labexample/build/external-libs/installed/source-tree/src/SDL2-external/include/SDL_surface.h"
      "D:/labexample/build/external-libs/installed/source-tree/src/SDL2-external/include/SDL_system.h"
      "D:/labexample/build/external-libs/installed/source-tree/src/SDL2-external/include/SDL_syswm.h"
      "D:/labexample/build/external-libs/installed/source-tree/src/SDL2-external/include/SDL_test.h"
      "D:/labexample/build/external-libs/installed/source-tree/src/SDL2-external/include/SDL_test_assert.h"
      "D:/labexample/build/external-libs/installed/source-tree/src/SDL2-external/include/SDL_test_common.h"
      "D:/labexample/build/external-libs/installed/source-tree/src/SDL2-external/include/SDL_test_compare.h"
      "D:/labexample/build/external-libs/installed/source-tree/src/SDL2-external/include/SDL_test_crc32.h"
      "D:/labexample/build/external-libs/installed/source-tree/src/SDL2-external/include/SDL_test_font.h"
      "D:/labexample/build/external-libs/installed/source-tree/src/SDL2-external/include/SDL_test_fuzzer.h"
      "D:/labexample/build/external-libs/installed/source-tree/src/SDL2-external/include/SDL_test_harness.h"
      "D:/labexample/build/external-libs/installed/source-tree/src/SDL2-external/include/SDL_test_images.h"
      "D:/labexample/build/external-libs/installed/source-tree/src/SDL2-external/include/SDL_test_log.h"
      "D:/labexample/build/external-libs/installed/source-tree/src/SDL2-external/include/SDL_test_md5.h"
      "D:/labexample/build/external-libs/installed/source-tree/src/SDL2-external/include/SDL_test_memory.h"
      "D:/labexample/build/external-libs/installed/source-tree/src/SDL2-external/include/SDL_test_random.h"
      "D:/labexample/build/external-libs/installed/source-tree/src/SDL2-external/include/SDL_thread.h"
      "D:/labexample/build/external-libs/installed/source-tree/src/SDL2-external/include/SDL_timer.h"
      "D:/labexample/build/external-libs/installed/source-tree/src/SDL2-external/include/SDL_touch.h"
      "D:/labexample/build/external-libs/installed/source-tree/src/SDL2-external/include/SDL_types.h"
      "D:/labexample/build/external-libs/installed/source-tree/src/SDL2-external/include/SDL_version.h"
      "D:/labexample/build/external-libs/installed/source-tree/src/SDL2-external/include/SDL_video.h"
      "D:/labexample/build/external-libs/installed/source-tree/src/SDL2-external/include/SDL_vulkan.h"
      "D:/labexample/build/external-libs/installed/source-tree/src/SDL2-external/include/begin_code.h"
      "D:/labexample/build/external-libs/installed/source-tree/src/SDL2-external/include/close_code.h"
      "D:/labexample/build/external-libs/installed/source-tree/src/SDL2-external-build/include/SDL_revision.h"
      "D:/labexample/build/external-libs/installed/source-tree/src/SDL2-external-build/include-config-debug/SDL_config.h"
      )
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Rr][Ee][Ll][Ee][Aa][Ss][Ee])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/SDL2" TYPE FILE FILES
      "D:/labexample/build/external-libs/installed/source-tree/src/SDL2-external/include/SDL.h"
      "D:/labexample/build/external-libs/installed/source-tree/src/SDL2-external/include/SDL_assert.h"
      "D:/labexample/build/external-libs/installed/source-tree/src/SDL2-external/include/SDL_atomic.h"
      "D:/labexample/build/external-libs/installed/source-tree/src/SDL2-external/include/SDL_audio.h"
      "D:/labexample/build/external-libs/installed/source-tree/src/SDL2-external/include/SDL_bits.h"
      "D:/labexample/build/external-libs/installed/source-tree/src/SDL2-external/include/SDL_blendmode.h"
      "D:/labexample/build/external-libs/installed/source-tree/src/SDL2-external/include/SDL_clipboard.h"
      "D:/labexample/build/external-libs/installed/source-tree/src/SDL2-external/include/SDL_copying.h"
      "D:/labexample/build/external-libs/installed/source-tree/src/SDL2-external/include/SDL_cpuinfo.h"
      "D:/labexample/build/external-libs/installed/source-tree/src/SDL2-external/include/SDL_egl.h"
      "D:/labexample/build/external-libs/installed/source-tree/src/SDL2-external/include/SDL_endian.h"
      "D:/labexample/build/external-libs/installed/source-tree/src/SDL2-external/include/SDL_error.h"
      "D:/labexample/build/external-libs/installed/source-tree/src/SDL2-external/include/SDL_events.h"
      "D:/labexample/build/external-libs/installed/source-tree/src/SDL2-external/include/SDL_filesystem.h"
      "D:/labexample/build/external-libs/installed/source-tree/src/SDL2-external/include/SDL_gamecontroller.h"
      "D:/labexample/build/external-libs/installed/source-tree/src/SDL2-external/include/SDL_gesture.h"
      "D:/labexample/build/external-libs/installed/source-tree/src/SDL2-external/include/SDL_guid.h"
      "D:/labexample/build/external-libs/installed/source-tree/src/SDL2-external/include/SDL_haptic.h"
      "D:/labexample/build/external-libs/installed/source-tree/src/SDL2-external/include/SDL_hidapi.h"
      "D:/labexample/build/external-libs/installed/source-tree/src/SDL2-external/include/SDL_hints.h"
      "D:/labexample/build/external-libs/installed/source-tree/src/SDL2-external/include/SDL_joystick.h"
      "D:/labexample/build/external-libs/installed/source-tree/src/SDL2-external/include/SDL_keyboard.h"
      "D:/labexample/build/external-libs/installed/source-tree/src/SDL2-external/include/SDL_keycode.h"
      "D:/labexample/build/external-libs/installed/source-tree/src/SDL2-external/include/SDL_loadso.h"
      "D:/labexample/build/external-libs/installed/source-tree/src/SDL2-external/include/SDL_locale.h"
      "D:/labexample/build/external-libs/installed/source-tree/src/SDL2-external/include/SDL_log.h"
      "D:/labexample/build/external-libs/installed/source-tree/src/SDL2-external/include/SDL_main.h"
      "D:/labexample/build/external-libs/installed/source-tree/src/SDL2-external/include/SDL_messagebox.h"
      "D:/labexample/build/external-libs/installed/source-tree/src/SDL2-external/include/SDL_metal.h"
      "D:/labexample/build/external-libs/installed/source-tree/src/SDL2-external/include/SDL_misc.h"
      "D:/labexample/build/external-libs/installed/source-tree/src/SDL2-external/include/SDL_mouse.h"
      "D:/labexample/build/external-libs/installed/source-tree/src/SDL2-external/include/SDL_mutex.h"
      "D:/labexample/build/external-libs/installed/source-tree/src/SDL2-external/include/SDL_name.h"
      "D:/labexample/build/external-libs/installed/source-tree/src/SDL2-external/include/SDL_opengl.h"
      "D:/labexample/build/external-libs/installed/source-tree/src/SDL2-external/include/SDL_opengl_glext.h"
      "D:/labexample/build/external-libs/installed/source-tree/src/SDL2-external/include/SDL_opengles.h"
      "D:/labexample/build/external-libs/installed/source-tree/src/SDL2-external/include/SDL_opengles2.h"
      "D:/labexample/build/external-libs/installed/source-tree/src/SDL2-external/include/SDL_opengles2_gl2.h"
      "D:/labexample/build/external-libs/installed/source-tree/src/SDL2-external/include/SDL_opengles2_gl2ext.h"
      "D:/labexample/build/external-libs/installed/source-tree/src/SDL2-external/include/SDL_opengles2_gl2platform.h"
      "D:/labexample/build/external-libs/installed/source-tree/src/SDL2-external/include/SDL_opengles2_khrplatform.h"
      "D:/labexample/build/external-libs/installed/source-tree/src/SDL2-external/include/SDL_pixels.h"
      "D:/labexample/build/external-libs/installed/source-tree/src/SDL2-external/include/SDL_platform.h"
      "D:/labexample/build/external-libs/installed/source-tree/src/SDL2-external/include/SDL_power.h"
      "D:/labexample/build/external-libs/installed/source-tree/src/SDL2-external/include/SDL_quit.h"
      "D:/labexample/build/external-libs/installed/source-tree/src/SDL2-external/include/SDL_rect.h"
      "D:/labexample/build/external-libs/installed/source-tree/src/SDL2-external/include/SDL_render.h"
      "D:/labexample/build/external-libs/installed/source-tree/src/SDL2-external/include/SDL_rwops.h"
      "D:/labexample/build/external-libs/installed/source-tree/src/SDL2-external/include/SDL_scancode.h"
      "D:/labexample/build/external-libs/installed/source-tree/src/SDL2-external/include/SDL_sensor.h"
      "D:/labexample/build/external-libs/installed/source-tree/src/SDL2-external/include/SDL_shape.h"
      "D:/labexample/build/external-libs/installed/source-tree/src/SDL2-external/include/SDL_stdinc.h"
      "D:/labexample/build/external-libs/installed/source-tree/src/SDL2-external/include/SDL_surface.h"
      "D:/labexample/build/external-libs/installed/source-tree/src/SDL2-external/include/SDL_system.h"
      "D:/labexample/build/external-libs/installed/source-tree/src/SDL2-external/include/SDL_syswm.h"
      "D:/labexample/build/external-libs/installed/source-tree/src/SDL2-external/include/SDL_test.h"
      "D:/labexample/build/external-libs/installed/source-tree/src/SDL2-external/include/SDL_test_assert.h"
      "D:/labexample/build/external-libs/installed/source-tree/src/SDL2-external/include/SDL_test_common.h"
      "D:/labexample/build/external-libs/installed/source-tree/src/SDL2-external/include/SDL_test_compare.h"
      "D:/labexample/build/external-libs/installed/source-tree/src/SDL2-external/include/SDL_test_crc32.h"
      "D:/labexample/build/external-libs/installed/source-tree/src/SDL2-external/include/SDL_test_font.h"
      "D:/labexample/build/external-libs/installed/source-tree/src/SDL2-external/include/SDL_test_fuzzer.h"
      "D:/labexample/build/external-libs/installed/source-tree/src/SDL2-external/include/SDL_test_harness.h"
      "D:/labexample/build/external-libs/installed/source-tree/src/SDL2-external/include/SDL_test_images.h"
      "D:/labexample/build/external-libs/installed/source-tree/src/SDL2-external/include/SDL_test_log.h"
      "D:/labexample/build/external-libs/installed/source-tree/src/SDL2-external/include/SDL_test_md5.h"
      "D:/labexample/build/external-libs/installed/source-tree/src/SDL2-external/include/SDL_test_memory.h"
      "D:/labexample/build/external-libs/installed/source-tree/src/SDL2-external/include/SDL_test_random.h"
      "D:/labexample/build/external-libs/installed/source-tree/src/SDL2-external/include/SDL_thread.h"
      "D:/labexample/build/external-libs/installed/source-tree/src/SDL2-external/include/SDL_timer.h"
      "D:/labexample/build/external-libs/installed/source-tree/src/SDL2-external/include/SDL_touch.h"
      "D:/labexample/build/external-libs/installed/source-tree/src/SDL2-external/include/SDL_types.h"
      "D:/labexample/build/external-libs/installed/source-tree/src/SDL2-external/include/SDL_version.h"
      "D:/labexample/build/external-libs/installed/source-tree/src/SDL2-external/include/SDL_video.h"
      "D:/labexample/build/external-libs/installed/source-tree/src/SDL2-external/include/SDL_vulkan.h"
      "D:/labexample/build/external-libs/installed/source-tree/src/SDL2-external/include/begin_code.h"
      "D:/labexample/build/external-libs/installed/source-tree/src/SDL2-external/include/close_code.h"
      "D:/labexample/build/external-libs/installed/source-tree/src/SDL2-external-build/include/SDL_revision.h"
      "D:/labexample/build/external-libs/installed/source-tree/src/SDL2-external-build/include-config-release/SDL_config.h"
      )
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Mm][Ii][Nn][Ss][Ii][Zz][Ee][Rr][Ee][Ll])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/SDL2" TYPE FILE FILES
      "D:/labexample/build/external-libs/installed/source-tree/src/SDL2-external/include/SDL.h"
      "D:/labexample/build/external-libs/installed/source-tree/src/SDL2-external/include/SDL_assert.h"
      "D:/labexample/build/external-libs/installed/source-tree/src/SDL2-external/include/SDL_atomic.h"
      "D:/labexample/build/external-libs/installed/source-tree/src/SDL2-external/include/SDL_audio.h"
      "D:/labexample/build/external-libs/installed/source-tree/src/SDL2-external/include/SDL_bits.h"
      "D:/labexample/build/external-libs/installed/source-tree/src/SDL2-external/include/SDL_blendmode.h"
      "D:/labexample/build/external-libs/installed/source-tree/src/SDL2-external/include/SDL_clipboard.h"
      "D:/labexample/build/external-libs/installed/source-tree/src/SDL2-external/include/SDL_copying.h"
      "D:/labexample/build/external-libs/installed/source-tree/src/SDL2-external/include/SDL_cpuinfo.h"
      "D:/labexample/build/external-libs/installed/source-tree/src/SDL2-external/include/SDL_egl.h"
      "D:/labexample/build/external-libs/installed/source-tree/src/SDL2-external/include/SDL_endian.h"
      "D:/labexample/build/external-libs/installed/source-tree/src/SDL2-external/include/SDL_error.h"
      "D:/labexample/build/external-libs/installed/source-tree/src/SDL2-external/include/SDL_events.h"
      "D:/labexample/build/external-libs/installed/source-tree/src/SDL2-external/include/SDL_filesystem.h"
      "D:/labexample/build/external-libs/installed/source-tree/src/SDL2-external/include/SDL_gamecontroller.h"
      "D:/labexample/build/external-libs/installed/source-tree/src/SDL2-external/include/SDL_gesture.h"
      "D:/labexample/build/external-libs/installed/source-tree/src/SDL2-external/include/SDL_guid.h"
      "D:/labexample/build/external-libs/installed/source-tree/src/SDL2-external/include/SDL_haptic.h"
      "D:/labexample/build/external-libs/installed/source-tree/src/SDL2-external/include/SDL_hidapi.h"
      "D:/labexample/build/external-libs/installed/source-tree/src/SDL2-external/include/SDL_hints.h"
      "D:/labexample/build/external-libs/installed/source-tree/src/SDL2-external/include/SDL_joystick.h"
      "D:/labexample/build/external-libs/installed/source-tree/src/SDL2-external/include/SDL_keyboard.h"
      "D:/labexample/build/external-libs/installed/source-tree/src/SDL2-external/include/SDL_keycode.h"
      "D:/labexample/build/external-libs/installed/source-tree/src/SDL2-external/include/SDL_loadso.h"
      "D:/labexample/build/external-libs/installed/source-tree/src/SDL2-external/include/SDL_locale.h"
      "D:/labexample/build/external-libs/installed/source-tree/src/SDL2-external/include/SDL_log.h"
      "D:/labexample/build/external-libs/installed/source-tree/src/SDL2-external/include/SDL_main.h"
      "D:/labexample/build/external-libs/installed/source-tree/src/SDL2-external/include/SDL_messagebox.h"
      "D:/labexample/build/external-libs/installed/source-tree/src/SDL2-external/include/SDL_metal.h"
      "D:/labexample/build/external-libs/installed/source-tree/src/SDL2-external/include/SDL_misc.h"
      "D:/labexample/build/external-libs/installed/source-tree/src/SDL2-external/include/SDL_mouse.h"
      "D:/labexample/build/external-libs/installed/source-tree/src/SDL2-external/include/SDL_mutex.h"
      "D:/labexample/build/external-libs/installed/source-tree/src/SDL2-external/include/SDL_name.h"
      "D:/labexample/build/external-libs/installed/source-tree/src/SDL2-external/include/SDL_opengl.h"
      "D:/labexample/build/external-libs/installed/source-tree/src/SDL2-external/include/SDL_opengl_glext.h"
      "D:/labexample/build/external-libs/installed/source-tree/src/SDL2-external/include/SDL_opengles.h"
      "D:/labexample/build/external-libs/installed/source-tree/src/SDL2-external/include/SDL_opengles2.h"
      "D:/labexample/build/external-libs/installed/source-tree/src/SDL2-external/include/SDL_opengles2_gl2.h"
      "D:/labexample/build/external-libs/installed/source-tree/src/SDL2-external/include/SDL_opengles2_gl2ext.h"
      "D:/labexample/build/external-libs/installed/source-tree/src/SDL2-external/include/SDL_opengles2_gl2platform.h"
      "D:/labexample/build/external-libs/installed/source-tree/src/SDL2-external/include/SDL_opengles2_khrplatform.h"
      "D:/labexample/build/external-libs/installed/source-tree/src/SDL2-external/include/SDL_pixels.h"
      "D:/labexample/build/external-libs/installed/source-tree/src/SDL2-external/include/SDL_platform.h"
      "D:/labexample/build/external-libs/installed/source-tree/src/SDL2-external/include/SDL_power.h"
      "D:/labexample/build/external-libs/installed/source-tree/src/SDL2-external/include/SDL_quit.h"
      "D:/labexample/build/external-libs/installed/source-tree/src/SDL2-external/include/SDL_rect.h"
      "D:/labexample/build/external-libs/installed/source-tree/src/SDL2-external/include/SDL_render.h"
      "D:/labexample/build/external-libs/installed/source-tree/src/SDL2-external/include/SDL_rwops.h"
      "D:/labexample/build/external-libs/installed/source-tree/src/SDL2-external/include/SDL_scancode.h"
      "D:/labexample/build/external-libs/installed/source-tree/src/SDL2-external/include/SDL_sensor.h"
      "D:/labexample/build/external-libs/installed/source-tree/src/SDL2-external/include/SDL_shape.h"
      "D:/labexample/build/external-libs/installed/source-tree/src/SDL2-external/include/SDL_stdinc.h"
      "D:/labexample/build/external-libs/installed/source-tree/src/SDL2-external/include/SDL_surface.h"
      "D:/labexample/build/external-libs/installed/source-tree/src/SDL2-external/include/SDL_system.h"
      "D:/labexample/build/external-libs/installed/source-tree/src/SDL2-external/include/SDL_syswm.h"
      "D:/labexample/build/external-libs/installed/source-tree/src/SDL2-external/include/SDL_test.h"
      "D:/labexample/build/external-libs/installed/source-tree/src/SDL2-external/include/SDL_test_assert.h"
      "D:/labexample/build/external-libs/installed/source-tree/src/SDL2-external/include/SDL_test_common.h"
      "D:/labexample/build/external-libs/installed/source-tree/src/SDL2-external/include/SDL_test_compare.h"
      "D:/labexample/build/external-libs/installed/source-tree/src/SDL2-external/include/SDL_test_crc32.h"
      "D:/labexample/build/external-libs/installed/source-tree/src/SDL2-external/include/SDL_test_font.h"
      "D:/labexample/build/external-libs/installed/source-tree/src/SDL2-external/include/SDL_test_fuzzer.h"
      "D:/labexample/build/external-libs/installed/source-tree/src/SDL2-external/include/SDL_test_harness.h"
      "D:/labexample/build/external-libs/installed/source-tree/src/SDL2-external/include/SDL_test_images.h"
      "D:/labexample/build/external-libs/installed/source-tree/src/SDL2-external/include/SDL_test_log.h"
      "D:/labexample/build/external-libs/installed/source-tree/src/SDL2-external/include/SDL_test_md5.h"
      "D:/labexample/build/external-libs/installed/source-tree/src/SDL2-external/include/SDL_test_memory.h"
      "D:/labexample/build/external-libs/installed/source-tree/src/SDL2-external/include/SDL_test_random.h"
      "D:/labexample/build/external-libs/installed/source-tree/src/SDL2-external/include/SDL_thread.h"
      "D:/labexample/build/external-libs/installed/source-tree/src/SDL2-external/include/SDL_timer.h"
      "D:/labexample/build/external-libs/installed/source-tree/src/SDL2-external/include/SDL_touch.h"
      "D:/labexample/build/external-libs/installed/source-tree/src/SDL2-external/include/SDL_types.h"
      "D:/labexample/build/external-libs/installed/source-tree/src/SDL2-external/include/SDL_version.h"
      "D:/labexample/build/external-libs/installed/source-tree/src/SDL2-external/include/SDL_video.h"
      "D:/labexample/build/external-libs/installed/source-tree/src/SDL2-external/include/SDL_vulkan.h"
      "D:/labexample/build/external-libs/installed/source-tree/src/SDL2-external/include/begin_code.h"
      "D:/labexample/build/external-libs/installed/source-tree/src/SDL2-external/include/close_code.h"
      "D:/labexample/build/external-libs/installed/source-tree/src/SDL2-external-build/include/SDL_revision.h"
      "D:/labexample/build/external-libs/installed/source-tree/src/SDL2-external-build/include-config-minsizerel/SDL_config.h"
      )
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Rr][Ee][Ll][Ww][Ii][Tt][Hh][Dd][Ee][Bb][Ii][Nn][Ff][Oo])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/SDL2" TYPE FILE FILES
      "D:/labexample/build/external-libs/installed/source-tree/src/SDL2-external/include/SDL.h"
      "D:/labexample/build/external-libs/installed/source-tree/src/SDL2-external/include/SDL_assert.h"
      "D:/labexample/build/external-libs/installed/source-tree/src/SDL2-external/include/SDL_atomic.h"
      "D:/labexample/build/external-libs/installed/source-tree/src/SDL2-external/include/SDL_audio.h"
      "D:/labexample/build/external-libs/installed/source-tree/src/SDL2-external/include/SDL_bits.h"
      "D:/labexample/build/external-libs/installed/source-tree/src/SDL2-external/include/SDL_blendmode.h"
      "D:/labexample/build/external-libs/installed/source-tree/src/SDL2-external/include/SDL_clipboard.h"
      "D:/labexample/build/external-libs/installed/source-tree/src/SDL2-external/include/SDL_copying.h"
      "D:/labexample/build/external-libs/installed/source-tree/src/SDL2-external/include/SDL_cpuinfo.h"
      "D:/labexample/build/external-libs/installed/source-tree/src/SDL2-external/include/SDL_egl.h"
      "D:/labexample/build/external-libs/installed/source-tree/src/SDL2-external/include/SDL_endian.h"
      "D:/labexample/build/external-libs/installed/source-tree/src/SDL2-external/include/SDL_error.h"
      "D:/labexample/build/external-libs/installed/source-tree/src/SDL2-external/include/SDL_events.h"
      "D:/labexample/build/external-libs/installed/source-tree/src/SDL2-external/include/SDL_filesystem.h"
      "D:/labexample/build/external-libs/installed/source-tree/src/SDL2-external/include/SDL_gamecontroller.h"
      "D:/labexample/build/external-libs/installed/source-tree/src/SDL2-external/include/SDL_gesture.h"
      "D:/labexample/build/external-libs/installed/source-tree/src/SDL2-external/include/SDL_guid.h"
      "D:/labexample/build/external-libs/installed/source-tree/src/SDL2-external/include/SDL_haptic.h"
      "D:/labexample/build/external-libs/installed/source-tree/src/SDL2-external/include/SDL_hidapi.h"
      "D:/labexample/build/external-libs/installed/source-tree/src/SDL2-external/include/SDL_hints.h"
      "D:/labexample/build/external-libs/installed/source-tree/src/SDL2-external/include/SDL_joystick.h"
      "D:/labexample/build/external-libs/installed/source-tree/src/SDL2-external/include/SDL_keyboard.h"
      "D:/labexample/build/external-libs/installed/source-tree/src/SDL2-external/include/SDL_keycode.h"
      "D:/labexample/build/external-libs/installed/source-tree/src/SDL2-external/include/SDL_loadso.h"
      "D:/labexample/build/external-libs/installed/source-tree/src/SDL2-external/include/SDL_locale.h"
      "D:/labexample/build/external-libs/installed/source-tree/src/SDL2-external/include/SDL_log.h"
      "D:/labexample/build/external-libs/installed/source-tree/src/SDL2-external/include/SDL_main.h"
      "D:/labexample/build/external-libs/installed/source-tree/src/SDL2-external/include/SDL_messagebox.h"
      "D:/labexample/build/external-libs/installed/source-tree/src/SDL2-external/include/SDL_metal.h"
      "D:/labexample/build/external-libs/installed/source-tree/src/SDL2-external/include/SDL_misc.h"
      "D:/labexample/build/external-libs/installed/source-tree/src/SDL2-external/include/SDL_mouse.h"
      "D:/labexample/build/external-libs/installed/source-tree/src/SDL2-external/include/SDL_mutex.h"
      "D:/labexample/build/external-libs/installed/source-tree/src/SDL2-external/include/SDL_name.h"
      "D:/labexample/build/external-libs/installed/source-tree/src/SDL2-external/include/SDL_opengl.h"
      "D:/labexample/build/external-libs/installed/source-tree/src/SDL2-external/include/SDL_opengl_glext.h"
      "D:/labexample/build/external-libs/installed/source-tree/src/SDL2-external/include/SDL_opengles.h"
      "D:/labexample/build/external-libs/installed/source-tree/src/SDL2-external/include/SDL_opengles2.h"
      "D:/labexample/build/external-libs/installed/source-tree/src/SDL2-external/include/SDL_opengles2_gl2.h"
      "D:/labexample/build/external-libs/installed/source-tree/src/SDL2-external/include/SDL_opengles2_gl2ext.h"
      "D:/labexample/build/external-libs/installed/source-tree/src/SDL2-external/include/SDL_opengles2_gl2platform.h"
      "D:/labexample/build/external-libs/installed/source-tree/src/SDL2-external/include/SDL_opengles2_khrplatform.h"
      "D:/labexample/build/external-libs/installed/source-tree/src/SDL2-external/include/SDL_pixels.h"
      "D:/labexample/build/external-libs/installed/source-tree/src/SDL2-external/include/SDL_platform.h"
      "D:/labexample/build/external-libs/installed/source-tree/src/SDL2-external/include/SDL_power.h"
      "D:/labexample/build/external-libs/installed/source-tree/src/SDL2-external/include/SDL_quit.h"
      "D:/labexample/build/external-libs/installed/source-tree/src/SDL2-external/include/SDL_rect.h"
      "D:/labexample/build/external-libs/installed/source-tree/src/SDL2-external/include/SDL_render.h"
      "D:/labexample/build/external-libs/installed/source-tree/src/SDL2-external/include/SDL_rwops.h"
      "D:/labexample/build/external-libs/installed/source-tree/src/SDL2-external/include/SDL_scancode.h"
      "D:/labexample/build/external-libs/installed/source-tree/src/SDL2-external/include/SDL_sensor.h"
      "D:/labexample/build/external-libs/installed/source-tree/src/SDL2-external/include/SDL_shape.h"
      "D:/labexample/build/external-libs/installed/source-tree/src/SDL2-external/include/SDL_stdinc.h"
      "D:/labexample/build/external-libs/installed/source-tree/src/SDL2-external/include/SDL_surface.h"
      "D:/labexample/build/external-libs/installed/source-tree/src/SDL2-external/include/SDL_system.h"
      "D:/labexample/build/external-libs/installed/source-tree/src/SDL2-external/include/SDL_syswm.h"
      "D:/labexample/build/external-libs/installed/source-tree/src/SDL2-external/include/SDL_test.h"
      "D:/labexample/build/external-libs/installed/source-tree/src/SDL2-external/include/SDL_test_assert.h"
      "D:/labexample/build/external-libs/installed/source-tree/src/SDL2-external/include/SDL_test_common.h"
      "D:/labexample/build/external-libs/installed/source-tree/src/SDL2-external/include/SDL_test_compare.h"
      "D:/labexample/build/external-libs/installed/source-tree/src/SDL2-external/include/SDL_test_crc32.h"
      "D:/labexample/build/external-libs/installed/source-tree/src/SDL2-external/include/SDL_test_font.h"
      "D:/labexample/build/external-libs/installed/source-tree/src/SDL2-external/include/SDL_test_fuzzer.h"
      "D:/labexample/build/external-libs/installed/source-tree/src/SDL2-external/include/SDL_test_harness.h"
      "D:/labexample/build/external-libs/installed/source-tree/src/SDL2-external/include/SDL_test_images.h"
      "D:/labexample/build/external-libs/installed/source-tree/src/SDL2-external/include/SDL_test_log.h"
      "D:/labexample/build/external-libs/installed/source-tree/src/SDL2-external/include/SDL_test_md5.h"
      "D:/labexample/build/external-libs/installed/source-tree/src/SDL2-external/include/SDL_test_memory.h"
      "D:/labexample/build/external-libs/installed/source-tree/src/SDL2-external/include/SDL_test_random.h"
      "D:/labexample/build/external-libs/installed/source-tree/src/SDL2-external/include/SDL_thread.h"
      "D:/labexample/build/external-libs/installed/source-tree/src/SDL2-external/include/SDL_timer.h"
      "D:/labexample/build/external-libs/installed/source-tree/src/SDL2-external/include/SDL_touch.h"
      "D:/labexample/build/external-libs/installed/source-tree/src/SDL2-external/include/SDL_types.h"
      "D:/labexample/build/external-libs/installed/source-tree/src/SDL2-external/include/SDL_version.h"
      "D:/labexample/build/external-libs/installed/source-tree/src/SDL2-external/include/SDL_video.h"
      "D:/labexample/build/external-libs/installed/source-tree/src/SDL2-external/include/SDL_vulkan.h"
      "D:/labexample/build/external-libs/installed/source-tree/src/SDL2-external/include/begin_code.h"
      "D:/labexample/build/external-libs/installed/source-tree/src/SDL2-external/include/close_code.h"
      "D:/labexample/build/external-libs/installed/source-tree/src/SDL2-external-build/include/SDL_revision.h"
      "D:/labexample/build/external-libs/installed/source-tree/src/SDL2-external-build/include-config-relwithdebinfo/SDL_config.h"
      )
  endif()
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/licenses/SDL2" TYPE FILE FILES "D:/labexample/build/external-libs/installed/source-tree/src/SDL2-external/LICENSE.txt")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/pkgconfig" TYPE FILE FILES "D:/labexample/build/external-libs/installed/source-tree/src/SDL2-external-build/sdl2.pc")
endif()

if(CMAKE_INSTALL_COMPONENT)
  set(CMAKE_INSTALL_MANIFEST "install_manifest_${CMAKE_INSTALL_COMPONENT}.txt")
else()
  set(CMAKE_INSTALL_MANIFEST "install_manifest.txt")
endif()

string(REPLACE ";" "\n" CMAKE_INSTALL_MANIFEST_CONTENT
       "${CMAKE_INSTALL_MANIFEST_FILES}")
file(WRITE "D:/labexample/build/external-libs/installed/source-tree/src/SDL2-external-build/${CMAKE_INSTALL_MANIFEST}"
     "${CMAKE_INSTALL_MANIFEST_CONTENT}")
