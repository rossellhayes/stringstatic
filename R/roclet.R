roxy_tag_parse.roxy_tag_staticexport <- function(x) {
	roxygen2::tag_words(x, min = 0, max = 1)
}

staticexport_roclet <- function() {
	roxygen2::roclet("staticexport")
}

roclet_process.roclet_staticexport <- function(x, blocks, env, base_path) {
	results <- list(fun = character(0), dest = character(0))

	for (block in blocks) {
		if (!roxygen2::block_has_tags(block, "staticexport")) next

		results$fun <- append(results$fun, block$object$alias)

		dest <- roxygen2::block_get_tag(block, "staticexport")$val
		if (identical(dest, "")) dest <- fs::path_file(block$file)
		results$dest <- append(results$dest, dest)
	}

	results$dest[results$dest == ""] <- "staticexports"
	results
}

roclet_output.roclet_staticexport <- function(x, results, base_path, ...) {
	dest_dir <- fs::path(base_path, "inst/staticexports")
	fs::dir_create(dest_dir)

	for (dest in unique(results$dest)) {
		dest_file <- fs::path(dest_dir, fs::path_ext_set(dest, ext = "R"))

		these_funs <- results$fun[results$dest == dest]

		suppressMessages(
			staticimports::import_objs(
				these_funs,
				source = fs::path(base_path, "R"),
				outfile = dest_file
			)
		)

		cli::cli_alert_success(
			"Copied {.val {these_funs}} into {.path {dest_file}}."
		)
	}

	invisible(NULL)
}
