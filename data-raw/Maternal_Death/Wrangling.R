library(tidyverse)

###########################################
##  Deal with the Pregnancy stuff
###########################################
read_tsv('data-raw/Maternal_Death/PregnancyDeaths_by_Race_1999-2017.txt') %>%
  select( -matches('Code') ) %>%
  filter( is.na(Notes) ) %>%
  mutate( Population = as.numeric(Population) ) %>%
  mutate(Rate = Deaths / Population * 100000) %>%
  select( -Notes ) %>%
  write_csv('data-raw/Maternal_Death/PregnancyDeaths_By_Race_by_Time.csv')

read_tsv('data-raw/Maternal_Death/Natality_by_Race_2007-2018.txt') %>%
  select( -matches('Code') ) %>%
  filter( is.na(Notes) ) %>%
  select( -Notes ) %>%
  write_csv( 'data-raw/Maternal_Death/Natality_by_Race_2007-2018.csv')
