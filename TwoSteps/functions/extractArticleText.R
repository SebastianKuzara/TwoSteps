
extractArticleText <- function(page)
{
  articleText <- page %>%
    rvest::html_node(x = ., xpath = "//div[@id='bodyContent']") %>%
    rvest::html_text()
  return(articleText)
}
