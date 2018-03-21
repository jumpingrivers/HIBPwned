#' Search for cases where an email address has been included in
#' a paste
#'
#' @param emails A character vector of email addresses
#' @param ... Optional passthrough to HIBP_headers()
#'
#' @return List of data.frames containing results
#' @export
#'
#' @examples
#' pastes(c("steff.sullivan@gmail.com","stephanie.g.locke@gmail.com"))
pastes <- function(
                   emails
                   , ...) {
  if (length(emails) == 0 | !inherits(emails, "character")){
    stop("Problematic emails")
  }

  encoded <- urltools::url_encode(emails)
  urls <- paste0(
    "https://haveibeenpwned.com/api/pasteaccount/"
    , encoded
  )

  res <- lapply(urls, GETcontent, HIBP_headers(...))
  names(res) <- emails

  return(res)
}
