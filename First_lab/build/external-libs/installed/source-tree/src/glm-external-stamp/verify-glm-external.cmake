# Distributed under the OSI-approved BSD 3-Clause License.  See accompanying
# file Copyright.txt or https://cmake.org/licensing for details.

cmake_minimum_required(VERSION 3.5)

if("D:/labexample/external-libs/glm-0.9.9.8.7z" STREQUAL "")
  message(FATAL_ERROR "LOCAL can't be empty")
endif()

if(NOT EXISTS "D:/labexample/external-libs/glm-0.9.9.8.7z")
  message(FATAL_ERROR "File not found: D:/labexample/external-libs/glm-0.9.9.8.7z")
endif()

if("MD5" STREQUAL "")
  message(WARNING "File will not be verified since no URL_HASH specified")
  return()
endif()

if("c8342552801ebeb31497288192c4e793" STREQUAL "")
  message(FATAL_ERROR "EXPECT_VALUE can't be empty")
endif()

message(STATUS "verifying file...
     file='D:/labexample/external-libs/glm-0.9.9.8.7z'")

file("MD5" "D:/labexample/external-libs/glm-0.9.9.8.7z" actual_value)

if(NOT "${actual_value}" STREQUAL "c8342552801ebeb31497288192c4e793")
  message(FATAL_ERROR "error: MD5 hash of
  D:/labexample/external-libs/glm-0.9.9.8.7z
does not match expected value
  expected: 'c8342552801ebeb31497288192c4e793'
    actual: '${actual_value}'
")
endif()

message(STATUS "verifying file... done")
