# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.26

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:

#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:

# Disable VCS-based implicit rules.
% : %,v

# Disable VCS-based implicit rules.
% : RCS/%

# Disable VCS-based implicit rules.
% : RCS/%,v

# Disable VCS-based implicit rules.
% : SCCS/s.%

# Disable VCS-based implicit rules.
% : s.%

.SUFFIXES: .hpux_make_needs_suffix_list

# Produce verbose output by default.
VERBOSE = 1

# Command-line flag to silence nested $(MAKE).
$(VERBOSE)MAKESILENT = -s

#Suppress display of executed commands.
$(VERBOSE).SILENT:

# A target that is always out of date.
cmake_force:
.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/sbronder/open_source/eigen

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/sbronder/open_source/eigen/build

# Include any dependencies generated for this target.
include test/CMakeFiles/constexpr.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include test/CMakeFiles/constexpr.dir/compiler_depend.make

# Include the progress variables for this target.
include test/CMakeFiles/constexpr.dir/progress.make

# Include the compile flags for this target's objects.
include test/CMakeFiles/constexpr.dir/flags.make

test/CMakeFiles/constexpr.dir/constexpr.cpp.o: test/CMakeFiles/constexpr.dir/flags.make
test/CMakeFiles/constexpr.dir/constexpr.cpp.o: /home/sbronder/open_source/eigen/test/constexpr.cpp
test/CMakeFiles/constexpr.dir/constexpr.cpp.o: test/CMakeFiles/constexpr.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/sbronder/open_source/eigen/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object test/CMakeFiles/constexpr.dir/constexpr.cpp.o"
	cd /home/sbronder/open_source/eigen/build/test && /mnt/sw/nix/store/6560mkp838syd8jpp6gdyyisczwcvs67-gcc-11.4.0/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT test/CMakeFiles/constexpr.dir/constexpr.cpp.o -MF CMakeFiles/constexpr.dir/constexpr.cpp.o.d -o CMakeFiles/constexpr.dir/constexpr.cpp.o -c /home/sbronder/open_source/eigen/test/constexpr.cpp

test/CMakeFiles/constexpr.dir/constexpr.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/constexpr.dir/constexpr.cpp.i"
	cd /home/sbronder/open_source/eigen/build/test && /mnt/sw/nix/store/6560mkp838syd8jpp6gdyyisczwcvs67-gcc-11.4.0/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/sbronder/open_source/eigen/test/constexpr.cpp > CMakeFiles/constexpr.dir/constexpr.cpp.i

test/CMakeFiles/constexpr.dir/constexpr.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/constexpr.dir/constexpr.cpp.s"
	cd /home/sbronder/open_source/eigen/build/test && /mnt/sw/nix/store/6560mkp838syd8jpp6gdyyisczwcvs67-gcc-11.4.0/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/sbronder/open_source/eigen/test/constexpr.cpp -o CMakeFiles/constexpr.dir/constexpr.cpp.s

# Object files for target constexpr
constexpr_OBJECTS = \
"CMakeFiles/constexpr.dir/constexpr.cpp.o"

# External object files for target constexpr
constexpr_EXTERNAL_OBJECTS =

test/constexpr: test/CMakeFiles/constexpr.dir/constexpr.cpp.o
test/constexpr: test/CMakeFiles/constexpr.dir/build.make
test/constexpr: test/CMakeFiles/constexpr.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/sbronder/open_source/eigen/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable constexpr"
	cd /home/sbronder/open_source/eigen/build/test && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/constexpr.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
test/CMakeFiles/constexpr.dir/build: test/constexpr
.PHONY : test/CMakeFiles/constexpr.dir/build

test/CMakeFiles/constexpr.dir/clean:
	cd /home/sbronder/open_source/eigen/build/test && $(CMAKE_COMMAND) -P CMakeFiles/constexpr.dir/cmake_clean.cmake
.PHONY : test/CMakeFiles/constexpr.dir/clean

test/CMakeFiles/constexpr.dir/depend:
	cd /home/sbronder/open_source/eigen/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/sbronder/open_source/eigen /home/sbronder/open_source/eigen/test /home/sbronder/open_source/eigen/build /home/sbronder/open_source/eigen/build/test /home/sbronder/open_source/eigen/build/test/CMakeFiles/constexpr.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : test/CMakeFiles/constexpr.dir/depend

