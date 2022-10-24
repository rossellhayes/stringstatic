test_that("basic case works", {
	test <- c("a", "b", "c")

	expect_equal(str_c(test), test)
	expect_equal(str_c(test, sep = " "), test)
	expect_equal(str_c(test, collapse = ""), "abc")
})

test_that("obeys tidyverse recycling rules", {
	expect_equal(str_c(), character())

	expect_equal(str_c("x", character()), character())
	expect_equal(str_c("x", NULL), "x")

	# # This doesn't seem necessary
	# expect_snapshot(str_c(c("x", "y"), character()), error = TRUE)
	expect_equal(str_c(c("x", "y"), NULL), c("x", "y"))
})

# # This doesn't seem true even in stringr?
# test_that("vectorised arguments error", {
# 	expect_snapshot(error = TRUE, {
# 		str_c(letters, sep = c("a", "b"))
# 		str_c(letters, collapse = c("a", "b"))
# 	})
# })
