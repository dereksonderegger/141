# Tableau Toolbox



Tableau comes with two pieces of software, `Tableau Prep` and `Tableau`. The prep software is intended to support the data tidying, cleaning, and summarization steps. Then we save the result to a file and open the cleaned up data in Tableau to do the visualization. 

This course has access to both Tableau and Tableau Prep through an academic license. 

1. Go to [https://www.tableau.com/products/prep/download](https://www.tableau.com/products/prep/download) to download both products.
2. Select each product download link to get started. When prompted, enter your school email address for Business E-mail and enter the name of your school for Organization.
3. Activate with your product key which will be distributed via email or on Bblearn.

This license will work through the semester. You may continue using Tableau after the class is over by individually requesting their own one-year license through the [Tableau for Students](https://www.tableau.com/academic/students) program.

## Importing data
Often data will be stored in a Comma Separated Values file that has a `.csv` file suffix. These types of files store data tables, and use a comma to separate the columns. Spreadsheet programs will recognize these files and show columns for `Student Name`, `Exam 1`, `Exam 2` and the `Final Exam`. However, if you open these files using a text reader program, they'll look something like this:


```r
Student Name,Exam 1,Exam 2,Final Exam
Alice,87,87,81
Bob,91,88,85
Charlie,88,79,92
```

Below is a video showing how to open up this same data in Tableau Prep.

<iframe width="560" height="315" src="https://www.youtube.com/embed/ruWnLWGcwBI" frameborder="0" allowfullscreen></iframe>

The import step gives a rotated view of the data and generally that doesn't bother me, but for purposes of show what the imported data looks like, we'll add a cleaning step that doesn't do anything but will show the data. In general I won't keep this step in my cleaning workflow, but it is handy to know how to do this.

<iframe width="560" height="315" src="https://www.youtube.com/embed/f6KhNAlBNtU" frameborder="0" allowfullscreen></iframe>


## Tidying or Reshaping
Often source data is stored in a structure that isn't useful for subsequent analysis. When the data isn't a format of one observation per row and one variable per column, we need to fix those issues before proceeding.

### Gather
When data is in the *"wide"* format, we might need to convert it into *"long"* format. For an example, suppose we have a gradebook with a few students.


```
## # A tibble: 3 x 4
##   Name    `Exam 1` `Exam 2` `Final Exam`
##   <chr>      <dbl>    <dbl>        <dbl>
## 1 Alison        87       87           81
## 2 Bob           91       88           85
## 3 Charlie       88       79           92
```

What we want to do is turn this data frame from a *wide* data frame into a *long* data frame. In MS Excel and Tableau, this is called pivoting. Essentially I'd like to create a data frame with three columns: `Name`, `Assessment`, and `Score`. That is to say that each homework datum really has three pieces of information: who it came from, which homework it was, and what the score was. It doesn't conceptually matter if I store it as 3 rows of 4 columns or 12 rows so long as there is a way to identify how a student scored on a particular homework. So we want to reshape the three Exam columns into just two columns (Assessment and Score). 


```
## # A tibble: 9 x 3
##   Name    Assessment Score
##   <chr>   <chr>      <dbl>
## 1 Alison  Exam 1        87
## 2 Bob     Exam 1        91
## 3 Charlie Exam 1        88
## 4 Alison  Exam 2        87
## 5 Bob     Exam 2        88
## 6 Charlie Exam 2        79
## 7 Alison  Final Exam    81
## 8 Bob     Final Exam    85
## 9 Charlie Final Exam    92
```


<iframe width="560" height="315" src="https://www.youtube.com/embed/suCAb8qJOSM" frameborder="0" allowfullscreen></iframe>


### Spread
There are times that we need to convert a *"long"* dataset into *"wide"* format.  This is exactly the reverse function of the gather. Our example will be to undo the gather step from the previous. Again in Tableau, this is called pivoting, but we'll make sure that we are turning rows into columns.

The tricky part is what variable goes into which pivot field.  The top box specifies what the new column headers will be and the bottom box specifies what the cell values will be.

<iframe width="560" height="315" src="https://www.youtube.com/embed/qZ8L3KrAwnE" frameborder="0" allowfullscreen></iframe>


### Column Splitting
Sometimes we have columns where we actually have two pieces of information stored and we have to split the single column into multiple columns. 

For example, we might have data about across the country, where the city name obnoxiously includes the state.  It would be good to split the `Name` column into `City` and `State` columns. For example,


```
## # A tibble: 3 x 2
##   Name          Population
##   <chr>              <dbl>
## 1 Phoenix, AZ      1660272
## 2 Flagstaff, AZ      73964
## 3 Tucson, AZ        545975
```




## Cleaning
### Column Types
    1. Character strings
    2. Numerical
    3. Geographical
    4. Dates
    
### New Column via Calculation


## Use Cases
### Filtering
### Summarization 
### Table Joins
### Table Unions
### Grouped Calculations

