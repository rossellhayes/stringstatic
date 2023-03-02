test_that("zero-length input", {
	expect_equal(str_detect(character(0), character(0)), logical(0))
	expect_equal(str_starts(character(0), character(0)), logical(0))
	expect_equal(str_ends(character(0), character(0)), logical(0))
})

test_that("mixed zero- and non-zero-length input", {
	expect_equal(str_detect(character(0), ""), logical(0))
	expect_equal(str_starts(character(0), ""), logical(0))
	expect_equal(str_ends(character(0), ""), logical(0))
})


# These tests are adapted from tests in the stringr package
# https://github.com/tidyverse/stringr
#
# stringr is released under the MIT License
#
# Copyright (c) 2020 stringr authors
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# 	The above copyright notice and this permission notice shall be included in all
# copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.

test_that("special cases are correct", {
	expect_equal(str_detect(NA, "x"), NA)
	expect_equal(str_detect(character(), "x"), logical())
})

test_that("vectorised patterns work", {
	expect_equal(str_detect("ab", c("a", "b", "c")), c(T, T, F))
	expect_equal(str_detect(c("ca", "ab"), c("a", "c")), c(T, F))

	# negation works
	expect_equal(str_detect("ab", c("a", "b", "c"), negate = TRUE), c(F, F, T))
})

test_that("str_starts() and str_ends() match expected strings", {
	expect_equal(str_starts(c("ab", "ba"), "a"), c(TRUE, FALSE))
	expect_equal(str_ends(c("ab", "ba"), "a"), c(FALSE, TRUE))

	# negation
	expect_equal(str_starts(c("ab", "ba"), "a", negate = TRUE), c(FALSE, TRUE))
	expect_equal(str_ends(c("ab", "ba"), "a", negate = TRUE), c(TRUE, FALSE))

	# correct precedence
	expect_equal(str_starts(c("ab", "ba", "cb"), "a|b"), c(TRUE, TRUE, FALSE))
	expect_equal(str_ends(c("ab", "ba", "bc"), "a|b"), c(TRUE, TRUE, FALSE))
})

test_that("can use fixed() and coll()", {
	expect_equal(str_detect("X", fixed(".")), FALSE)
	expect_equal(str_starts("X", fixed(".")), FALSE)
	expect_equal(str_ends("X", fixed(".")), FALSE)

	# # `coll()` is not implemented
	# expect_equal(str_detect("\u0131", turkish_I()), TRUE)
	# expect_equal(str_starts("\u0131", turkish_I()), TRUE)
	# expect_equal(str_ends("\u0131", turkish_I()), TRUE)
})

## This doesn't seem necessary
# test_that("can't empty/boundary", {
# 	expect_snapshot(error = TRUE, {
# 		str_detect("x", "")
# 		str_starts("x", "")
# 		str_ends("x", "")
# 	})
# })

## This doesn't seem necessary
# test_that("functions use tidyverse recycling rules", {
# 	expect_snapshot(error = TRUE, {
# 		str_detect(1:2, 1:3)
# 		str_starts(1:2, 1:3)
# 		str_ends(1:2, 1:3)
# 		str_like(1:2, c("a", "b", "c"))
# 	})
# })

## `str_like()` is not implemented
# # str_like ----------------------------------------------------------------
#
# test_that("str_like works", {
# 	expect_true(str_like("abc", "ab%"))
# 	expect_snapshot(str_like("abc", regex("x")), error = TRUE)
# })
#
# test_that("like_to_regex generates expected regexps",{
# 	expect_equal(like_to_regex("ab%"), "^ab.*$")
# 	expect_equal(like_to_regex("ab_"), "^ab.$")
#
# 	# escaping
# 	expect_equal(like_to_regex("ab\\%"), "^ab\\%$")
# 	expect_equal(like_to_regex("ab[%]"), "^ab[%]$")
# })
