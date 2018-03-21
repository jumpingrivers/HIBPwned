#' Used to extract content from a GET request and collapse to a data.frame
#'
#' @param ... Pass through arguments
#'
#' @return data.frame
GETcontent <- function(...) {# nolint
  resp <- get(...)
  code <- httr::status_code(resp)
  content <- httr::content(
    resp, as = "text"
    , encoding = "utf-8"
  )
  if (code > 200) res <- data.frame(name = NA)
  if (code == 200) res <- jsonlite::fromJSON(content)
  return(res)
}

get <- ratelimitr::limit_rate(
  httr::GET,
  ratelimitr::rate(n = 1, period = 1.6)
)
