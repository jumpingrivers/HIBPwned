context("HIBP_headers")

test_that("headers are constructed correctly", {
  res <- HIBP_headers()

  # Correct type
  expect_is(res, "list")

  # Expected population
  expect_true(length(res) == 2)
  expect_named(res, c("api-version", "User-Agent"))
  expect_equal(res,
               list(`api-version` = "2", `User-Agent` = "HIBPwned R pkg"))
})

test_that("alternative agents work", {
  res <- HIBPwned:::crul_get("https://haveibeenpwned.com/api/breaches",
                  HIBP_headers("blah"))
  expect_equal(res$request_headers$`User-Agent`, "blah")

  res <- HIBPwned:::crul_get("https://haveibeenpwned.com/api/breaches",
                             HIBP_headers("bloo"))
  expect_equal(res$request_headers$`User-Agent`, "bloo")
})

test_that("handles incorrect values", {
  error <- "Problematic agent"
  expect_error(HIBP_headers(1), error)
  expect_error(HIBP_headers(list()), error)
  expect_error(HIBP_headers(LETTERS[1:2]), error)
})
