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
include unsupported/doc/examples/CMakeFiles/example_EulerAngles.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include unsupported/doc/examples/CMakeFiles/example_EulerAngles.dir/compiler_depend.make

# Include the progress variables for this target.
include unsupported/doc/examples/CMakeFiles/example_EulerAngles.dir/progress.make

# Include the compile flags for this target's objects.
include unsupported/doc/examples/CMakeFiles/example_EulerAngles.dir/flags.make

unsupported/doc/examples/CMakeFiles/example_EulerAngles.dir/EulerAngles.cpp.o: unsupported/doc/examples/CMakeFiles/example_EulerAngles.dir/flags.make
unsupported/doc/examples/CMakeFiles/example_EulerAngles.dir/EulerAngles.cpp.o: /home/sbronder/open_source/eigen/unsupported/doc/examples/EulerAngles.cpp
unsupported/doc/examples/CMakeFiles/example_EulerAngles.dir/EulerAngles.cpp.o: unsupported/doc/examples/CMakeFiles/example_EulerAngles.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/sbronder/open_source/eigen/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object unsupported/doc/examples/CMakeFiles/example_EulerAngles.dir/EulerAngles.cpp.o"
	cd /home/sbronder/open_source/eigen/build/unsupported/doc/examples && /mnt/sw/nix/store/6560mkp838syd8jpp6gdyyisczwcvs67-gcc-11.4.0/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT unsupported/doc/examples/CMakeFiles/example_EulerAngles.dir/EulerAngles.cpp.o -MF CMakeFiles/example_EulerAngles.dir/EulerAngles.cpp.o.d -o CMakeFiles/example_EulerAngles.dir/EulerAngles.cpp.o -c /home/sbronder/open_source/eigen/unsupported/doc/examples/EulerAngles.cpp

unsupported/doc/examples/CMakeFiles/example_EulerAngles.dir/EulerAngles.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/example_EulerAngles.dir/EulerAngles.cpp.i"
	cd /home/sbronder/open_source/eigen/build/unsupported/doc/examples && /mnt/sw/nix/store/6560mkp838syd8jpp6gdyyisczwcvs67-gcc-11.4.0/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/sbronder/open_source/eigen/unsupported/doc/examples/EulerAngles.cpp > CMakeFiles/example_EulerAngles.dir/EulerAngles.cpp.i

unsupported/doc/examples/CMakeFiles/example_EulerAngles.dir/EulerAngles.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/example_EulerAngles.dir/EulerAngles.cpp.s"
	cd /home/sbronder/open_source/eigen/build/unsupported/doc/examples && /mnt/sw/nix/store/6560mkp838syd8jpp6gdyyisczwcvs67-gcc-11.4.0/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/sbronder/open_source/eigen/unsupported/doc/examples/EulerAngles.cpp -o CMakeFiles/example_EulerAngles.dir/EulerAngles.cpp.s

# Object files for target example_EulerAngles
example_EulerAngles_OBJECTS = \
"CMakeFiles/example_EulerAngles.dir/EulerAngles.cpp.o"

# External object files for target example_EulerAngles
example_EulerAngles_EXTERNAL_OBJECTS =

unsupported/doc/examples/example_EulerAngles: unsupported/doc/examples/CMakeFiles/example_EulerAngles.dir/EulerAngles.cpp.o
unsupported/doc/examples/example_EulerAngles: unsupported/doc/examples/CMakeFiles/example_EulerAngles.dir/build.make
unsupported/doc/examples/example_EulerAngles: unsupported/doc/examples/CMakeFiles/example_EulerAngles.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/sbronder/open_source/eigen/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable example_EulerAngles"
	cd /home/sbronder/open_source/eigen/build/unsupported/doc/examples && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/example_EulerAngles.dir/link.txt --verbose=$(VERBOSE)
	cd /home/sbronder/open_source/eigen/build/unsupported/doc/examples && ./example_EulerAngles >/home/sbronder/open_source/eigen/build/unsupported/doc/examples/EulerAngles.out

# Rule to build all files generated by this target.
unsupported/doc/examples/CMakeFiles/example_EulerAngles.dir/build: unsupported/doc/examples/example_EulerAngles
.PHONY : unsupported/doc/examples/CMakeFiles/example_EulerAngles.dir/build

unsupported/doc/examples/CMakeFiles/example_EulerAngles.dir/clean:
	cd /home/sbronder/open_source/eigen/build/unsupported/doc/examples && $(CMAKE_COMMAND) -P CMakeFiles/example_EulerAngles.dir/cmake_clean.cmake
.PHONY : unsupported/doc/examples/CMakeFiles/example_EulerAngles.dir/clean

unsupported/doc/examples/CMakeFiles/example_EulerAngles.dir/depend:
	cd /home/sbronder/open_source/eigen/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/sbronder/open_source/eigen /home/sbronder/open_source/eigen/unsupported/doc/examples /home/sbronder/open_source/eigen/build /home/sbronder/open_source/eigen/build/unsupported/doc/examples /home/sbronder/open_source/eigen/build/unsupported/doc/examples/CMakeFiles/example_EulerAngles.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : unsupported/doc/examples/CMakeFiles/example_EulerAngles.dir/depend

