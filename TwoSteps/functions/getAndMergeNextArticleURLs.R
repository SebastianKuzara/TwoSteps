
getAndMergeNextArticleURLs <- function(tableForSingleArticle, tableWithNextURLs, URLcore, searchedURL)
{
  options(stringsAsFactors = FALSE)
  nextArticles <- data.frame(
    PreviousAddress = character(0),
    NextAddress = character(0)
  )
  
  rowNr <- 1
  
  while(rowNr <= nrow(tableForSingleArticle) & !get(x = "ifFoundSearchedArticleGlobal", envir = globalenv()))
  {
    url <- tableForSingleArticle[rowNr, "NextAddress"]
    
    err <- TRUE ## fake assumption
    while(err)
    {
      tryCatch(expr = {
        articlePage <- goToArticle(URL = url)
        err <- FALSE
      }, error = function(e)
      {
        cat(paste("Try to read again ", url, "address.\n"))
        Sys.sleep(5)
      })
    }
    readArticleNr <<- readArticleNr + 1
    nextArticlesForGivenURL <- getNextArticleURLs(page = articlePage, URLcore = URLcore) 
    
    ifFoundSearchedArticle <- any(checkIfFoundSearchedURL(searchedURL = searchedURL, URLs = nextArticlesForGivenURL$NextAddress))
    assign("ifFoundSearchedArticleGlobal", ifFoundSearchedArticle, envir = globalenv())
    tableForSingleArticle[rowNr, "IfFound"] <- ifFoundSearchedArticle
    nextArticles <- rbind(nextArticles, nextArticlesForGivenURL)
    rowNr <- rowNr + 1
    
  }
  
  tableForSingleArticle$PreviousAddress <- NULL
  # tableForSingleArticle <- inner_join(nextArticles, tableForSingleArticle, by = c("PreviousAddress" = "NextAddress"))
  #########################
  tableForSingleArticle$NextAddress <- NULL
  tableForSingleArticle <- merge(nextArticles, tableForSingleArticle)
  #########################
  tableForSingleArticle$Path <- paste(tableForSingleArticle$Path, tableForSingleArticle$NextAddress, sep = " | ")
  tableForSingleArticle <- tableForSingleArticle[!duplicated(tableForSingleArticle),]
  
  return(tableForSingleArticle)
  
}