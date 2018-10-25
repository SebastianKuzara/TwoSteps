getNextArticleURLs <- function(page, URLcore)
{
  parentArticleHref <- page %>%
    getArticleTitle(page = .) %>%
    determineHrefByTitle(articleTitle = ., URLcore = URLcore)
  
  nextArticleHrefs <- page %>%
    getAllATagsFromArticle(page = .) %>%
    getHrefsFromATags(aTags = .) %>%
    selectHrefsToNextArticles(hrefs = .)
  
  nextArticleURLs <- paste0(URLcore, nextArticleHrefs)
  
  nextArticleURLs <- data.frame(
    PreviousAddress = rep(parentArticleHref, times = length(nextArticleURLs)),
    NextAddress = nextArticleURLs
    )
  
  return(nextArticleURLs)
}
