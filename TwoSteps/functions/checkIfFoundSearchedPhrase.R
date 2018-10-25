
checkIfFoundSearchedPhrase <- function(phrase, articleText)
{
  ifFound <- grepl(pattern = phrase, x = articleText, ignore.case = TRUE)
  return(ifFound)
}
