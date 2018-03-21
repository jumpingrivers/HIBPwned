context("breached_site")

test_that("breached_site works", {

  # Simplest usage scenario
  res <- breached_site("Adobe")

  expect_is(res, "data.frame")
  expect_gt(ncol(res), 1)
  expect_equal(nrow(res), 1)

  # With name (no breach)
  res <- breached_site("abc")

  expect_is(res, "data.frame")
  expect_gt(ncol(res), 1)
  expect_equal(nrow(res), 1)

  # With header passthrough
  expect_error(breached_site("Adobe", agent = "blah"), NA)
})


test_that("handles incorrect values", {
  errors <- "Problematic breach name"

  expect_error(breached_site(TRUE), errors)
  expect_error(breached_site(as.character(c())), errors)
  expect_error(breached_site(rep(errors, 2)), errors)
})
