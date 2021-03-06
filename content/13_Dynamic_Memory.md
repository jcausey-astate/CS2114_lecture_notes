---
title: "13: Dynamic Memory"
date: 2021-01-13T12:00:00-05:00
draft: false
---
# Dynamic Memory<br />Allocation
## CS2114 (Ch. 9.8)

---

## Creating Memory at Runtime

New memory can be allocated for individual data values or arrays at runtime.

* **`new`** operator allocates new memory.
    - returns a pointer to the allocated space.
    - Places responsibility on the programmer to "clean up" the memory later.
* **`delete`** operator de-allocates memory that was allocated with `new`.
    - Failure to de-allocate memory creates a _memory leak_.

Both operators come in two forms; one for a single data item and one for an array.

---

### Example (single item)

``` cpp
// Allocate a single Real-number value:
double* rPtr = new double;

std::cout << "Enter rainfall amount from last night: ";
std::cin  >> *rPtr;

std::cout << "It rained " << *rPtr << " inches last night.\n";

// De-allocate the memory when you are finished with it:
delete rPtr;        // delete doesn't change `rPtr`'s value...
rPtr = nullptr;     // null the pointer to safely disable it.
```

---

## Dynamic Memory Notes

* `new` allocates memory from a pool of free memory known as the "heap".
    - The heap is a limited resource.
* The pointer returned from the `new` operation is the _only_ "link" you have to the heap-allocated memory.  
    - The "owner" of this pointer has the _responsibility_ to make sure the memory is eventually `delete`d.  
    - If you lose the pointer, you've leaked the memory!
    - You may transfer ownership to another part of the program by passing the pointer.

---

## Dynamic Arrays

Normal C++ arrays cannot be sized at runtime.  This is a severe limitation.

* Either we over-allocate, which wastes space...
* Or we place a strict limit on the ability of the program's data to "grow".

With dynamic memory allocation, a variable _can_ be used to determine the size of an array at runtime.

This gives us the ability to write programs that "adapt" to the size of the data.

---

### Example (dynamic array)

``` cpp
double* scores;                         // array ptr
int n_scores;                           // size
std::cout << "Enter number of scores: ";
std::cin  >> n_scores;

scores = new double[n_scores];          // var size is OK

for(int i = 0; i < n_scores; i++){
    std::cout << "Enter score " << (i+1) << ": ";
    std::cin  >> scores[i];
}

// [...]    Use the data for something interesting...

delete [] scores;                      // de-allocate space
scores = nullptr;                      // disable the ptr
```

---

## Dynamic Array Notes

* Note the different `new` and `delete` operators for arrays:

``` cpp
int size = 10;
int* a = new int[size];   // new array
// [...]
delete [] a;              // delete array
```

**`new` Array Syntax**<br />
&nbsp;&nbsp;&nbsp;&nbsp;`new `&nbsp;&nbsp;_`type`_`[`_`size`_`]`

**`delete` Array Syntax**<br />
&nbsp;&nbsp;&nbsp;&nbsp;`delete [] `&nbsp;&nbsp;_` ptr`_


---


## C++11 Smart Pointers

C++ 11 introduces "smart pointers", which are really _objects_ that are used to wrap a raw pointer and provide more automatic management of resources "owned" by the pointer.

* Three kinds of smart pointer in C++11:
    - **`unique_ptr`** - used for _exclusive ownership_
    - **`shared_ptr`** - used for _shared ownership_
    - **`weak_ptr`** - a non-owning reference to a `shared_ptr` that can be upgraded to a `shared_ptr`.
* Requires the header **`<memory>`**

---

## `unique_ptr`

A `unique_ptr` retains sole ownership of an object, and destroys the object when the `unique_ptr` goes out of scope.

**Example**
``` cpp
int main(){   
   unique_ptr<int> ptr( new int ); // allocate & take ownership
   *ptr = 99;                      // place 99 at ptr
   std::cout << *ptr << "\n";      // print value at ptr (99)
   return 0;                       // frees memory as ptr leaves
}                                  // its local scope
```
<small>

* You must tell the `unique_ptr` what _type_ of data it will point to.
    - The part in the angle-brackets is called a _template type argument_
* You must initialize the `unique_ptr` to contain a pointer to a dynamically-allocated object.
    - This syntax is _object construction syntax_, like what we have seen with file streams.

</small>

---

## `unique_ptr` to Array

``` cpp
int main(){
    int n_scores;                           // size
    std::cout << "Enter number of scores: ";
    std::cin  >> n_scores;

    // allocate array and take ownership with `scores`:
    std::unique_ptr<double[]> scores( new double[n_scores] );

    for(int i = 0; i < n_scores; i++){
        std::cout << "Enter score " << (i+1) << ": ";
        std::cin  >> scores[i];
    }
    // [...]    Use the data for something interesting...
    return 0;   // scores gets de-allocated automatically
}
```
Pay attention to the _type argument_ **`<double[]>`** : Type `<double*>` will not work here.