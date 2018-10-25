

determineHrefByTitle <- function(articleTitle, URLcore)
{
  
  articleTitle <- gsub(pattern = " - Wikipedia", replacement = "", x = articleTitle)
  suffix <- gsub(pattern = " ", replacement = "_", x = articleTitle)  
  href <- paste0(URLcore, "/wiki/", suffix)
  return(href)
  
}

