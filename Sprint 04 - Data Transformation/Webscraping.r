install.packages("rvest")
install.packages("tidyverse")

library(rvest)
library(tidyverse)

# HW1 - IMDB

url <- "https://www.imdb.com/search/title/?groups=top_100&sort=user_rating,%20desc"
header <- url %>%
read_html() %>%
html_elements("h3.lister-item-header") %>%
html_text2


ratings <- url %>%
read_html() %>%
html_elements("div.ratings-imdb-rating") %>%
html_text2 %>%
as.numeric()


metascore <- url %>%
read_html() %>%
html_elements("div.ratings-metascore") %>%
html_text2


df <- data.frame(header,ratings,metascore)
View(df)

# HW2 - Any Static Websites

url <- "https://notebookspec.com/notebook/search?type[0]=%E0%B9%82%E0%B8%99%E0%B9%8A%E0%B8%95%E0%B8%9A%E0%B8%B8%E0%B9%8A%E0%B8%84%E0%B9%83%E0%B8%8A%E0%B9%89%E0%B8%87%E0%B8%B2%E0%B8%99%E0%B8%97%E0%B8%B1%E0%B9%88%E0%B8%A7%E0%B9%84%E0%B8%9B"

title <- url %>%
read_html() %>%
html_elements("div.title") %>%
html_text2()

details <- url %>%
read_html() %>%
html_elements("ul.info-list") %>%
html_text2()

price <- url %>%
read_html() %>%
html_elements("div.price") %>%
html_text2()

df <- data.frame(title,price)
View(df)
