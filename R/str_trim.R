#' Remove whitespace
#'
#' Dependency-free drop-in alternative for `stringr::str_trim()`.
#'
#' @source Adapted from the [stringr](https://stringr.tidyverse.org/) package.
#'
#' @param string Input vector.
#'   Either a character vector, or something coercible to one.
#'
#' @param side Side on which to remove whitespace:
#'   `"left"`, `"right"`, or `"both"`, the default.
#'
#' @return A character vector the same length as `string`.
#' @export
#' @staticexport
str_trim <- function(string, side = c("both", "left", "right")) {
	side <- match.arg(side)
	if (side != "right") string <- sub("^\\s+", "", string, perl = TRUE)
	if (side != "left") string <- sub("\\s+$", "", string, perl = TRUE)
	string
}

#' Remove whitespace
#'
#' Dependency-free drop-in alternative for `stringr::str_squish()`.
#'
#' @source Adapted from the [stringr](https://stringr.tidyverse.org/) package.
#'
#' @param string Input vector.
#'   Either a character vector, or something coercible to one.
#'
#' @return A character vector the same length as `string`.
#' @export
#' @staticexport
str_squish <- function(string) {
	string <- sub("^\\s+", "", string, perl = TRUE)
	string <- sub("\\s+$", "", string, perl = TRUE)
	gsub("\\s+", " ", string, perl = TRUE)
}
