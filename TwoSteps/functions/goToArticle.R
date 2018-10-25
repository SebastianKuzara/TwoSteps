
goToArticle <- function(URL)
{
  options(timeout = 4000000)
  cat(paste0("Read article (", readArticleNr, "/", noOfArticlesToRead, "): ", URL, "\n"))
  page <- xml2::read_html(URL)
  return(page)
}