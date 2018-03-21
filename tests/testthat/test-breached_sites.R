context("breached_sites")

test_that("breached_sites works", {

  # Simplest usage scenario
  res <- breached_sites()

  expect_is(res, "data.frame")
  expect_gt(ncol(res), 1)
  expect_gt(nrow(res), 1)

  # With domain (known breach)
  res <- breached_sites(domain = "adobe.com")

  expect_is(res, "data.frame")
  expect_gt(ncol(res), 1)
  expect_equal(nrow(res), 1)

  # With domain (no breach)
  res <- breached_sites(domain = "xyz.com")

  expect_is(res, "data.frame")
  expect_gt(ncol(res), 1)
  expect_equal(nrow(res), 1)

  # With header passthrough
  expect_error(breached_sites(agent = "blah"), NA)
})


test_that("handles incorrect values", {
  errors <- "Problematic domain"

  expect_error(breached_sites(TRUE), errors)
  expect_error(breached_sites(as.character(c())), errors)
  expect_error(breached_sites(rep(errors, 2)), errors)
})
