fixed <- function(pattern, ignore_case = FALSE) {
	structure(
		pattern,
		options = list(case_insensitive = ignore_case),
		class = c("fixed", "pattern", "character")
	)
}
