CMAKE_MINIMUM_REQUIRED(VERSION 2.8)

PROJECT(stream_segmentation)

SET(CMAKE_EXPORT_COMPILE_COMMANDS "ON")
SET(CMAKE_MODULE_PATH "${CMAKE_SOURCE_DIR}/cmake")
SET(CMAKE_INSTALL_PREFIX "${CMAKE_SOURCE_DIR}/../compiled")

INCLUDE(utils)
INCLUDE(FindFFmpeg)

IF ("${CMAKE_CXX_COMPILER_ID}" STREQUAL "Clang")
    SET(CLANG true)
    MESSAGE("using Clang")
    SET(CMAKE_XCODE_ATTRIBUTE_CLANG_CXX_LANGUAGE_STANDARD "c++11")
    SET(CMAKE_XCODE_ATTRIBUTE_CLANG_CXX_LIBRARY "libc++")
    ADD_DEFINITIONS("-std=c++11")
    ADD_DEFINITIONS("-stdlib=libc++")
ELSEIF ("${CMAKE_CXX_COMPILER_ID}" STREQUAL "GNU")
    SET(GCC true)
    # using GCC
    SET(CMAKE_CXX_FLAGS "-std=gnu++11 -fPIC")
ELSEIF ("${CMAKE_CXX_COMPILER_ID}" STREQUAL "Intel")
	# using Intel C++
ELSEIF ("${CMAKE_CXX_COMPILER_ID}" STREQUAL "MSVC")
	# using Visual Studio C++
	SET(MSVC true)
ENDIF()

ADD_SUBDIRECTORY(common)
ADD_SUBDIRECTORY(video_segmenter)
ADD_SUBDIRECTORY(segmenter_test_app)
ADD_SUBDIRECTORY(video_streams_manager)
ADD_SUBDIRECTORY(video_saver)
ADD_SUBDIRECTORY(segmenter_python_api)
