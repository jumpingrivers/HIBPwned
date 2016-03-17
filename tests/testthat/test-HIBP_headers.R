context("HIBP_headers")

test_that("headers are constructed correctly",{
  res<-HIBP_headers()

  # Correct type
  expect_is(res, "request")

  # No unexpected population
  expect_null(res$method)
  expect_null(res$url)
  expect_null(res$fields)
  expect_null(res$options)
  expect_null(res$auth_token)
  expect_null(res$output)

  # Expected population
  expect_true(length(res$headers)==2)
  expect_named(res$headers, c("api-version","User-Agent"))
  expect_equal(res$headers,c(`api-version`="2",`User-Agent`="HIBPwned R pkg"))

})

test_that("alternative agents work",{
  res<-HIBP_headers("blah")
  expect_equal(res$headers,c(`api-version`="2",`User-Agent`="blah"))

  res<-HIBP_headers(agent="bloo")
  expect_equal(res$headers,c(`api-version`="2",`User-Agent`="bloo"))
})
