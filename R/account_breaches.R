#' Search for data breaches associated with one or more accounts.
#'
#' @param accounts A character vector of email addresses or account names
#' @param truncate Whether responses should be trimmed to just name of
#' breached site
#' @param domain Search a specific domain
#' @param as_list whether to return results as a list (default, TRUE) or a data.frame,
#'  When returned as a data.frame only accounts with at least one breach are returned.
#' @inheritParams data_classes
#'
#' @return List of data.frames containing results
#'
#' @inherit data_classes details
#'
#' @export
#'
#' @examples
#' account_breaches(c("steff.sullivan@gmail.com","stephanie.g.locke@gmail.com"))
account_breaches <- function(
                             accounts
                             , truncate=FALSE
                             , domain=NULL
                             , as_list = TRUE
                             , verbose = TRUE
                             , agent = NULL) {

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
  URLS <- paste0( # nolint
    "https://haveibeenpwned.com/api/breachedaccount/"
    , encoded
  )

  if (truncate) URLS <- urltools::param_set(URLS, "truncateResponse", "true") # nolint
  if (!is.null(domain)){
    URLS <- urltools::param_set(URLS, "domain", urltools::url_encode(domain))# nolint
  }

  res <- lapply(URLS, GETcontent, HIBP_headers(agent), verbose = verbose)# nolint
  names(res) <- accounts
  if (!as_list){
    # bind the list and keep the account as a column
    accounts <- accounts[unlist(lapply(res, ncol)) > 2]
    res <- res[unlist(lapply(res, ncol)) > 2]
    account <- rep.int(accounts, times = lapply(res, nrow))
    if (length(res) > 1){

      res <- do.call("rbind", res)
      rownames(res) <- c()
    }else{
      res <- res[[1]]
    }
    res$account <- account
  }
  return(res)
}
