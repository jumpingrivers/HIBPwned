#' Used to extract content from a GET request and collapse to a data.frame
#' @description It calls a helper function that retries up to 6 times
#'
#' @param ... Pass through arguments
#'
#' @return data.frame
GETcontent <- function(...) {# nolint
  output <- get_and_retry(...)
  try_number <- 1
  while (is.null(output) && try_number < 6) {
    message(paste0("Server returned nothing, trying again, try number ", try_number))# nolint
    Sys.sleep(2 ^ try_number)
    output <- get_and_retry(...)
    try_number <- try_number + 1
  }
  return(output)
}

get <- ratelimitr::limit_rate(
  httr::GET,
  ratelimitr::rate(n = 1, period = 1.6)
)

get_and_retry <- function(...) {# nolint
  resp <- get(...)
  code <- httr::status_code(resp)
  content <- httr::content(
    resp, as = "text"
    , encoding = "utf-8"
  )
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
