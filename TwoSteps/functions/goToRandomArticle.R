

goToRandomArticle <- function()
{
  URL <- "https://en.wikipedia.org/wiki/Special:Random"
  page <- xml2::read_html(URL)
  articleTitle <- getArticleTitle(page = page)
  message(paste("Starting article:", articleTitle))
  return(page)
}
