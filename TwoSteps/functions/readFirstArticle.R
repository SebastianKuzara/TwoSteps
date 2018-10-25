
readFirstArticle <- function(searchedURL = searchedURL, articlePage = articlePage, URLcore)
{
  
  articleHref <- articlePage %>%
    getArticleTitle(page = .) %>%
    determineHrefByTitle(articleTitle = ., URLcore = URLcore)
  
  ifFound <- checkIfFoundSearchedURL(searchedURL = searchedURL, URLs = articleHref)
  
  
  pathToSuccess <- data.frame(
    Path = articleHref,
    CurrentAddress = articleHref,
    NextAddress = articleHref,
    IfFound = ifFound
    )
  
  return(pathToSuccess)
  
}