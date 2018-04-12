#' Get a specific breached site, based in breach name (not domain)
#'
#' @param name Search for a specific named breach
#' @inheritParams data_classes
#'
#' @inherit data_classes details
#'
#' @return Data.frame containing breach details
#' @export
#'
#' @examples
#' breached_site("Adobe")
breached_site <- function(name, verbose = TRUE, agent = NULL) {
  if (is.null(name) | length(name) != 1 | !inherits(name, "character")){
    stop("Problematic breach name")
  }

  URLS <- "https://haveibeenpwned.com/api/breach/" # nolint
  encoded <- urltools::url_encode(name)
  URLS <- paste0(URLS, encoded) # nolint
  res <- GETcontent(URLS, HIBP_headers(agent), verbose)# nolint
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
