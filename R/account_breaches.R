#' Search for data breaches associated with one or more accounts.
#'
#' @param accounts A character vector of email addresses or account names
#' @param truncate Whether responses should be trimmed to just name of
#' breached site
#' @param domain Search a specific domain
#' @param ... Optional passthrough to HIBP_headers()
#'
#' @return List of data.frames containing results
#' @export
#'
#' @examples
#' account_breaches(c("steff.sullivan@gmail.com","stephanie.g.locke@gmail.com"))
account_breaches <- function(
                             accounts
                             , truncate=FALSE
                             , domain=NULL
                             , ...) {

  if (length(accounts) == 0 | !inherits(accounts, "character")){
    stop("Problematic accounts")
  }

  if (length(truncate) != 1 | !inherits(truncate, "logical")){
    stop("Problematic truncate")
  }

  if (!is.null(domain) & (
    length(domain) != 1 | !inherits(domain, "character"))) {
    stop("Problematic domain")
  }

  encoded <- urltools::url_encode(accounts)
  urls <- paste0(
    "https://haveibeenpwned.com/api/breachedaccount/"
    , encoded
  )

  if (truncate) urls <- urltools::param_set(urls, "truncateResponse", "true")
  if (!is.null(domain)){
    urls <- urltools::param_set(urls, "domain", urltools::url_encode(domain))
  }

  res <- lapply(urls, GETcontent, HIBP_headers(...))# nolint
  names(res) <- accounts

  return(res)
}
