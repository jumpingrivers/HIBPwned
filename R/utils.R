#' Used to extract content from a GET request and collapse to a data.frame
#'
#' @param ... Pass through arguments
#'
#' @return data.frame
GETcontent<-function(...){
  content<-httr::content(httr::GET(...) ,as="text"
                         ,encoding="utf-8")
  if(content=="") resp<-data.frame(name=NA)
  if(content!="") resp<-jsonlite::fromJSON(content)
  return(resp)
}
