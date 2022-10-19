str_subset <- function(string, pattern, negate = FALSE) {
	string[str_which(string, pattern, negate = negate)]
}
