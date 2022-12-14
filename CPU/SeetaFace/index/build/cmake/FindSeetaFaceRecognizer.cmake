# find SeetaFaceRecognizer
#<NAME>_FOUND
#<NAME>_INCLUDE_DIRS or <NAME>_INCLUDES
#<NAME>_LIBRARIES or <NAME>_LIBRARIES or <NAME>_LIBS
#<NAME>_VERSION
#<NAME>_DEFINITIONS

#variables:
#<NAME>_NAME
#<NAME>_INCLUDE_DIR
#<NAME>_LIBRARY
#<NAME>_MODULE_PATH

set(SeetaFaceRecognizer_NAME "SeetaFaceRecognizer")
set(SeetaFaceRecognizer_VERSION_MAJOR "6")
set(SeetaFaceRecognizer_VERSION_MINOR "1")
set(SeetaFaceRecognizer_VERSION_SINOR "0")
set(SeetaFaceRecognizer_VERSION "${SeetaFaceRecognizer_VERSION_MAJOR}.${SeetaFaceRecognizer_VERSION_MINOR}.${SeetaFaceRecognizer_VERSION_SINOR}" CACHE STRING "The SeetaFaceRecognizer library version")
set(NAME_STR ${SeetaFaceRecognizer_VERSION_MAJOR}${SeetaFaceRecognizer_VERSION_MINOR}${SeetaFaceRecognizer_VERSION_SINOR})
set(SeetaFaceRecognizer_MODULE_PATH "${CMAKE_CURRENT_LIST_DIR}/../")

message(STATUS "SeetaFaceRecognizer default path: " ${SeetaFaceRecognizer_MODULE_PATH})
	
if(BUILD_ANDROID)
	# if(SeetaFaceRecognizer_ROOT_DIR STREQUAL "")
		# message(SEND_ERROR "Set the path to SeetaFaceRecognizer root folder in the system variable SeetaFaceRecognizer_ROOT_DIR ")
	# endif()
	set(SeetaFaceRecognizer_INCLUDE_DIR "${SeetaFaceRecognizer_MODULE_PATH}/include")
	file(GLOB_RECURSE INCLUDE_FILE
		${SeetaFaceRecognizer_INCLUDE_DIR}/VIPLFaceRecognizer.h)
	if("${INCLUDE_FILE}" STREQUAL "")
		set(SeetaFaceRecognizer_INCLUDE_DIR "${SeetaFaceRecognizer_ROOT_DIR}/include")
	endif()
	message(STATUS "SeetaFaceRecognizer include dir : ${SeetaFaceRecognizer_INCLUDE_DIR}")
	file(GLOB LIBRARY_DEBUG
		${SeetaFaceRecognizer_MODULE_PATH}/${ENV_LIBRARY_DIR}/*${SeetaFaceRecognizer_NAME}*d.so)
	if("${LIBRARY_DEBUG}" STREQUAL "")
		file(GLOB LIBRARY_DEBUG
		${SeetaFaceRecognizer_ROOT_DIR}/${ENV_LIBRARY_DIR}/*${SeetaFaceRecognizer_NAME}*d.so)
	endif()
	file(GLOB LIBRARY_RELEASE
		${SeetaFaceRecognizer_MODULE_PATH}/${ENV_LIBRARY_DIR}/*${SeetaFaceRecognizer_NAME}*.so)
	if("${LIBRARY_RELEASE}" STREQUAL "")
		file(GLOB LIBRARY_RELEASE
		${SeetaFaceRecognizer_ROOT_DIR}/${ENV_LIBRARY_DIR}/*${SeetaFaceRecognizer_NAME}*.so)
	endif()
else()
	find_path(SeetaFaceRecognizer_INCLUDE_DIR
	  NAMES
		seeta/FaceRecognizer.h
	  PATHS
		ENV SEETA_LOCAL_INSTALL
		${SeetaFaceRecognizer_ROOT_DIR}
		${SeetaFaceRecognizer_MODULE_PATH}
		ENV SeetaFaceRecognizer_ROOT_DIR
		usr
		usr/local
	  PATH_SUFFIXES
		${ENV_HEADER_DIR}
		${SeetaFaceRecognizer_NAME}/${ENV_HEADER_DIR})

	find_library(LIBRARY_DEBUG
	  NAMES 
		${SeetaFaceRecognizer_NAME}${NAME_STR}d
	  PATHS
		ENV SEETA_LOCAL_INSTALL
		${SeetaFaceRecognizer_ROOT_DIR}
		${SeetaFaceRecognizer_MODULE_PATH}
		ENV SeetaFaceRecognizer_ROOT_DIR
		usr
		usr/local
	  PATH_SUFFIXES
		${ENV_LIBRARY_DIR}
		${ENV_LIBRARY_DIR}/${CONFIGURATION}
		${SeetaFaceRecognizer_NAME}/${ENV_LIBRARY_DIR}
		${SeetaFaceRecognizer_NAME}/${ENV_LIBRARY_DIR})

	find_library(LIBRARY_RELEASE
	  NAMES 
		${SeetaFaceRecognizer_NAME}${NAME_STR}
	  PATHS
		ENV SEETA_LOCAL_INSTALL
		${SeetaFaceRecognizer_ROOT_DIR}
		${SeetaFaceRecognizer_MODULE_PATH}
		ENV SeetaFaceRecognizer_ROOT_DIR
		usr
		usr/local
	  PATH_SUFFIXES
		${ENV_LIBRARY_DIR}
		${ENV_LIBRARY_DIR}/${CONFIGURATION}
		${SeetaFaceRecognizer_NAME}/${ENV_LIBRARY_DIR}
		${SeetaFaceRecognizer_NAME}/${ENV_LIBRARY_DIR})
endif()

if ("${CONFIGURATION}" STREQUAL "Debug")
	set(SeetaFaceRecognizer_LIBRARY ${LIBRARY_DEBUG})
else()
	set(SeetaFaceRecognizer_LIBRARY ${LIBRARY_RELEASE})
endif()

set(LIBRARY_DEBUG "")
set(LIBRARY_RELEASE "")

find_package(PackageHandleStandardArgs)
FIND_PACKAGE_HANDLE_STANDARD_ARGS(SeetaFaceRecognizer
	FOUND_VAR
		SeetaFaceRecognizer_FOUND
	REQUIRED_VARS
		SeetaFaceRecognizer_INCLUDE_DIR
		SeetaFaceRecognizer_LIBRARY
	VERSION_VAR 
		SeetaFaceRecognizer_VERSION 
	FAIL_MESSAGE
		"Could not find SeetaFaceRecognizer!try to set the path to SeetaFaceRecognizer root folder in the system variable SeetaFaceRecognizer_ROOT_DIR "
)

if(SeetaFaceRecognizer_FOUND)
	set(SeetaFaceRecognizer_LIBRARIES ${SeetaFaceRecognizer_LIBRARY})
	set(SeetaFaceRecognizer_INCLUDE_DIRS ${SeetaFaceRecognizer_INCLUDE_DIR})
endif()

message(STATUS "SeetaFaceRecognizer Found: " ${SeetaFaceRecognizer_FOUND})

foreach (inc ${SeetaFaceRecognizer_INCLUDE_DIRS})
    message(STATUS "SeetaFaceRecognizer include: " ${inc})
endforeach ()
foreach (lib ${SeetaFaceRecognizer_LIBRARIES})
    message(STATUS "SeetaFaceRecognizer library: " ${lib})
endforeach ()
