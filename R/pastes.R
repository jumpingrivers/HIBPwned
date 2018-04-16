#' Search for cases where an email address has been included in
#' a paste
#'
#' @param emails A character vector of email addresses
#' @inheritParams data_classes
#'
#' @inherit data_classes details
#'
#' @return List of data.frames containing results
#' @details According to the API docs
#' (\url{https://haveibeenpwned.com/FAQs#Pastes}),
#' "A "paste" is information that has been "pasted" to a publicly facing website
#'  designed to share content such as Pastebin."
#' @export
#'
#' @examples
#' pastes(c("steff.sullivan@gmail.com","stephanie.g.locke@gmail.com"))
pastes <- function(
                   emails
                   , verbose = TRUE
                   , agent = NULL) {
  if (length(emails) == 0 | !inherits(emails, "character")){
    stop("Problematic emails")
  }

  encoded <- urltools::url_encode(emails)
  URLS <- paste0(# nolint
    "https://haveibeenpwned.com/api/pasteaccount/"
    , encoded
  )

  res <- lapply(URLS, GETcontent, HIBP_headers(agent), verbose)# nolint
  names(res) <- emails

  return(res)
}
