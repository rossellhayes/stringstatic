test_that("zero-length input", {
	expect_equal(str_split(character(0), character(0)), list())
	expect_equal(
		str_split_fixed(character(0), character(0), 1),
		matrix(character(0))
	)
})

test_that("mixed zero- and non-zero-length input", {
	expect_equal(str_split(character(0), ""), list())
	expect_equal(
		str_split_fixed(character(0), "", 1),
		matrix(character(0))
	)
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
	expect_equal(str_split(NA, "")[[1]], NA_character_)
	expect_equal(str_split(character(), ""), list())
})

test_that("str_split functions as expected", {
	expect_equal(
		str_split(c("bab", "cac", "dadad"), "a"),
		list(c("b", "b"), c("c", "c"), c("d", "d", "d"))
	)
})

test_that("str_split() can split by special patterns", {
	expect_equal(str_split("ab", ""), list(c("a", "b")))
	# # Not yet implemented
	# expect_equal(str_split("this that.", boundary("word")), list(c("this", "that")))
	expect_equal(str_split("a-b", fixed("-")), list(c("a", "b")))
	# # not yet implemented
	# expect_equal(str_split("aXb", coll("X", ignore_case = TRUE)), list(c("a", "b")))
})

# # Not yet implemented
# test_that("boundary() can be recycled", {
# 	expect_equal(str_split(c("x", "y"), boundary()), list("x", "y"))
# })

test_that("str_split() can control maximum number of splits", {
	expect_equal(
		str_split(c("a", "a-b"), n = 1, "-"),
		list("a", "a-b")
	)
	expect_equal(
		str_split(c("a", "a-b"), n = 3, "-"),
		list("a", c("a", "b"))
	)
})

test_that("str_split simplify", {
	expect_equal(str_split(NA, "", simplify = TRUE), matrix(NA_character_))
	expect_equal(
		str_split(character(), "", simplify = TRUE),
		matrix(character(0), 0, 0)
	)

	expect_equal(
		str_split(c("bab", "cac", "dadad"), "a", simplify = TRUE),
		matrix(c("b", "b", "", "c", "c", "", "d", "d", "d"), nrow = 3, byrow = TRUE)
	)

	expect_equal(
		str_split(c("a", "a-b"), n = 1, "-", simplify = TRUE),
		matrix(c("a", "a-b"))
	)
	expect_equal(
		str_split(c("a", "a-b"), n = 3, "-", simplify = TRUE),
		matrix(c("a", "", "", "a", "b", ""), nrow = 2, byrow = TRUE)
	)
})

# test_that("str_split() checks its inputs", {
# 	expect_error(str_split(letters[1:3], letters[1:2]))
# 	expect_error(str_split("x", 1))
# 	expect_error(str_split("x", "x", n = 0))
# 	expect_error(str_split("x", "x", n = 1.5))
# })

# test_that("str_split_1 takes string and returns character vector", {
# 	expect_equal(str_split_1("abc", ""), c("a", "b", "c"))
# 	# expect_snapshot_error(str_split_1(letters, ""))
# })

test_that("str_split_fixed pads with empty string", {
	expect_equal(
		str_split_fixed(c("a", "a-b"), "-", 1),
		cbind(c("a", "a-b")))
	expect_equal(
		str_split_fixed(c("a", "a-b"), "-", 2),
		cbind(c("a", "a"), c("", "b"))
	)
	expect_equal(
		str_split_fixed(c("a", "a-b"), "-", 3),
		cbind(c("a", "a"), c("", "b"), c("", ""))
	)
})
#
# test_that("str_split_fixed check its inputs", {
# 	expect_snapshot(str_split_fixed("x", "x", 0), error = TRUE)
# })
#
# test_that("str_split_i returns NA for absent components", {
# 	expect_equal(str_split_i(c("a", "b-c"), "-", 1), c("a", "b"))
# 	expect_equal(str_split_i(c("a", "b-c"), "-", 2), c(NA, "c"))
# 	expect_equal(str_split_i(c("a", "b-c"), "-", 3), c(NA_character_, NA))
# })
#
# test_that("str_split_i check its inputs", {
# 	expect_snapshot(str_split_i("x", "x", 0), error = TRUE)
# })
