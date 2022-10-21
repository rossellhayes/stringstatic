# stringstatic (development version)

## Major changes
* All `stringstatic` functions now have documentation.
* All `stringstatic` functions are now exported. They can be run interactively by loading the `stringstatic` package. Using `staticimports` remains the recommended way to use `stringstatic` functions in your own package.
* `staticimports` is now available under the MIT-0 License. This allows you to use code from `stringstatic` in your own package however you'd like, with no limitations.

## New functions
* Added `regex()`.
* Added `str_count()`.
* Added `str_dup()`.
* Added `str_replace_na()`.

## New arguments
* `str_detect()`, `str_subset()` and `str_which()` gain the `negate` argument.
* `str_extract_all()` gains the `simplify` argument.

## Refactoring
* All functions have been refactored to no longer rely on `%||%`. This helps improve the portability of `stringstatic` functions. As a result, `%||%` has been removed.
* `str_remove()` and `str_remove_all()` have been refactored to no longer rely on `str_replace()` and `str_replace_all()`. This improves their portability.

# stringstatic 0.0.2

* Added `str_match()`

# stringstatic 0.0.1

* Initial release with the following functions:
  - `str_detect()`
  - `str_extract()`
  - `str_extract_all()`
  - `str_replace()`
  - `str_replace_all()`
  - `str_remove()`
  - `str_remove_all()`
  - `str_subset()`
  - `str_which()`
  - `fixed()`
  - `%||%`
