#' Get list of classes of data that have been
#' exposed in breaches
#'
#' @param ... Optional passthrough to HIBP_headers()
#'
#' @return Data.frame containing data class details
#' @export
#'
#' @examples
#' data_classes()
data_classes <- function(...) {
  URLS <- "https://haveibeenpwned.com/api/dataclasses"
  res <- GETcontent(URLS, HIBP_headers(...))
  return(res)
}
