test_that("succesfully wraps str_replace_all", {
	expect_equal(str_remove_all("abababa", "ba"), "a")
	expect_equal(str_remove("abababa", "ba"), "ababa")
})

test_that("vectorized", {
	expect_equal(
		str_remove_all(c("abababa", "acacaca"), c("ba", "ca")),
		c("a", "a")
	)
	expect_equal(
		str_remove(c("abababa", "acacaca"), c("ba", "ca")),
		c("ababa", "acaca")
	)
})
