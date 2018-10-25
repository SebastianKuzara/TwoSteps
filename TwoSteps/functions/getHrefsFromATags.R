
getHrefsFromATags <- function(aTags)
{
  
  hrefs <- lapply(aTags, function(x) {
    x %>% rvest::html_attr(x = ., name = "href")
  })
  hrefs <- unlist(hrefs)
  return(hrefs)
  
}