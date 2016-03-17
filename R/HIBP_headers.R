#' Construct headers for a HIBP request.
#' [Optional] Change the agent to make the request bespoke to you.
#'
#' @param agent The user agent the API call should run under
#'
#' @return headers
#' @export
#'
#' @examples
#' HIBP_headers()
HIBP_headers<-function(agent="HIBPwned R pkg"){
  if(length(agent)!=1|!inherits(agent,"character")) stop("Problematic agent")
  httr::add_headers(
     `api-version` = 2
    ,`User-Agent` = agent
  )
}
