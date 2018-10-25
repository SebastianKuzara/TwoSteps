
checkIfHrefsToArticle <- function(hrefs)
{
  ifHrefToArticle <- 
    (
      grepl(pattern = "^/wiki/(?!.*:.*).*", x = hrefs, perl = TRUE) # |
        # grepl(pattern = "^/wiki/Category:", x = hrefs)
    ) &
    !grepl(pattern = "Main_Page", x = hrefs)
  return(ifHrefToArticle)
}