str_detect <- function(string, pattern) {
	fixed <- inherits(pattern, "fixed")
	ignore.case <- attr(pattern, "options")$case_insensitive %||% FALSE

	grepl(
		pattern = pattern,
		x = string,
		ignore.case = ignore.case,
		perl = !fixed,
		fixed = fixed
	)
}
