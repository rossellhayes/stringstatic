str_replace <- function(string, pattern, replacement) {
	is_fixed <- inherits(pattern, "fixed")
	ignore.case <- attr(pattern, "options")$case_insensitive %||% FALSE

	sub(
		pattern,
		replacement,
		x = string,
		ignore.case = ignore.case,
		perl = !is_fixed,
		fixed = is_fixed
	)
}

str_replace_all <- function(string, pattern, replacement, fixed = FALSE) {
	is_fixed <- inherits(pattern, "fixed")
	ignore.case <- attr(pattern, "options")$case_insensitive %||% FALSE

	if (!is.null(names(pattern))) {
		for (i in seq_along(pattern)) {
			string <- gsub(
				pattern = names(pattern)[[i]],
				replacement = pattern[[i]],
				x = string,
				ignore.case = ignore.case,
				perl = !is_fixed,
				fixed = is_fixed
			)
		}

		return(string)
	}

	gsub(
		pattern,
		replacement,
		x = string,
		ignore.case = ignore.case,
		perl = !is_fixed,
		fixed = is_fixed
	)
}
