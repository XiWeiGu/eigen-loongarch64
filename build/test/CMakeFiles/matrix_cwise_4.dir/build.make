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
include test/CMakeFiles/matrix_cwise_4.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include test/CMakeFiles/matrix_cwise_4.dir/compiler_depend.make

# Include the progress variables for this target.
include test/CMakeFiles/matrix_cwise_4.dir/progress.make

# Include the compile flags for this target's objects.
include test/CMakeFiles/matrix_cwise_4.dir/flags.make

test/CMakeFiles/matrix_cwise_4.dir/matrix_cwise.cpp.o: test/CMakeFiles/matrix_cwise_4.dir/flags.make
test/CMakeFiles/matrix_cwise_4.dir/matrix_cwise.cpp.o: /home/sbronder/open_source/eigen/test/matrix_cwise.cpp
test/CMakeFiles/matrix_cwise_4.dir/matrix_cwise.cpp.o: test/CMakeFiles/matrix_cwise_4.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/sbronder/open_source/eigen/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object test/CMakeFiles/matrix_cwise_4.dir/matrix_cwise.cpp.o"
	cd /home/sbronder/open_source/eigen/build/test && /mnt/sw/nix/store/6560mkp838syd8jpp6gdyyisczwcvs67-gcc-11.4.0/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT test/CMakeFiles/matrix_cwise_4.dir/matrix_cwise.cpp.o -MF CMakeFiles/matrix_cwise_4.dir/matrix_cwise.cpp.o.d -o CMakeFiles/matrix_cwise_4.dir/matrix_cwise.cpp.o -c /home/sbronder/open_source/eigen/test/matrix_cwise.cpp

test/CMakeFiles/matrix_cwise_4.dir/matrix_cwise.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/matrix_cwise_4.dir/matrix_cwise.cpp.i"
	cd /home/sbronder/open_source/eigen/build/test && /mnt/sw/nix/store/6560mkp838syd8jpp6gdyyisczwcvs67-gcc-11.4.0/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/sbronder/open_source/eigen/test/matrix_cwise.cpp > CMakeFiles/matrix_cwise_4.dir/matrix_cwise.cpp.i

test/CMakeFiles/matrix_cwise_4.dir/matrix_cwise.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/matrix_cwise_4.dir/matrix_cwise.cpp.s"
	cd /home/sbronder/open_source/eigen/build/test && /mnt/sw/nix/store/6560mkp838syd8jpp6gdyyisczwcvs67-gcc-11.4.0/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/sbronder/open_source/eigen/test/matrix_cwise.cpp -o CMakeFiles/matrix_cwise_4.dir/matrix_cwise.cpp.s

# Object files for target matrix_cwise_4
matrix_cwise_4_OBJECTS = \
"CMakeFiles/matrix_cwise_4.dir/matrix_cwise.cpp.o"

# External object files for target matrix_cwise_4
matrix_cwise_4_EXTERNAL_OBJECTS =

test/matrix_cwise_4: test/CMakeFiles/matrix_cwise_4.dir/matrix_cwise.cpp.o
test/matrix_cwise_4: test/CMakeFiles/matrix_cwise_4.dir/build.make
test/matrix_cwise_4: test/CMakeFiles/matrix_cwise_4.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/sbronder/open_source/eigen/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable matrix_cwise_4"
	cd /home/sbronder/open_source/eigen/build/test && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/matrix_cwise_4.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
test/CMakeFiles/matrix_cwise_4.dir/build: test/matrix_cwise_4
.PHONY : test/CMakeFiles/matrix_cwise_4.dir/build

test/CMakeFiles/matrix_cwise_4.dir/clean:
	cd /home/sbronder/open_source/eigen/build/test && $(CMAKE_COMMAND) -P CMakeFiles/matrix_cwise_4.dir/cmake_clean.cmake
.PHONY : test/CMakeFiles/matrix_cwise_4.dir/clean

test/CMakeFiles/matrix_cwise_4.dir/depend:
	cd /home/sbronder/open_source/eigen/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/sbronder/open_source/eigen /home/sbronder/open_source/eigen/test /home/sbronder/open_source/eigen/build /home/sbronder/open_source/eigen/build/test /home/sbronder/open_source/eigen/build/test/CMakeFiles/matrix_cwise_4.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : test/CMakeFiles/matrix_cwise_4.dir/depend

