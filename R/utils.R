#' Used to extract content from a GET request and collapse to a data.frame
#' @description It calls a helper function that retries up to 6 times
#'
#' @param URLS urls
#' @param headers headers as built by HIBP_headers()
#' @param ... Pass through arguments
#'
#' @return data.frame
GETcontent <- function(URLS, headers,...) {# nolint
  output <- get_and_retry(URLS, headers, ...)
  try_number <- 1
  while (is.null(output) && try_number < 6) {
    try_number <- try_number + 1
    message(paste0("Try number ", try_number))
    Sys.sleep(2 ^ try_number)
    output <- get_and_retry(...)
  }
  return(output)
}

crul_get <- function(url, headers){
  crul::HttpClient$new(url = url,
                       headers = headers)$get()
}

get <- ratelimitr::limit_rate(
  crul_get,
  ratelimitr::rate(n = 1, period = 1.6)
)

get_and_retry <- function(...) {# nolint
  resp <- get(...)
  code <- resp$status_code
  content <- resp$parse(encoding = "UTF-8")
  if (code > 200){
    # this will happen when no result
    if (code == 404){
      res <- data.frame(name = NA)
    }else{
      # this is more problematic and we shall try again
      message(paste("http error code:", code))
      res <- NULL
      }

  }
  if (code == 200) res <- jsonlite::fromJSON(content)
  return(res)
}
