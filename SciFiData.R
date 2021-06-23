library(tidyverse)
library(rvest)
library(httr)
library(stringr)
library(readr)

moviedata <- read_csv(file = "IMDB Movies.csv")

clean_movie_data <- moviedata %>% 
  select(title, year, genre, country, description, ) %>% 
  filter(country == "USA") %>% 
  filter(str_detect(genre, "Sci-Fi")) %>% 
  arrange(year) %>% 
  drop_na(year) %>% 
  mutate(year = as.character(year)) %>% 
  group_by(year) %>% 
  mutate(num_scifi = n()) %>% 
  ggplot(mapping = aes(x = year,
                       y = num_scifi))+
  geom_col()

