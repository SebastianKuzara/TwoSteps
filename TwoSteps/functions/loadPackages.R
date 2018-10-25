
loadPackages <- function(pckgs)
{
  for(pckg in pckgs)
  {
    if(!require(pckg, character.only = TRUE))
    {
      install.packages(pckg)
    }
    library(pckg, character.only = TRUE)
  }
  return(invisible())
}
