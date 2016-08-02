cmake_minimum_required(VERSION 2.6)

ADD_DEFINITIONS(-I..)
INCLUDE_DIRECTORIES(${CMAKE_CURRENT_SOURCE_DIR}/..)

IF (BUILD_EXAMPLES)
    find_library(json NAMES json-c json)
    MESSAGE("json:" ${json})
    find_library(blobjson NAMES blobmsg_json)
    MESSAGE("blobjson:" ${blobjson})
	ADD_EXECUTABLE(server server.c count.c)
	TARGET_LINK_LIBRARIES(server ubus ubox ${blobjson} ${json})

	ADD_EXECUTABLE(client client.c count.c)
	TARGET_LINK_LIBRARIES(client ubus ubox)
ENDIF()
