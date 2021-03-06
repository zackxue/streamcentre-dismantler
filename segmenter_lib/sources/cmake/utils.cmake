FUNCTION(CHECK_FILES source_files)
	FOREACH(file ${source_files})
		IF(NOT EXISTS ${CMAKE_CURRENT_SOURCE_DIR}/${file})
			MESSAGE("${file} not exists")
			FILE(APPEND ${CMAKE_CURRENT_SOURCE_DIR}/${file} "\n")
		ENDIF()
	ENDFOREACH()
ENDFUNCTION()

FUNCTION(GROUP_FILES directories)
	FOREACH(directory ${directories})
		FILE(GLOB dir_headers "${directory}/*.h")
		FILE(GLOB dir_sources "${directory}/*.cpp")
		FILE(GLOB dir_ui "${directory}/*.ui")
		FILE(GLOB dir_inl "${directory}/*.inl")
		STRING(REGEX REPLACE "/" "\\\\\\\\" convdir ${directory})
		SOURCE_GROUP(${convdir} FILES ${dir_headers} ${dir_sources} ${dir_ui} ${dir_inl})
	ENDFOREACH()
ENDFUNCTION()

FUNCTION(DETECT_COMPILER)
	IF ("${CMAKE_CXX_COMPILER_ID}" STREQUAL "Clang")
		SET(CLANG true)
		MESSAGE("using clang")
		SET(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=c++11")
		SET(CMAKE_XCODE_ATTRIBUTE_CLANG_CXX_LANGUAGE_STANDARD "c++11")
		SET(CMAKE_XCODE_ATTRIBUTE_CLANG_CXX_LIBRARY "libc++")
		ADD_DEFINITIONS("-I/usr/include")
	ELSEIF ("${CMAKE_CXX_COMPILER_ID}" STREQUAL "GNU")
		MESSAGE("using gcc")
		SET(GCC true)
		ADD_DEFINITIONS( -std=c++11 )
	ELSEIF ("${CMAKE_CXX_COMPILER_ID}" STREQUAL "Intel")
		MESSAGE("using intel")
	ELSEIF ("${CMAKE_CXX_COMPILER_ID}" STREQUAL "MSVC")
		MESSAGE("using msvc")
		SET(MSVC true)
	ENDIF()
ENDFUNCTION()
