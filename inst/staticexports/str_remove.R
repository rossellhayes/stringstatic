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
	is_fixed <- inherits(pattern, "stringr_fixed")

	string <- Vectorize(sub, c("pattern", "x"), USE.NAMES = FALSE)(
		pattern, replacement = "", x = string, perl = !is_fixed, fixed = is_fixed
	)

	mode(string) <- "character"
	string
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
	is_fixed <- inherits(pattern, "stringr_fixed")

	string <- Vectorize(gsub, c("pattern", "x"), USE.NAMES = FALSE)(
		pattern, replacement = "", x = string, perl = !is_fixed, fixed = is_fixed
	)

	mode(string) <- "character"
	string
}
