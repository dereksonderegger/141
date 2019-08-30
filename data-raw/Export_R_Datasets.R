# Making datasets from R for Tableau
# by saving them as .csv files

setwd( '~GitHub/141/data-raw')

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

