#' Used to extract content from a GET request and collapse to a data.frame
#' @description It calls a helper function that retries up to 6 times
#'
#' @param URLS urls
#' @param headers headers as built by HIBP_headers()
#' @inheritParams data_classes
#'
#' @return data.frame

.GETcontent <- function(URLS, headers, verbose) {# nolint
  output <- get_and_retry(URLS, headers, verbose)

  try_number <- 1
  while (is.null(output) && try_number < 6) {
    try_number <- try_number + 1
    if (verbose){
      message(paste0("Try number ", try_number))
      if (try_number == 6){
        message("This is the last try, if it fails will return NULL") # nolint
      }
    }

    Sys.sleep(2 ^ try_number)
    output <- get_and_retry(URLS, headers, verbose)

  }
  return(output)
}


GETcontent <- memoise::memoise(.GETcontent)

crul_get <- function(url, headers){
  crul::HttpClient$new(url = url,
                       headers = headers)$get()
}


get <- ratelimitr::limit_rate(
  crul_get,
  ratelimitr::rate(n = 1, period = 1.6)
)



get_and_retry <- function(url, headers, verbose) {# nolint
  resp <- get(url, headers)
  code <- resp$status_code
  content <- resp$parse(encoding = "UTF-8")
  if (code > 200){
    # this will happen when no result
    if (code == 404){
      res <- data.frame(Name = NA)
    }else{
      # this is more problematic and we shall try again
      if (verbose){
        message(paste("http error code:", code))
      }

      res <- NULL
      }

  }
  if (code == 200) res <- jsonlite::fromJSON(content)
  return(res)
}
