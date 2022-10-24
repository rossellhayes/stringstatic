test_that("can subset with regexps", {
	x <- c("a", "b", "c")
	expect_equal(str_subset(x, "a|c"), c("a", "c"))
	expect_equal(str_subset(x, "a|c", negate = TRUE), "b")
})

test_that("can subset with fixed patterns", {
	expect_equal(str_subset(c("i", "I"), fixed("i")), "i")
	expect_equal(
		str_subset(c("i", "I"), fixed("i", ignore_case = TRUE)),
		c("i", "I")
	)

	# negation works
	expect_equal(str_subset(c("i", "I"), fixed("i"), negate = TRUE), "I")
})

test_that("str_which is equivalent to grep", {
	expect_equal(
		str_which(head(letters), "[aeiou]"),
		grep("[aeiou]", head(letters))
	)

	# negation works
	expect_equal(
		str_which(head(letters), "[aeiou]", negate = TRUE),
		grep("[aeiou]", head(letters), invert = TRUE)
	)
})

test_that("can use fixed() and coll()", {
	expect_equal(str_subset(c("x", "."), fixed(".")), ".")
	# # Not yet implemented
	# expect_equal(str_subset(c("i", "\u0131"), turkish_I()), "\u0131")
})

# # This doesn't seem necessary
# test_that("can't use boundaries", {
# 	expect_snapshot(error = TRUE, {
# 		str_subset(c("a", "b c"), "")
# 		str_subset(c("a", "b c"), boundary())
# 	})
# })

test_that("vectorized", {
	x <- c("a", "b", "c")

	expect_equal(str_which(x, rev(x)), 2L)
	expect_equal(str_subset(x, rev(x)), "b")
})
