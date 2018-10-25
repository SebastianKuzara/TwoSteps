
getArticleTitle <- function(page)
{
  articleTitle <- page %>%
    html_node(xpath = "//head/title") %>%
    html_text() %>%
    gsub(pattern = " - Wikipedia", replacement = "", x = .)
  return(articleTitle)
}