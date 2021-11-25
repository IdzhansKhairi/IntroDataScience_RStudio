## 25 Best Marvel movies of all time


install.packages("dplyr")
library(rvest)
library(dplyr)

link = "https://www.imdb.com/list/ls021386154/"
page = read_html(link)

#Collect the name list from the website 
name = page %>% html_nodes(".lister-item-header a") %>% html_text()

year = page %>% html_nodes(".text-muted.unbold") %>% html_text()

rating = page %>% html_nodes(".ipl-rating-star.small .ipl-rating-star__rating") %>% html_text()

synopsis = page %>% html_nodes(".ratings-metascore+ p") %>% html_text()
synopsis = str_replace_all(synopsis, "[\r\n]", " ")

movies = data.frame(NAME = name, RATING = rating)

write.csv(movies, "movies.csv")
