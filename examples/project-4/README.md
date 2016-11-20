project-4
---------

**Intro**

Compile with library path and link options.

**Guide**

In this project, we are going to create and use a library.

A library represents reusable code. This code is compiled once and waits to be used by any program that needs it.

A library can be either static or dynamic. A static library (has extension `.a` in linux) is copied within each program that uses it. A dynamic library (has extension `.so` in linux) is not copied within each program, but loaded at runtime.

The first thing we have to do is to create the library. For this, we first use `g++` to create the object code, and then we call the `ar` command to produce the `.a` file, which represents our library. Notice that the archive (library) file has the following filename, `lib<library-name>.a`.

```
> cd project-4
> g++ -Iinclude -c src/baz.cpp
> ar rvs libbaz.a baz.o
```

The library has now been created and we can use it. In the `g++` command, we omit the `src/baz.cpp` file, since it is already compiled. However, we have to declare that we want the `baz` library to be linked to our program. For this, we need to specify two things. We have to use the `-L<library-path>` option to tell the compiler where it can find our libraries, and the `-l<library>` option to tell it the specific library we are interested in.

```
> g++ -Iinclude src/code.cpp -L. -lbaz -o program
> ./program
```

We have met two additional requirements by the compiler, i.e. specify the paths where the compiler can find libraries, and specify the libraries we want to link against. We can provide multiple `-L` and `-l` options, if we have more than one libraries, and they are in different directories.
