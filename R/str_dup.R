# `R/str_dup.R` is imported from `inst/staticexports/str_dup.R`. 
# Please edit that file instead.

#' Duplicate and concatenate strings within a character vector
#'
#' Dependency-free drop-in alternative for `stringr::str_dup()`.
#'
#' @param string Input character vector.
#' @param times Number of times to duplicate each string.
#'
#' @return A character vector.
#' @export
str_dup <- function(string, times) {
	strrep(string, times)
}
