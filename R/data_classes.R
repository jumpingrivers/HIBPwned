#' Get list of classes of data that have been
#' exposed in breaches
#'
#' @param verbose whether to message about http errors and re-tries
#' @param agent agent to be used as header in calls, by default "HIBPwned R pkg". # nolint
#'
#' @details Note that the package uses \code{memoise}
#' (\url{https://github.com/r-lib/memoise})
#' with no timeout argument
#' so that results are cached inside an active R session.
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
