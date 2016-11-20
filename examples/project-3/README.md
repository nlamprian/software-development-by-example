project-3
---------

**Intro**

Compile with include path option.

**Guide**

Now we are going to organize our files.

We will place the header files in the `include/<project-name>` directory and the source files in the `src` directory. The additional `<project-name>` directory for the header files is so that we don't create any conflicts between different libraries when we install our libraries in a system directory.

Now try to execute the following:

```
> cd project-3
> g++ src/code.cpp src/baz.cpp -o program
> ./program
```

We should get an error telling us that the compiler is not able to find `baz.h`, i.e. `fatal error: baz.h: No such file or directory`. So, we have to let the compiler know where it can find `baz.h`. We do that with the `-I<include-path>` option.

Please know that at an include statement, we don't just specify the name of a header file. We give a relative path from the directory we have specified to the compiler. So depending on the the `-I<include-path>` option, we adjust accordingly the include statements in the source files. Given that we are in the `project-3` directory, we will specify the `-Iinclude` option to the compiler, and we will update the include statements in the source files to contain the `project-3` directory (refering to the `project-3` directory within the `include` directory).

Now execute the following. This time the program should compile successfully.

```
> g++ -Iinclude src/code.cpp src/baz.cpp -o program
> ./program
```

We have met one requirement by the compiler, i.e. specify the paths where the compiler can find header files. We can provide multiple `-I` options, if our headers are in different directories.
