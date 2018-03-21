#' Get a specific breached site, based in breach name (not domain)
#'
#' @param name Search for a specific named breach
#' @param ... Optional passthrough to HIBP_headers()
#'
#' @return Data.frame containing breach details
#' @export
#'
#' @examples
#' breached_site("Adobe")
breached_site <- function(name, ...) {
  if (is.null(name) | length(name) != 1 | !inherits(name, "character")){
    stop("Problematic breach name")
  }

  urls <- "https://haveibeenpwned.com/api/breach/"
  encoded <- urltools::url_encode(name)
  urls <- paste0(urls, encoded)
  res <- GETcontent(urls, HIBP_headers(...))
  if (length(res) == 1) {
    res <- list(
      Title = NA, Name = name, Domain = NA,
      BreachDate = NA, AddedDate = NA, PwnCount = NA,
      Description = NA, DataClasses = NA, IsVerified = NA,
      IsSensitive = NA, LogoType = NA
    )
  }

  res$DataClasses <- paste(res$DataClasses, sep = ", ", collapse = ", ")# nolint
  res <- data.frame(res)

  return(res)
}
