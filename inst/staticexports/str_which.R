str_which <- function(string, pattern, negate = FALSE) {
	is_fixed <- inherits(pattern, "fixed")
	ignore.case <- isTRUE(attr(pattern, "options")$case_insensitive)

	grep(
		pattern,
		x = string,
		ignore.case = ignore.case,
		perl = !is_fixed,
		fixed = is_fixed,
		invert = negate
	)
}
