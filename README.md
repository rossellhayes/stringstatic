
<!-- README.md is generated from README.Rmd. Please edit that file -->

# stringstatic <img src="man/figures/logo.png?raw=TRUE" align="right" height="138" />

<!-- badges: start -->

[![](https://www.r-pkg.org/badges/version/stringstatic)](https://cran.r-project.org/package=stringstatic)
[![r-universe status
badge](https://rossellhayes.r-universe.dev/badges/stringstatic)](https://rossellhayes.r-universe.dev/stringstatic)
[![](https://img.shields.io/badge/lifecycle-stable-brightgreen.svg)](https://lifecycle.r-lib.org/articles/stages.html#stable)
[![License:
CC0](https://img.shields.io/badge/license-CC0-brightgreen.svg)](https://creativecommons.org/publicdomain/zero/1.0/)
[![R build
status](https://github.com/rossellhayes/stringstatic/workflows/R-CMD-check/badge.svg)](https://github.com/rossellhayes/stringstatic/actions)
[![](https://app.codecov.io/gh/rossellhayes/stringstatic/branch/main/graph/badge.svg)](https://app.codecov.io/gh/rossellhayes/stringstatic)
[![Dependencies](https://tinyverse.netlify.com/badge/stringstatic)](https://cran.r-project.org/package=stringstatic)
<!-- badges: end -->

`stringstatic` provides a reimplementation of several functions from
[`stringr`](https://stringr.tidyverse.org/). These functions are
dependency free and can be copied directly into your package code using
[`staticimports`](https://github.com/wch/staticimports). This allows you
to reap the benefits of `stringr`’s intuitive user interface without the
overhead of `stringr`’s dependencies.

See section [Pros and cons](#pros-and-cons) to decide whether
`stringstatic` or `stringr` is a better fit for your package.

## Installation

You can install the development version of `stringstatic` from
[GitHub](https://github.com/rossellhayes/stringstatic):

``` r
# install.packages("pak")
pak::pkg_install("rossellhayes/stringstatic")
```

## Usage

To import functions from `stringstatic` into your package, put a comment
block starting with `# @staticimports pkg:stringstatic` in one of your R
source files. For example, your `utils.R` file may have this at the top:

    # @staticimports pkg:stringstatic
    #  str_replace str_replace_all
    #  str_subset

`pkg:stringstatic` means you will import functions from the
`stringstatic` package. You can find many other useful functions in
[`pkg:staticimports`](https://github.com/wch/staticimports).

Subsequent lines list the objects to import from the package. In this
case, they are `str_replace()`, `str_replace_all()` and `str_subset()`.

To perform the import, run:

``` r
staticimports::import()
```

By default, this will write the functions to an `R/staticimports.R` file
in your project.

## Pros and cons

### Pros

- `stringstatic` does not depend on `stringi`, which is a heavy
  dependency that can increase install times if it is not already
  installed.
- `stringstatic` functions can be copied directly into your package,
  meaning future breaking changes will not change functionality in your
  package.

### Cons

- `stringi`, which powers `stringr`, provides better Unicode support
  than R’s built-in regex engine. If you expect to work with non-ASCII
  text, `stringr` may provide better results.
  - While `stringi` is a heavy dependency, users are likely to already
    have it installed because it is included when installing the
    `tidyverse`.
- If `stringstatic` functions are copied directly into your package, you
  will not automatically benefit from improvements or bug fixes.

## Code of Conduct

Please note that the `stringstatic` project is released with a
[Contributor Code of
Conduct](https://contributor-covenant.org/version/2/1/CODE_OF_CONDUCT.html).
By contributing to this project, you agree to abide by its terms.

------------------------------------------------------------------------

Hex sticker image by Flavia Rossell Hayes.

Hex sticker font is [Source Sans by
Adobe](https://github.com/adobe-fonts/source-sans).
