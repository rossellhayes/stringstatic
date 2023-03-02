test_that("zero-length input", {
	expect_equal(str_extract(character(0), character(0)), character(0))
	expect_equal(str_extract_all(character(0), character(0)), list())
})

test_that("mixed zero- and non-zero-length input", {
	expect_equal(str_extract(character(0), ""), character(0))
	expect_equal(str_extract_all(character(0), ""), list())
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

test_that("single pattern extracted correctly", {
	test <- c("one two three", "a b c")

	expect_equal(
		str_extract_all(test, "[a-z]+"),
		list(c("one", "two", "three"), c("a", "b", "c"))
	)

	expect_equal(
		str_extract_all(test, "[a-z]{3,}"),
		list(c("one", "two", "three"), character())
	)
})

# # This doesn't seem necessary
# test_that("uses tidyverse recycling rules", {
# 	expect_error(
# 		str_extract(c("a", "b"), c("a", "b", "c")),
# 		class = "vctrs_error_incompatible_size"
# 	)
# 	expect_error(
# 		str_extract_all(c("a", "b"), c("a", "b", "c")),
# 		class = "vctrs_error_incompatible_size"
# 	)
# })

test_that("no match yields empty vector", {
	expect_equal(str_extract_all("a", "b")[[1]], character())
})

test_that("str_extract extracts first match if found, NA otherwise", {
	shopping_list <- c("apples x4", "bag of flour", "bag of sugar", "milk x2")
	word_1_to_4 <- str_extract(shopping_list, "\\b[a-z]{1,4}\\b")

	expect_length(word_1_to_4, length(shopping_list))
	expect_equal(word_1_to_4[1], NA_character_)
})

# # Not yet implemented
# test_that("can extract a group", {
# 	expect_equal(str_extract("abc", "(.).(.)", group = 1), "a")
# 	expect_equal(str_extract("abc", "(.).(.)", group = 2), "c")
# })

test_that("can use fixed() and coll()", {
	expect_equal(str_extract("x.x", fixed(".")), ".")
	expect_equal(str_extract_all("x.x.", fixed(".")), list(c(".", ".")))

	# # not yet implemented
	# expect_equal(str_extract("\u0131", turkish_I()), "\u0131")
	# expect_equal(str_extract_all("\u0131I", turkish_I()), list(c("\u0131", "I")))
})

# # Not yet implemented
# test_that("can extract boundaries", {
# 	expect_equal(str_extract("a b c", ""), "a")
# 	expect_equal(
# 		str_extract_all("a b c", ""),
# 		list(c("a", " ", "b", " ", "c"))
# 	)
#
# 	# # Not yet implemented
# 	# expect_equal(str_extract("a b c", boundary("word")), "a")
# 	# expect_equal(
# 	# 	str_extract_all("a b c", boundary("word")),
# 	# 	list(c("a", "b", "c"))
# 	# )
# })

test_that("edge cases", {
	expect_equal(str_extract(NA, "a"), NA_character_)
	expect_equal(str_extract_all(NA, "a"), list(NA_character_))

	expect_equal(str_extract(c(NA, "a"), "a"), c(NA, "a"))
	expect_equal(str_extract_all(c(NA, "a"), "a"), list(NA_character_, "a"))

	expect_equal(str_extract(character(0), "a"), character(0))
	expect_equal(str_extract_all(character(0), "a"), list())

	expect_equal(str_extract("a", NA_character_), NA_character_)
	expect_equal(str_extract_all("a", NA_character_), list(NA_character_))

	expect_equal(str_extract("a", c(NA, "a")), c(NA, "a"))
	expect_equal(str_extract_all("a", c(NA, "a")), list(NA_character_, "a"))

	expect_equal(str_extract("a", character(0)), character(0))
	expect_equal(str_extract_all("a", character(0)), list())
})
