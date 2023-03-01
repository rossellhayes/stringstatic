test_that("zero-length input", {
	expect_equal(str_subset(character(0), character(0)), character(0))
	expect_equal(str_which(character(0), character(0)), integer(0))
})

test_that("mixed zero- and non-zero-length input", {
	expect_equal(str_subset(character(0), ""), character(0))
	expect_equal(str_which(character(0), ""), integer(0))
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
