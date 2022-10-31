# `R/str_remove.R` is imported from `inst/staticexports/str_remove.R`. 
# Please edit that file instead.

#' Remove matched patterns in a string
#'
#' Dependency-free drop-in alternative for `stringr::str_remove()`.
#'
#' @source Adapted from the [stringr](https://stringr.tidyverse.org/) package.
#'
#' @param string Input vector.
#'   Either a character vector, or something coercible to one.
#'
#' @param pattern Pattern to look for.
#'
#'   The default interpretation is a regular expression,
#'   as described in [base::regex].
#'   Control options with [regex()].
#'
#'   Match a fixed string (i.e. by comparing only bytes), using [fixed()].
#'   This is fast, but approximate.
#'
#' @return A character vector.
#' @export
str_remove <- function(string, pattern) {
	ignore.case <- isTRUE(attr(pattern, "options")$case_insensitive)
	is_fixed <- !ignore.case && inherits(pattern, "fixed")

	sub <- Vectorize(sub, c("pattern", "x"), USE.NAMES = FALSE)

	sub(
		pattern,
		replacement = "",
		x = string,
		ignore.case = ignore.case,
		perl = !is_fixed,
		fixed = is_fixed
	)
}

#' Remove matched patterns in a string
#'
#' Dependency-free drop-in alternative for `stringr::str_remove_all()`.
#'
#' @source Adapted from the [stringr](https://stringr.tidyverse.org/) package.
#'
#' @param string Input vector.
#'   Either a character vector, or something coercible to one.
#'
#' @param pattern Pattern to look for.
#'
#'   The default interpretation is a regular expression,
#'   as described in [base::regex].
#'   Control options with [regex()].
#'
#'   Match a fixed string (i.e. by comparing only bytes), using [fixed()].
#'   This is fast, but approximate.
#'
#' @return A character vector.
#' @export
str_remove_all <- function(string, pattern) {
	ignore.case <- isTRUE(attr(pattern, "options")$case_insensitive)
	is_fixed <- !ignore.case && inherits(pattern, "fixed")

	gsub <- Vectorize(gsub, c("pattern", "x"), USE.NAMES = FALSE)

	gsub(
		pattern,
		replacement = "",
		x = string,
		ignore.case = ignore.case,
		perl = !is_fixed,
		fixed = is_fixed
	)
}
