#' Used to extract content from a GET request and collapse to a data.frame
#'
#' @param ... Pass through arguments
#'
#' @return data.frame
GETcontent<-function(..., dontSleep=FALSE){
  Sys.sleep(1.6)
  resp<-httr::GET(...)
  code<-httr::status_code(resp)
  content<-httr::content(resp ,as="text"
                         ,encoding="utf-8")
  if(code >200) res<-data.frame(name=NA)
  if(code==200) res<-jsonlite::fromJSON(content)
  return(res)
}
