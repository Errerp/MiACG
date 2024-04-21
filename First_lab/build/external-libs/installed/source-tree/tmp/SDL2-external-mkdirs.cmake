# Distributed under the OSI-approved BSD 3-Clause License.  See accompanying
# file Copyright.txt or https://cmake.org/licensing for details.

cmake_minimum_required(VERSION 3.5)

file(MAKE_DIRECTORY
  "D:/labexample/build/external-libs/installed/source-tree/src/SDL2-external"
  "D:/labexample/build/external-libs/installed/source-tree/src/SDL2-external-build"
  "D:/labexample/build/external-libs/installed/source-tree"
  "D:/labexample/build/external-libs/installed/source-tree/tmp"
  "D:/labexample/build/external-libs/installed/source-tree/src/SDL2-external-stamp"
  "D:/labexample/external-libs"
  "D:/labexample/build/external-libs/installed/source-tree/src/SDL2-external-stamp"
)

set(configSubDirs Debug;Release;MinSizeRel;RelWithDebInfo)
foreach(subDir IN LISTS configSubDirs)
    file(MAKE_DIRECTORY "D:/labexample/build/external-libs/installed/source-tree/src/SDL2-external-stamp/${subDir}")
endforeach()
if(cfgdir)
  file(MAKE_DIRECTORY "D:/labexample/build/external-libs/installed/source-tree/src/SDL2-external-stamp${cfgdir}") # cfgdir has leading slash
endif()
