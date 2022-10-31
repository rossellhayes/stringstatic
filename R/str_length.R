# `R/str_length.R` is imported from `inst/staticexports/str_length.R`. 
# Please edit that file instead.

#' Compute the length of a string
#'
#' Dependency-free drop-in alternative for `stringr::str_length()`.
#'
#' @source Adapted from the [stringr](https://stringr.tidyverse.org/) package.
#'
#' @param string Input vector.
#'   Either a character vector, or something coercible to one.
#'
#' @return A numeric vector the same length as string.
#' @export
str_length <- function(string) {
	nchar(as.character(string), type = "chars", keepNA = TRUE)
}

#' Compute the width of a string
#'
#' Dependency-free drop-in alternative for `stringr::str_width()`.
#'
#' @source Adapted from the [stringr](https://stringr.tidyverse.org/) package.
#'
#' @param string Input vector.
#'   Either a character vector, or something coercible to one.
#'
#' @return A numeric vector the same length as string.
#' @export
str_width <- function(string) {
	nchar(as.character(string), type = "width", keepNA = TRUE)
}
