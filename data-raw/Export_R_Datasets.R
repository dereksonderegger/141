# Making datasets from R for Tableau
# by saving them as .csv files

library(tidyverse)
library(lubridate)

write_csv(iris, 'data-raw/iris.csv')
write_csv(warpbreaks, 'data-raw/warpbreaks.csv')
write_csv( Lock5Data::GPAGender, 'Lock5_GPAGender.csv' )


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



