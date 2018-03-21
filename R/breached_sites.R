#' Get all (nonsensitive) breached sites in HIBP
#'
#' @param domain Search a specific domain
#' @param ... Optional passthrough to HIBP_headers()
#'
#' @return Data.frame containing breach details
#' @export
#'
#' @examples
#' breached_sites()
breached_sites <- function(domain=NULL, ...) {
  if (!is.null(domain) & (
    length(domain) != 1 | !inherits(domain, "character"))) {
    stop("Problematic domain")
  }
  URLS <- "https://haveibeenpwned.com/api/breaches"
  if (!is.null(domain)) URLS <- urltools::param_set(URLS, "domain", urltools::url_encode(domain))

  res <- GETcontent(URLS, HIBP_headers(...))
  if (identical(res, list())) {
    res <- data.frame(
      Title = NA, Name = NA, Domain = domain,
      BreachDate = NA, AddedDate = NA, PwnCount = NA,
      Description = NA, DataClasses = NA, IsVerified = NA,
      IsSensitive = NA, LogoType = NA
    )
  }
  return(res)
}
