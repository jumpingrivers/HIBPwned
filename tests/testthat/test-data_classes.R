context("data_classes")

test_that("data_classes works", {
  res <- data_classes()
  expect_is(res, "character")
  expect_gte(length(res), 48)

  # With header passthrough
  expect_error(data_classes(agent = "blah"), NA)
})
