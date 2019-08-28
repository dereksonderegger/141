# Making datasets from R for Tableau
# by saving them as .csv files

setwd( '~GitHub/141/data-raw')

write_csv(iris, 'data-raw/iris.csv')
write_csv(warpbreaks, 'data-raw/warpbreaks.csv')
write_csv( Lock5Data::GPAGender, 'Lock5_GPAGender.csv' )
