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
* Most will take (at least) a "begin" and "end" iterator.

![Range based iterators](https://cdn.rawgit.com/jcausey-astate/CS2114_lecture_notes/master/assets/images/shared/range_iterators_in_array.svg)

---

## "`first`" and "`last`" to define a range:

![Sub-range in array](https://cdn.rawgit.com/jcausey-astate/CS2114_lecture_notes/master/assets/images/shared/range_iterators_to_subrange.svg)

* If you want the entire container, then<br>`first = container.begin()` and `last = container.end()`.
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
