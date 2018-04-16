#' Get all (nonsensitive) breached sites in HIBP
#'
#' @param domain Search a specific domain
#' @inheritParams data_classes
#'
#' @inherit data_classes details
#'
#' @return Data.frame containing breach details
#' @export
#'
#' @examples
#' breached_sites()
breached_sites <- function(domain=NULL, verbose = TRUE, agent = NULL) {
  if (!is.null(domain) & (
    length(domain) != 1 | !inherits(domain, "character"))) {
    stop("Problematic domain")
  }
  URLS <- "https://haveibeenpwned.com/api/breaches" # nolint
  if (!is.null(domain)){
    URLS <- urltools::param_set(URLS, "domain", urltools::url_encode(domain)) # nolint
  }

  res <- GETcontent(URLS, HIBP_headers(agent), verbose)# nolint
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
