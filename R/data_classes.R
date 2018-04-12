#' Get list of classes of data that have been
#' exposed in breaches
#'
#' @param verbose whether to message about http errors and re-tries
#' @param agent agent to be used as header in calls, by default "HIBPwned R pkg". # nolint
#'
#' @return Data.frame containing data class details
#' @export
#'
#' @examples
#' data_classes()
data_classes <- function(verbose = TRUE, agent = NULL) {
  URLS <- "https://haveibeenpwned.com/api/dataclasses" # nolint
  res <- GETcontent(URLS, HIBP_headers(agent), verbose)# nolint
  return(res)
}
