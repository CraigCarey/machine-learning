cmake_minimum_required(VERSION 3.5)
project(caffe-classifier)

set(CMAKE_CXX_STANDARD 11)

option(CPU_ONLY "CpuOnly" OFF)

if (NOT CPU_ONLY)
	find_package(CUDA REQUIRED)
endif (NOT CPU_ONLY)

find_package(OpenCV REQUIRED)
find_package(Caffe REQUIRED)
include_directories(${Caffe_INCLUDE_DIRS})
add_definitions(${Caffe_DEFINITIONS})

add_executable(caffe-classifier main.cpp)
target_link_libraries(caffe-classifier ${Caffe_LIBRARIES})

file(GLOB MODELS "data/*")
file(COPY ${MODELS} DESTINATION ${CMAKE_CURRENT_BINARY_DIR})
