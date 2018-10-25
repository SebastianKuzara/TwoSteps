
cleanSelectedHrefs <- function(hrefs)
{
  hrefs <- gsub(pattern = "#.*$", replacement = "", x = hrefs)
  hrefs <- hrefs[!duplicated(hrefs)]
  
  return(hrefs)
}