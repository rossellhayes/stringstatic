str_subset <- function(string, pattern) {
	string[str_which(string, pattern)]
}
