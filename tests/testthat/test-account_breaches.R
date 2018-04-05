context("account_breaches")

test_that("account_breaches works for a single account", {
  acct <- "steff.sullivan@gmail.com"

  # Simplest usage scenario
  res <- account_breaches(acct)

  expect_is(res, "list")
  expect_named(res, acct)
  expect_equal(length(res), 1)
  expect_is(res[[acct]], "data.frame")
  expect_gt(ncol(res[[acct]]), 1)
  expect_gte(nrow(res[[acct]]), 1)

  # With truncate
  res <- account_breaches(acct, truncate = TRUE)

  expect_is(res, "list")
  expect_named(res, acct)
  expect_equal(length(res), 1)
  expect_is(res[[acct]], "data.frame")
  expect_equal(ncol(res[[acct]]), 1) # key test
  expect_gte(nrow(res[[acct]]), 1)

  # With domain (known breach)
  res <- account_breaches(acct, domain = "adobe.com")

  expect_is(res, "list")
  expect_named(res, acct)
  expect_equal(length(res), 1)
  expect_is(res[[acct]], "data.frame")
  expect_gt(ncol(res[[acct]]), 1) # key test
  expect_gte(nrow(res[[acct]]), 1)

  # With domain (no breach)
  res <- account_breaches(acct, domain = "xyz.com")

  expect_is(res, "list")
  expect_named(res, acct)
  expect_equal(length(res), 1)
  expect_is(res[[acct]], "data.frame")
  expect_equal(ncol(res[[acct]]), 1) # key test
  expect_gte(nrow(res[[acct]]), 1)
})

test_that("account_breaches works for multiple accounts", {
  acct <- c("steff.sullivan@gmail.com", "stephanie.g.locke@gmail.com")

  # Simplest usage scenario
  res <- account_breaches(acct, as_list = TRUE)

  expect_is(res, "list")
  expect_named(res, acct)
  expect_equal(length(res), length(acct))
  for (i in 1:length(acct)) {
    a <- acct[i]
    expect_is(res[[a]], "data.frame")
    expect_gte(ncol(res[[a]]), 1)
    expect_gte(nrow(res[[a]]), 1)
  }

  # With truncate
  res <- account_breaches(acct, truncate = TRUE)

  expect_is(res, "list")
  expect_named(res, acct)
  expect_equal(length(res), length(acct))
  for (i in 1:length(acct)) {
    a <- acct[i]
    expect_is(res[[a]], "data.frame")
    expect_equal(ncol(res[[a]]), 1) # key test
    expect_gte(nrow(res[[a]]), 1)
  }

  # With domain (known breach)
  res <- account_breaches(acct, domain = "adobe.com")

  expect_is(res, "list")
  expect_named(res, acct)
  expect_equal(length(res), length(acct))
  for (i in 1:length(acct)) {
    a <- acct[i]
    expect_is(res[[a]], "data.frame")
    expect_gte(ncol(res[[a]]), 1) # key test
    expect_gte(nrow(res[[a]]), 1)
  }

  # With domain (no breach)
  res <- account_breaches(acct, domain = "xyz.com")

  expect_is(res, "list")
  expect_named(res, acct)
  expect_equal(length(res), length(acct))
  for (i in 1:length(acct)) {
    a <- acct[i]
    expect_is(res[[a]], "data.frame")
    expect_gte(ncol(res[[a]]), 1) # key test
    expect_gte(nrow(res[[a]]), 1)
  }

  # With header passthrough
  expect_error(account_breaches(acct, agent = "blah"), NA)
})

test_that("handles incorrect values", {
  errors <- paste0("Problematic ", c("accounts", "truncate", "domain"))
  acct <- "steff.sullivan@gmail.com"

  curerror <- errors[1]
  expect_error(account_breaches(TRUE), curerror)
  expect_error(account_breaches(as.character(c())), curerror)

  curerror <- errors[2]
  expect_error(account_breaches(acct, truncate = "a"), curerror)
  expect_error(account_breaches(acct, truncate = rep(TRUE, 2)), curerror)
  expect_error(account_breaches(acct, truncate = as.logical(c())), curerror)

  curerror <- errors[3]
  expect_error(account_breaches(acct, domain = TRUE), curerror)
  expect_error(account_breaches(acct, domain = rep(acct, 2)), curerror)
  expect_error(account_breaches(acct, domain = as.character(c())), curerror)
})

test_that("account_breaches can return a single data.frame", {
  res <- account_breaches("steff.sullivan@gmail.com", as_list = FALSE)
  expect_is(res, "data.frame")
  expect_true("account" %in% names(res))

  acct <- c("steff.sullivan@gmail.com", "stephanie.g.locke@gmail.com")

  res <- account_breaches(acct, as_list = FALSE)
  expect_is(res, "data.frame")
  expect_true("account" %in% names(res))

})
