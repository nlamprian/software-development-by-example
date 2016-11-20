project-7-lib
-------------

**Intro**

Install a library.

**Guide**

In this project, we are going to build and install our libraries. What we have to do more this time is make some calls to the `install` function. We specify that we want the `project7lib` directory to be installed in an `include` directory, and the `baz` and `qux` libraries to be installed in a `lib` directory. The `include` and `lib` directories are relative to a base path. If we don't specify this path, it defaults to `/usr/local/`. If we want to change that, CMake gives us a variable `CMAKE_INSTALL_PREFIX` that we can set when we run `cmake`.

Now execute the following to build the project and install the libraries. We will use a folder in the home directory to install our files.

```
> cd project-7/project-7-lib
> mkdir build
> cd build
> cmake -DCMAKE_INSTALL_PREFIX=~/sdbe-output ..
> make
> make install
```

Run the `tree` command to observe how the `sdbe-output` directory is structured.

```
/home/<username>/sdbe-output
├── include
│   └── project7lib
│       ├── baz.h
│       └── qux.h
└── lib
    ├── libbaz.a
    └── libqux.a
```

Every project that provides a library should also provide a `Find<project>.cmake` module, so that other projects are able to locate its header files and libraries. In the `Find<project>.cmake` file, we specify a number of candidate paths where CMake can find the headers and libraries. If the process is successful, two variables are set. `<project>_INCLUDE_DIR` contains the path to the header files. `<project>_LIBRARIES` contains the libraries with their full paths. With these variables, we can now configure a project that needs to use those libraries.
