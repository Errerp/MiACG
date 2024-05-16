# Distributed under the OSI-approved BSD 3-Clause License.  See accompanying
# file Copyright.txt or https://cmake.org/licensing for details.

cmake_minimum_required(VERSION 3.5)

if("D:/labexample/external-libs/SDL2-2.26.5.tar.gz" STREQUAL "")
  message(FATAL_ERROR "LOCAL can't be empty")
endif()

if(NOT EXISTS "D:/labexample/external-libs/SDL2-2.26.5.tar.gz")
  message(FATAL_ERROR "File not found: D:/labexample/external-libs/SDL2-2.26.5.tar.gz")
endif()

if("MD5" STREQUAL "")
  message(WARNING "File will not be verified since no URL_HASH specified")
  return()
endif()

if("47f22c109070431ecccd90abd3c0ab6e" STREQUAL "")
  message(FATAL_ERROR "EXPECT_VALUE can't be empty")
endif()

message(STATUS "verifying file...
     file='D:/labexample/external-libs/SDL2-2.26.5.tar.gz'")

file("MD5" "D:/labexample/external-libs/SDL2-2.26.5.tar.gz" actual_value)

if(NOT "${actual_value}" STREQUAL "47f22c109070431ecccd90abd3c0ab6e")
  message(FATAL_ERROR "error: MD5 hash of
  D:/labexample/external-libs/SDL2-2.26.5.tar.gz
does not match expected value
  expected: '47f22c109070431ecccd90abd3c0ab6e'
    actual: '${actual_value}'
")
endif()

message(STATUS "verifying file... done")
