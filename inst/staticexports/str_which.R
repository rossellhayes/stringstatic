str_which <- function(string, pattern) {
	fixed <- inherits(pattern, "fixed")
	ignore.case <- attr(pattern, "options")$case_insensitive %||% FALSE

	grep(
		pattern,
		x = string,
		ignore.case = ignore.case,
		perl = !fixed,
		fixed = fixed
	)
}
