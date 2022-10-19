#' Remove matched patterns in a string
#'
#' Dependency-free drop-in alternative for `stringr::str_remove()`.
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
#' @noRd
str_remove <- function(string, pattern) {
	str_replace(string, pattern, replacement = "")
}

#' Remove matched patterns in a string
#'
#' Dependency-free drop-in alternative for `stringr::str_remove_all()`.
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
#' @noRd
str_remove_all <- function(string, pattern) {
	str_replace_all(string, pattern, replacement = "")
}
