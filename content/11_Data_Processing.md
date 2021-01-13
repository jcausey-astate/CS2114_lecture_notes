---
title: "11: Data Processing"
date: 2021-01-13T12:00:00-05:00
draft: false
---
# Data Processing
## Featuring: STL Algorithms

---

## Algorithms

STL contains algorithms implemented as function templates.

- Designed to perform operations on containers.
- Requires algorithm header file  `#include <algorithm>`
- Includes:

        accumulate()      max()
        binary_search()   max_element()
        copy()            min()
        count()           min_element()
        fill()            reverse()
        find()            sort()
        is_sorted()       swap()

            ... and many more ...

---

## Algorithms Overview

* Algorithms use _iterators_ for operating on _ranges_ of values in a container.
* Most will take (at least) a "first" and "last" iterator:

![Sub-range in array](../images/shared/range_iterators_to_subrange.svg)

---

## Usually use `begin` and `end`

* If you want the entire container, then<br>`first = container.begin()` and `last = container.end()`.

![Range based iterators](../images/shared/range_iterators_in_array.svg)

---

Container-wise algorithms:

        accumulate()        is_sorted()
        binary_search()     max_element()
        copy()              min_element()
        count()             reverse()
        fill()              sort()
        find()

Element-wise algorithms:

        max()               swap()
        min()

---

### `accumulate(first, last, start_value)`
<br><br>


Returns the sum of the range [`first`,`last`), starting from the initial value `start_value`.

```cpp
std::vector<int> v{5,3,4,2,9,2,6,3,8};

int sum = std::accumulate(v.begin(), v.end(), 0);
std::cout << sum << '\n';
// 42
```

---

### `binary_search(first, last, target)`
<br><br>


Fast search in range for `target`; requires range to be sorted.  Returns `true` if the target is found, `false` otherwise.

```cpp
std::vector<int> v{0,2,4,6,8,10,12,14,16,18};

bool found = std::binary_search(v.begin(), v.end(), 10);
if( found ){
    std::cout << "Found 10.\n";
}
// Found 10
found = std::binary_search(v.begin(), v.end(), 9);
if( found ){
    std::cout << "Found 9.\n";
}
// (9 was not found, no output)
```

---

### `copy(src_first, src_last, dst_first)`
<br><br>


Copies range [`src_first`,`src_last`) to destination starting at `dst_first`.

```cpp
std::vector<int> v1{5,3,4,2,9,2,6,3,8};
std::vector<int> v2;
v2.resize(v1.size());  // Destination must be pre-allocated!

std::copy(v1.begin(), v1.end(), v2.begin());

for( auto item : v2 ){
    std::cout << item << '\t';
}
// 5  3  4  2  9  2  6  3  8
```

Note that invalid arguments cause _**undefined behavior**_.

---

### `count(first, last, target)`
<br><br>


Count the number of times `target` appears in the range.

```cpp
std::vector<int> v{5,2,4,2,9,2,6,3,8};

int number_of_twos = std::count(v.begin(), v.end(), 2);

std::cout << "There are " << number_of_twos << " twos.\n";
// There are 3 twos.
```

---

### `fill(first, last, value)`
<br><br>


Fill a range with a single value.

```cpp
std::vector<int> v;
v.resize(10);

std::fill(v.begin(), v.end(), -1);

for( auto item : v ){
    std::cout << item << '\t';
}
// -1  -1  -1  -1  -1  -1  -1  -1  -1  -1
```

---

### `find(first, last, target)`
<br><br>


Find "target" element; returns an iterator to the target or `last` if not found.

```cpp
std::vector<int> v{5,3,4,2,9,2,6,3,8};

std::vector<int>::iterator it;
it = std::find(v.begin(), v.end(), 9);

if(it != v.end()){
    std::cout << "Found " << (*it) << '\n';
}
// Found 9
```

---

### `is_sorted(first, last)`
<br><br>


Returns `true` if the range is sorted; `false` otherwise.

```cpp
std::vector<int> v1{5,3,4,2,9,2,6,3,8};
std::vector<int> v2{0,1,2,3,4,5,6,7,8,9};

if( std::is_sorted(v1.begin(), v1.end())){
    std::cout << "v1 is sorted\n";
}

if( std::is_sorted(v2.begin(), v2.end())){
    std::cout << "v2 is sorted\n";
}
// v2 is sorted
```

---

### `max_element(first, last)`
<br><br>


Returns an iterator to the (first) maximum element.

```cpp
std::vector<int> v{5,3,4,2,9,2,6,3,8};

std::vector<int>::iterator it;
it = std::max_element(v.begin(), v.end());

std::cout << (*it) << '\n';
// 9
```

---

### `min_element(first, last)`
<br><br>


Returns an iterator to the (first) minimum element.

```cpp
std::vector<int> v{5,3,4,2,9,2,6,3,8};

std::vector<int>::iterator it;
it = std::min_element(v.begin(), v.end());

std::cout << (*it) << '\n';
// 2
```

---

### `reverse(first, last)`
<br><br>


Reverses the order of values in the range.

```cpp
std::vector<int> v{0,1,2,3,4,5,6,7,8,9};

std::reverse(v.begin(), v.end());

for( auto item : v ){
    std::cout << item << '\t';
}
// 9  8  7  6  5  4  3  2  1  0
```

---

### `sort(first, last)`
<br><br>


Sorts a container in-place.

```cpp
std::vector<int> v{5,2,4,9,7,1,6,3,0,8};

std::sort(v.begin(), v.end());

for( auto item : v ){
    std::cout << item << '\t';
}
// 0  1  2  3  4  5  6  7  8  9
```

---

### `max(value1, value2)`
<br><br>


Returns the larger of the two values.

```cpp
int a = 8;
int b = 12;

std::cout << std::max(a, b) << '\n';
// 12
```

---

### `min(value1, value2)`
<br><br>


Returns the smaller of the two values.

```cpp
int a = 8;
int b = 12;

std::cout << std::min(a, b) << '\n';
// 8
```

---

### `swap(value1, value2)`
<br><br>


Swaps the values stored in the arguments.

```cpp
int a = 8;
int b = 12;

std::swap(a, b);
std::cout << "a: " << a << " b: " << b << '\n';
// a: 12 b: 8
```

