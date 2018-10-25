
getAllATagsFromArticle <- function(page)
{
  aTags <- page %>%
    rvest::html_node(x = ., xpath = "//div[@id='bodyContent']") %>%
    rvest::html_nodes(x = ., xpath = "//a")
  
  return(aTags)
}