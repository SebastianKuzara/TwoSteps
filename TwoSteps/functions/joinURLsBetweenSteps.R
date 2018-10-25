

joinURLsBetweenSteps <- function(perviousArticlesTable, nextArticlesTable, searchedURL)
{
  perviousArticlesTable$NextAddress <- NULL
  perviousArticlesTable <- inner_join(nextArticlesTable, perviousArticlesTable, by = c("PreviousAddress" = "CurrentAddress"))
  perviousArticlesTable$PreviousAddress <- NULL
  perviousArticlesTable$Path <- paste(perviousArticlesTable$Path, perviousArticlesTable$NextAddress, sep = " | ")
  perviousArticlesTable <- perviousArticlesTable[!duplicated(perviousArticlesTable),]
  perviousArticlesTable$IfFound <- checkIfFoundSearchedURL(searchedURL = searchedURL, URLs = perviousArticlesTable$NextAddress)
  return(perviousArticlesTable)
}