
checkIfFoundSearchedURL <- function(searchedURL, URLs)
{
  # ifFound <- any(URLs == searchedURL)
  ifFound <- URLs == searchedURL
  return(ifFound)
}