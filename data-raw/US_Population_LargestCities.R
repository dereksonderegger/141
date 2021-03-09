library(tidyverse)
library(rvest)

page <- "https://en.wikipedia.org/wiki/List_of_United_States_cities_by_population" %>%
  read_html()

df <- page %>%
  html_nodes('table') %>%
  .[[5]] %>%
  html_table(fill=TRUE)

df %>%
  select( c(-8, -10) ) %>%   # remove duplicate column names in metric dimensions
  mutate(City= str_remove(City, pattern='\\[\\w\\]')) %>%
  rename(State = `State[c]`) %>%
  select( -Location ) %>%
  write_csv(file='US_Population_LargestCities.csv')
  