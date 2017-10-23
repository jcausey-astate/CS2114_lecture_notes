
# STL and `std::vector`
### (Ch. 16.5)

---?image=assets/images/STL/circle_template.jpg

#   STL
##  The C++ <br> Standard Template Library

---


## The Standard Template Library

- What is STL?
- Why use STL?
- Overview of STL Features and Concepts
- Containers
- Iterators
- Algorithms
- References for more information on STL

---

##  What is STL?

> "The Standard Template Library provides a set of well structured 
> generic C++ components that work together in a seamless way."
>
> \- Alexander Stepanov & Meng Lee,  
>    _The Standard Template Library_ 

- Designed to provide a common, familiar interface. 
- Designed to meet specific performance/complexity goals.
- Keeps programmers from "re-inventing the wheel".

---

##  Why Use STL?

- Reuse: "Write less, do more"
    - STL hides complex, error-prone details.
    - Allows you to focus on the problem.
    - Type-safe compatibility between components.
- Flexibility
    - Iterators decouple algorithms from containers.
    - Unanticipated combinations easily supported.
- Efficiency
    - Templates avoid virtual function overhead.
    - Strict attention to time and/or space complexity of algorithms.


---

## STL Features and Concepts

- Containers
    - Sequence: `vector`, `list`, `deque`
    - Associative: `set`, `multiset`, `map`, `multimap`
- Adapters: `stack`, `queue`, `priority_queue`
- Iterators
    - Used to access elements in containers
    - Input, output, forward, bidirectional, & random access
    - Each container declares a trait for the type of iterator it provides
- Generic Algorithms
    - Mutating, non-mutating, sorting, numeric

---

## STL Containers

- STL Containers are _Abstract Data Types_ (ADTs)
- All containers are parameterized by the type(s) they contain.
- All declare traits :
    - e.g. `iterator`, `const_iterator`, `value_type`, etc.

---


## Container Types

- Sequence 
    - Provide efficient linear access to data
    - Element order is not related to value
    - Think arrays and linked lists
- Associative     
    - Provide efficient access to data stored as a key/value pair
    - Keys can be ordered by `operator<`
    - Implemented as balanced binary trees
- Adapters
    - Provide alternative ways to access sequence and associative containers
    - e.g. `stack`, `queue`, `priority_queue`


---


## Sequence Container: `std::vector`

STL’s `std::vector` is essentially a dynamic array.

- Grows and shrinks at the end.
- Supports `push_back()` and `pop_back()` sequential (end) access.
- Optimized for random access using array index operator. (`[]`)
- Supports random access iterators
    - An _iterator_ is an object used to access individual items in a container, or to move (i.e. "iterate") through the container. 
- `vector`s know their own size!


+++

<!-- .slide: data-transition="linear", data-background="aliceblue" -->

## `std::vector` Example
    
``` cpp
using std::vector;
using std::string;
// [...]
vector<string> v;                   // create vector

v.push_back("The number is 10");    // push some values
v.push_back("The number is 20");    // into it...
v.push_back("The number is 30");

cout << "Loop by index:" << endl;

for(vector<string>::size_type i=0;  // size type is unsigned
    i < v.size();                   // vector knows its size!
    i++){                           // print values by            
   cout << v[i] << endl;            // indexing the
}                                   // vector like an array
```

+++

<!-- .slide: data-transition="linear", data-background="aliceblue" -->

<small style="font-size: 90%;">

## `std::vector` Example 2
    
``` cpp
std::vector<std::string> v;         // create vector

v.push_back("The number is 10");    // push some values
v.push_back("The number is 20");    // into it...
v.push_back("The number is 30");

cout << "Loop by range:" << endl;

for(auto it = v.begin();            // iterator
    it != v.end();                  // runs from begin()
    ++it)                           // to end(), one at a time
{                                   // and is 
   cout << *it << endl;             // dereferenced to
}                                   // print the value
```

</small>

* Think of an iterator as an arrow pointing to a value in the container.
* The _dereference operator_ (`*`) is used to "follow the arrow" to get the value an iterator is pointing to.

+++

<!-- .slide: data-transition="linear", data-background="aliceblue" -->

## `std::vector` Example 2b
    
``` cpp
std::vector<std::string> v;         // create vector

v.push_back("The number is 10");    // push some values
v.push_back("The number is 20");    // into it...
v.push_back("The number is 30");

cout << "Loop by range:" << endl;

for( auto item : v ){               // for each item in v
   cout << item << endl;            // print the item
}                                                  
```

+++

<!-- .slide: data-transition="linear", data-background="aliceblue" -->

## `std::vector` Example 3
    
``` cpp
auto v = std::vector<std::string>{3};    // pre-size to 3

int  n = 1;
for( auto& item : v){                    // each item (by ref.)
    item = std::string{"The number is "} // generate message
         + std::to_string(10 * n++);     // and store in item
}

cout << "Loop by range:" << endl;

for( auto item : v ){                    // for each item
   cout << item << endl;                 // print the item
}                              
```

_`std::to_string()` is contained in `<std::string>`_


---

## Iterators

Iterators are a generalization of pointers.

- Used to access information in containers, regardless of the internal layout
- Four types:
    - Forward (uses `++`)
    - Bidirectional (uses `++` and `--`)
    - Random-access (behave like normal pointers)
    - Input (can be used with input streams)
    - Output (can be used with output streams)


+++


## Iterator Example

<!-- .slide: data-transition="none", data-background="aliceblue" -->

``` cpp
std::vector<int> scores{3};

scores[0] = 88;
scores[1] = 92;
scores[2] = 76;

for(auto it = scores.begin(); it != grade_list.end(); it++){
    std::cout << *it << '\t';
}
std::cout << '\n';
```

---

## Algorithms

STL contains algorithms implemented as function templates.

- Designed to perform operations on containers.
- Requires algorithm header file  `#include <algorithm>`
- Includes:
    
        binary_search     count
        find              find_if         
        for_each          max_element
        min_element       partition
        random_shuffle    rotate
        sort              stable_partition
        stable_sort       ... and many more 

---

## C++ Standard Smart Pointers

Requires the `<memory>` header.

* `std::unique_ptr` - Takes singular (non-shared) ownership of a resource.
* `std::shared_ptr` - Assumes shared ownership of a resource.
* `std::weak_ptr` - A non-owning pointer that can be converted to a `shared_ptr` when access to the resource is required.



