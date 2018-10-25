

twoSteps <- function(searchedURL = "default", articlePage = "random")
{
  options(stringsAsFactors = FALSE)
  loadPackages(pckgs = c("rvest", "dplyr"))
  
  wikiCoreURL <- "https://en.wikipedia.org"
  message("-- Step 0 ---------------------------------------")
  
  if(searchedURL == "default")
  {
    searchedURL <- declareSearchedURL()
  }
  
  if(articlePage == "random")
  {
    articlePage <- goToRandomArticle()  
  }
  else
  {
    articlePage <- goToArticle(articlePage)
  }
  
  pathToSuccess <- readFirstArticle(searchedURL = searchedURL, articlePage = articlePage, URLcore = wikiCoreURL)
  ifFound <- pathToSuccess$IfFound
  
  if(!ifFound)
  {
    message(paste("-- Step 1 - to read", nrow(pathToSuccess) , "articles ---------------------"))
    nextArticles <- getNextArticleURLs(page = articlePage, URLcore = wikiCoreURL)  
    pathToSuccess <- joinURLsBetweenSteps(perviousArticlesTable = pathToSuccess, nextArticlesTable = nextArticles, searchedURL = searchedURL)
    ifFound <- any( pathToSuccess$IfFound )
    
    if(!ifFound)
    {
      noOfArticlesToRead <<- nrow(pathToSuccess)
      message(paste("-- Step 2 - to read", noOfArticlesToRead , "articles ---------------------"))
      pathToSuccess_list <- split(x = pathToSuccess, f = pathToSuccess$NextAddress)
      assign("ifFoundSearchedArticleGlobal", FALSE, envir = globalenv())
      readArticleNr <<- 1
      pathToSuccess_list <- lapply(pathToSuccess_list, getAndMergeNextArticleURLs, tableWithNextURLs = nextArticles, URLcore = wikiCoreURL, searchedURL = searchedURL)
      pathToSuccess <- do.call("rbind", pathToSuccess_list)
      pathToSuccess <- pathToSuccess[!duplicated(pathToSuccess) , ]
      rownames(pathToSuccess) <- 1:nrow(pathToSuccess)
      ifFound <- sum(pathToSuccess$IfFound) > 0
      if(!ifFound)
      {
        noOfArticlesToRead <<- nrow(pathToSuccess)
        message(paste("-- Step 3 - to read", noOfArticlesToRead , "articles ---------------------"))
        pathToSuccess_list <- split(x = pathToSuccess, f = pathToSuccess$NextAddress)
        assign("ifFoundSearchedArticleGlobal", FALSE, envir = globalenv())
        readArticleNr <<- 1
        pathToSuccess_list <- lapply(pathToSuccess_list, getAndMergeNextArticleURLs, tableWithNextURLs = nextArticles, URLcore = wikiCoreURL, searchedURL = searchedURL)
        pathToSuccess <- do.call("rbind", pathToSuccess_list)
        pathToSuccess <- pathToSuccess[!duplicated(pathToSuccess) , ]
        rownames(pathToSuccess) <- 1:nrow(pathToSuccess)
        ifFound <- sum(pathToSuccess$IfFound) > 0
      }
    }
    
  }
  ifFoundMessage(ifFound = ifFound)
  pathToSuccess$IfFound <- checkIfFoundSearchedURL(searchedURL = searchedURL, URLs = pathToSuccess$NextAddress)
  
  return(pathToSuccess)
}

