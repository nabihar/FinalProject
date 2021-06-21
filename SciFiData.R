library(tidyverse)
library(rvest)
library(httr)
library(stringr)
library(readr)

moviedata <- read_csv(file = "IMDB Movies.csv")

moviedata %>% 
  select(title, year, genre, country, description) %>% 
  filter(country == "USA") %>% 
  mutate(scifi = str_(genre =="Sci-Fi"))