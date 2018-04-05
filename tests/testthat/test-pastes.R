context("pastes")

test_that("pastes works for a single account", {
  acct <- "steff.sullivan@gmail.com"

  # Simplest usage scenario
  res <- pastes(acct)

  expect_is(res, "list")
  expect_named(res, acct)
  expect_equal(length(res), 1)
  expect_is(res[[acct]], "data.frame")
  expect_gte(ncol(res[[acct]]), 1)
  expect_gte(nrow(res[[acct]]), 1)

  # With header passthrough
  expect_error(pastes(acct, agent = "blah"), NA)
})

test_that("pastes works for multiple accounts", {
  acct <- c("steff.sullivan@gmail.com", "stephanie.g.locke@gmail.com")

  # Simplest usage scenario
  res <- pastes(acct)

  expect_is(res, "list")
  expect_named(res, acct)
  expect_equal(length(res), length(acct))
  for (i in 1:length(acct)) {
    a <- acct[i]
    expect_is(res[[a]], "data.frame")
    expect_gte(ncol(res[[a]]), 1)
    expect_gte(nrow(res[[a]]), 1)
  }

  # With header passthrough
  expect_error(pastes(acct, agent = "blah"), NA)
})

test_that("handles incorrect values", {
  errors <- "Problematic emails"

  expect_error(pastes(TRUE), errors)
  expect_error(pastes(as.character(c())), errors)
})
