project-6
---------

**Intro**

Configure a project with CMake.

**Guide**

In `project-5`, we saw how to use `make` to automate the build process.  That was a big step, but there are still some issues. The `Makefile` is tied to a specific compiler. If we want to use another one, we will have to modify the makefile. Working directly with a compiler has also the disadvantage that we have to remember its options and be able to form the commands. We should also keep in mind that `make` is a linux tool, and thus the `Makefile` is not supported natively on other operating systems, like Windows. At last, `make` builds a project in-place, polluting this way the source tree. For all these reasons, we use the `CMake` to configure a project and never write a `Makefile` directly.

`CMake` is also a build tool, but it offers more and higher-level functionality than `make`. It is cross-platform, meaning that it works on all operating systems. CMake doesn't actually build a project. What it does is produce the native configuration files for each operating system, so we can compile the project afterwards. The idea is write once, compile everywhere. On Linux, it will produce a `Makefile`. On Windows, it will produce a Visual Studio project. Also, CMake can create out of source builds, so that the project directory doesn't get filled with compiled code and other files that we will later need to get rid of. Finally, with CMake we can greatly parameterize our configuration files. For example, we will never have to directly specify a path that might need to change on another computer. We can write modules with candidate paths for a library, and let CMake search within those paths and set a variable with the right path to the library.

`CMake` configures a project by reading files named `CMakeLists.txt`. The minimum requirements for a `CMakeLists.txt` are thw following two lines:

```
cmake_minimum_required(VERSION <version>)
project(<project-name>)
```

We need to specify the minimum CMake version, required by the project, and the project name. If we don't know what CMake version we need, we can just give the version of CMake present on our system (run `cmake --version`).

After that, we meet the requiremnents for a compilation as before. That is, we use the `include_directories` function to specify the include paths. We create targets with the `add_library` and `add_executable` functions. We declare depencencies with the `add_dependencies` function. We link targets to other libraries with the `target_link_libraries` function. Open the project's `CMakeLists.txt` file, if you haven't done so already, and notice how much more human-readable it is.

To build the project, we start by creating a directory anywhere we like. Then, we navigate inside that directory and we run `cmake`. Now the makefiles have been created and we can use `make` to get our libraries and executable.

```
> cd project-6
> mkdir build
> cd build
> cmake ..
> make
> ./program
```

Later, if we need to clean the project, we simply delete the `build` directory and we are done.
