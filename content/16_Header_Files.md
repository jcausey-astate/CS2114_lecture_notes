---
title: "16: Header Files"
date: 2021-01-13T12:00:00-05:00
draft: false
---

# C++ Header Files


---

## Header Files

In C++, _header files_ are used to contain re-usable code, preventing the programmer from having to manually copy/paste the code into multiple programs.

- Make the pre-processor do the work!
- Typically end with a _`.h`_ extension.
- Contain source code that is not intended for compilation.


---

## Header Files

- Header files are just regular C++ source code files.
- Typically contain function/class/structure definitions.
- Included in other source files by using the `#include` directive.
    - Think "copy-and-paste", but the _pre-processor_ does the work.
    

---

## Include Guards

- Header files may be `#included` by multiple source files in a single project.
    + This would lead to multiple definitions of the same functions/classes/structures.
        + _Multiple definitions are illegal in C++_
- _Include Guards_ are used to prevent the body of the header file from being included multiple times.


---


## Include Guards

```cpp
#ifndef HEADER_NAME_H
#define HEADER_NAME_H

// [ ... ] C++ source code goes here...

#endif
```

- The include guards shown above would be in a header file called _`header_name.h`_.
    + It is convention to use CAPS for the file name, and replace the "dot" with an underscore.
- The pre-processor will only perform the copy/paste the _first time_ the file is included.
    + This happens since the global name `HEADER_NAME_H` hasn't been defined yet at that point.


---

## Header File Example

```cpp
/**
 * @file array_functions.h
 *
 * TODO: file-level header info should be placed
 *       here (see Grading Guidelines)
 */
#ifndef ARRAY_FUNCTIONS_H
#define ARRAY_FUNCTIONS_H

#include <iostream>

// TODO: function comment header goes here!
void print_array(double a[], int size){
    for(int i = 0; i < size; i++){
        std::cout << a[i] << "\n";
    }
}

#endif
```

---

## Header File Location

There are actually two versions of the familiar `#include` directive:

- `#include < header_name >`
    + Pre-processor looks for _`header_name`_ in the _standard system include directories_.
- `#include "path/to/header_file.h"`
    + Full path name is used to directly access the file.
    + If only file name is provided, it should be placed in the same directory as the _`.cpp`_ file.
