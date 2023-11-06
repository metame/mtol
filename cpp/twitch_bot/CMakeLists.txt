cmake_minimum_required(VERSION 3.19)

project(TwitchBot)

# Define the path to your local Drogon source
set(DROGON_DIR "${CMAKE_SOURCE_DIR}/../../../drogon/build")

# Include Drogon's CMake configuration
add_subdirectory(${DROGON_DIR})

add_executable(TwitchBot main.cpp)

# Link your project with Drogon
target_link_libraries(TwitchBot PRIVATE drogon)
