
ifFoundMessage <- function(ifFound)
{
  if(ifFound)
  {
    message("Yeah! The searched article has been found :)")
  }
  else
  {
    message("Unfortunately, the searched article has not been found :(")
  }
  return(invisible())
}