project-7-bin
-------------

**Intro**

Use an external library.

**Guide**

In this project, we are going to link against a library to build our executable, but this time the library will have already been built in another project. So we need to know where we can find the header files and libraries.

For such a task, we start by coping the `Find<project>.cmake` module from the project that provides the libraries. With that file in our project, we can tell CMake that we want to use project `<project>`, and let it figure out where that is. We do that with the `find_package` function. If the library files are found successfully, we use the `<project>_INCLUDE_DIR` and `<project>_LIBRARIES` variables to configure our project.

Now execute the following to build the project, and install the executable.

```
> cd project-7/project-7-bin
> mkdir build
> cd build
> cmake -DCMAKE_INSTALL_PREFIX=~/sdbe-output ..
> make
> make install
```

Run the `tree` command to observe how the `sdbe-output` directory is structured.

```
/home/<username>/sdbe-output
├── bin
│   └── program
├── include
│   └── project7lib
│       ├── baz.h
│       └── qux.h
└── lib
    ├── libbaz.a
    └── libqux.a
```

You can now update the `PATH` shell variable and be able to run the executable from anywhere.

```
> export PATH=$PATH:~/sdbe-output/bin
> program
```
