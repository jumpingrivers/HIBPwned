#' Construct headers for a HIBP request.
#' [Optional] Change the agent to make the request bespoke to you.
#'
#' @param agent The user agent the API call should run under
#' @param ...
#'
#' @return headers
#' @export
#'
#' @examples
#' HIBP_headers()
HIBP_headers<-function(agent="HIBPwned R pkg",...){
  httr::add_headers(
     `api-version` = 2
    ,`User-Agent` = agent
  )
}
