
selectHrefsToNextArticles <- function(hrefs)
{
  ifArticle <- checkIfHrefsToArticle(hrefs = hrefs)
  selectedHrefs <- hrefs[ifArticle]
  selectedHrefs <- cleanSelectedHrefs(hrefs = selectedHrefs)
  
  return(selectedHrefs)
}