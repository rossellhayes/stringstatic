#' Keep strings matching a pattern
#'
#' Dependency-free drop-in alternative for `stringr::str_subset()`.
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
#' @param negate If `TRUE`, return non-matching elements.
#'
#' @return A character vector.
#' @noRd
str_subset <- function(string, pattern, negate = FALSE) {
	string[str_which(string, pattern, negate = negate)]
}
