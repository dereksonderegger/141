# Making datasets from R for Tableau
# by saving them as .csv files

library(tidyverse)
library(lubridate)

write_csv(iris, 'data-raw/iris.csv')
write_csv(warpbreaks, 'data-raw/warpbreaks.csv')
write_csv( Lock5Data::GPAGender, 'Lock5_GPAGender.csv' )

#############################################
## Gradebook Example
#############################################
GradeBook <- read_csv( file='~/Dropbox/NAU/Teaching/STA 570/2012_Fall/grades3.csv' ) %>%
  select( -'Last Name', -`First Name`, -Username, -`Student ID`, -X18, -X19 ) %>%
  select( `Exam 1`, `Exam 2`, `Final Exam` ) %>%
  drop_na() %>%
  mutate( StudentID = sample(1:n()) ) %>%
  select( StudentID, `Exam 1`, `Exam 2`, `Final Exam` ) %>%
  arrange( StudentID ) 
write_csv(GradeBook, 'data-raw/GradeBook.csv')

GradeBook2 <- GradeBook %>%
  gather('Assesment', 'Score', `Exam 1`:`Final Exam`) %>%
  arrange(StudentID)
write_csv(GradeBook2, 'data-raw/GradeBook2.csv')


#############################################
## Democratic candidates Ages.
#############################################
Prez_Candidate_Birthdays <- tribble(
  ~Candidate,         ~Gender, ~Birthday,   ~Party,
  'Pete Buttigieg',   'M',  'Jan 19, 1982',  'D',
  "Andrew Yang",      'M',  'Jan 13, 1975',  'D',
  "Juilan Castro",    'M',  'Sept 16, 1976', 'D',
  "Beto O'Rourke",    'M',  'Sept 26, 1972', 'D',
  "Cory Booker",      'M',  'Apr 27, 1969',  'D',
  "Kamala Harris",    'F',  "Oct 20, 1964",  'D',
  "Amy Klobucher",    'F',  "May 25, 1960",  'D',
  "Elizabeth Warren", 'F',  "Jun 22, 1949",  'D',
  "Donald Trump",     'M',  "June 14, 1946", 'R',
  "Joe Biden",        'M',  "Nov 20, 1942",  'D',
  "Bernie Sanders",   'M',  "Sept 8, 1941",  'D') %>%
  mutate( Birthday = mdy(Birthday) ) %>%
  mutate( AgeOnElection = as.duration(interval(Birthday,mdy('Nov 3, 2020'))),
          AgeOnElection = AgeOnElection %/% as.duration(years(1)) ) 
write_csv(Prez_Candidate_Birthdays, 'data-raw/Prez_Candidate_Birthdays')



##########################
## CO2 levels
##########################
CO2 <- read_table( 
  "ftp://aftp.cmdl.noaa.gov/products/trends/co2/co2_mm_mlo.txt", 
  col_names = c('Year', 'Month', 'Time', 'CO2','Fit','Seasonal','num_records'),
  skip = 72)
CO2 <- CO2 %>% filter(CO2 > 0) %>%
  mutate(Date = str_c(Year, '-', Month, '-1'),
         Date = lubridate::ymd(Date)) %>%
  rename(Date2 = Time) %>%
  select(Date, Date2, Year, Month, CO2)
write_csv(CO2, 'data-raw/CO2.csv')



##################################################
## Faculty breakdown in Math/Stat department
#################################################
MathStat_Faculty_Composition <- tribble(
  ~Type,  ~Number,
  'Instructor',  8,
  'Lecturer',  8,
  'Senior Lecturer', 4,
  'Principle Lecturer', 4,
  'Assistant Professor', 3,
  'Associate Professor', 8,
  'Full Professor', 8)
write_csv(MathStat_Faculty_Composition, 
          'data-raw/MathStat_Faculty_Composition.csv')



##################################################
## Titanic Data Set
#################################################
data('Titanic')
Titanic <- 
  data.frame(Titanic) %>%
  filter(Freq != 0) %>%
  group_by(Class, Sex, Age, Survived) %>%
  do({ data.frame( Class = .$Class, Sex = .$Sex, Age=.$Age, Survived=.$Survived, rep=1:.$Freq) }) %>%
  ungroup() %>% mutate( PersonID = 1:n() ) %>%
  select(-rep)

write_csv(Titanic, 'data-raw/Titanic.csv')



##################################################
## Small Diamonds Dataset
#################################################
data('diamonds', package='ggplot2')
set.seed( 654989 )
Small_Diamonds <- diamonds %>%
  group_by(clarity, cut, color) %>%
  sample_frac( .05 ) 
write_csv(Small_Diamonds, 'data-raw/Small_Diamonds.csv')

# ggplot(Small_Diamonds, aes(x=carat, y=price)) +
#   geom_point() +
#   facet_wrap( cut ~ clarity )



##################################################
## Data From GapMinder
#################################################
basic_sanitation <- 
  readr::read_csv('data-raw/Gapminder_data/at_least_basic_sanitation_overall_access_percent.csv') %>%
  tidyr::gather('year', 'Basic_Sanitation_percent', -country)
gdp_total <- 
  readr::read_csv('data-raw/Gapminder_data/total_gdp_us_inflation_adjusted.csv') %>%
  tidyr::gather('year', 'GDP', -country)
gdp_per_capita <- 
  readr::read_csv('data-raw/Gapminder_data/gnipercapita_atlasmethod_current_us.csv') %>%
  tidyr::gather('year', 'GDP_per_capita', -country)
life_expectancy <-
  readr::read_csv('data-raw/Gapminder_data/life_expectancy_years.csv') %>%
  tidyr::gather('year', 'life_expectancy', -country)
adult_male_labor_participation <-
  readr::read_csv('data-raw/Gapminder_data/males_aged_15_64_labour_force_participation_rate_percent.csv') %>%
  tidyr::gather('year', 'adult_male_labor_participation', -country)
adult_female_labor_participation <-
  readr::read_csv('data-raw/Gapminder_data/females_aged_25_54_labour_force_participation_rate_percent.csv') %>%
  tidyr::gather('year', 'adult_female_labor_participation', -country)
population_size <- 
  readr::read_csv('data-raw/Gapminder_data/population_total.csv') %>%
  tidyr::gather('year', 'population', -country)
population_growth <- 
  readr::read_csv('data-raw/Gapminder_data/population_growth_annual_percent.csv') %>%
  tidyr::gather('year', 'population_growth', -country)
fertility <- 
  readr::read_csv('data-raw/Gapminder_data/children_per_woman_total_fertility.csv') %>%
  tidyr::gather('year', 'fertility', -country)
# countries <- gapminder::gapminder_unfiltered %>%
#   select(country, continent) %>% group_by(country, continent) %>% distinct()
countries <- readxl::read_excel('data-raw/Gapminder_data/Data Geographies - v1 - by Gapminder.xlsx', sheet=2) %>%
  rename(country = name, region4 = four_regions, region6=six_regions, region8=eight_regions) %>%
  select(country, region4, region6, region8, Latitude, Longitude)
  

my_by = c('country', 'year')
Gapminder <- countries %>%
  full_join(population_size, by='country') %>%
  full_join(population_growth, by=my_by) %>%
  full_join(fertility, by=my_by) %>%
  full_join(basic_sanitation, gdp_total, by=my_by) %>%
  full_join(gdp_per_capita, by=my_by) %>%
  full_join(gdp_total, by=my_by) %>%
  full_join(life_expectancy, by=my_by) %>%
  full_join(adult_male_labor_participation, by=my_by) %>%
  full_join(adult_female_labor_participation, by=my_by) 
Gapminder <- Gapminder %>%
  filter(year <= 2019)
write_csv(Gapminder, 'data-raw/Gapminder.csv')
