
funs <- list.files("./functions/")
for(f in funs)
{
  source(paste0("./functions/", f))
};rm(funs, f)


checkedArticles <- twoSteps()
checkedArticles[checkedArticles$IfFound , "Path"]



checkedArticles <- twoSteps(articlePage = "https://en.wikipedia.org/wiki/Susya,_Har_Hebron")
checkedArticles <- twoSteps(articlePage = "https://en.wikipedia.org/wiki/1936%E2%80%931939_Arab_revolt_in_Palestine")
checkedArticles <- twoSteps(articlePage = "https://en.wikipedia.org/wiki/Adolf_Hitler")
checkedArticles <- twoSteps(articlePage = "https://en.wikipedia.org/wiki/World_War_II")
checkedArticles[checkedArticles$IfFound , "Path"]

