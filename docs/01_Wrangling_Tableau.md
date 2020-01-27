# Data Wrangling 




## Introduction
The process of data wrangling often seems very situation dependent and there isn't a unifying process. However this isn't completely true. The process can be thought of as having four distinct steps.

| **Step**  |   Description                    |
|:---------:|:------------------------------------------------------------------------|
| Import    |  Get the data into software somehow. The structure of the data is just however it came in. |
| Tidy      |  Restructure the data so that each row is an observation, and each column is a variable.|
| Clean     |  Correct variable types, consistent and useful labels, validation and correction.   |
| Use       |  Sub-setting the full data into a smaller set that addresses a particular question. |



In many real world examples, the data wrangling work is concentrated in only one first three steps. Typically you might be able to skip one or more steps, but pedagogically it is helpful to 

### Tidying 

The terminology of "tidy data" popularized by Hadley Wickham and his introduction to the concept lives in a [vignette](https://cran.r-project.org/web/packages/tidyr/vignettes/tidy-data.html) in the R `tidyr` package. I highly recommend reading Hadley Wickhams's introduction as well as what I present here. 

Data is usually described as "tidy" if it satisfies the following:

1. Each row represents an observation.
2. Each column represents a variable.
3. Each table of data represents a different type of observational unit.

The difficult part is recognizing what constitutes an observation and what constitutes a variable. Often I like to think that the observations represent a noun and each now has multiple variables that adjectives that describe the noun. In particular I think that the attributes should be applicable to every single observation. If your data has a large number of `NA` values, that is a symptom of storing the data in a messy (non-tidy) format. 

Suppose I have an address book where I keep email addresses, phone numbers, and other contact information.  However, because different people have several different types of contact information, it would be a bad idea to have one row per person because then we'd need a column for work email, personal email, home phone, work phone, cell phone, twitter handle, reddit user name, etc. Instead, store the information with a single row representing a particular contact.


```
## # A tibble: 5 x 3
##   Person Type       Value                    
##   <chr>  <chr>      <chr>                    
## 1 Derek  Work Email derek.sonderegger@nau.edu
## 2 Derek  Cell Phone 970-867-5309             
## 3 Derek  Twitter    @D_Sonderegger           
## 4 Derek  Github     dereksonderegger         
## 5 Mom    Home Phone 555-867-5309
```

For a more challenging example, suppose we have grade book where we've stored students scores for four different homework assignments.


```
##      name HW.1 HW.2 HW.3 HW.4
## 1  Alison    8    5    8    4
## 2 Brandon    5    3    6    9
## 3 Charles    9    7    9   10
```

In this case we are considering each row to represent a student and each variable represents homework score. An alternative representation would be for each row to represent a single score.


```
##       name Assignment Score
## 1   Alison       HW.1     8
## 2  Brandon       HW.1     5
## 3  Charles       HW.1     9
## 4   Alison       HW.2     5
## 5  Brandon       HW.2     3
## 6  Charles       HW.2     7
## 7   Alison       HW.3     8
## 8  Brandon       HW.3     6
## 9  Charles       HW.3     9
## 10  Alison       HW.4     4
## 11 Brandon       HW.4     9
## 12 Charles       HW.4    10
```

Either representation is fine in this case, because each student should have the same number of assignments. However, if I was combining grade books from multiple times I've taught the course, the first option won't work because sometimes I assign projects and sometimes not. So the tidy version of the data would be to have a table `scores` where each row represents a single assignment from a particular student.

### Cleaning

The cleaning step is usually highly dependent on the data set content. This step involves 

1. Making sure every variable has the right type. For example, make sure that dates are dates, not character strings. 
2. Fix factor labels and sort order.
3. Verify numeric values are reasonable.
4. Create (some) calculated variables

Most of our data frame manipulation tools are designed to work with tidy data. As a result, cleaning is most easily done after the data set structure has been tidied. Therefore,I recommend first performing the reshaping tidying step and *then* perform the cleaning. 

### Use
In this step, we concentrate on the research question of interest. Often this involves calculating summary statistics, calculating selecting only particular rows of data, and finally creating graphs and models.



## Tableau 
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


```r
grade.book <- rbind(
  tibble(Name='Alison', `Exam 1`=87, `Exam 2`=87, `Final Exam`=81),
  tibble(Name='Bob',    `Exam 1`=91, `Exam 2`=88, `Final Exam`=85),
  tibble(Name='Charlie',`Exam 1`=88, `Exam 2`=79, `Final Exam`=92))
grade.book
```

```
## # A tibble: 3 x 4
##   Name    `Exam 1` `Exam 2` `Final Exam`
##   <chr>      <dbl>    <dbl>        <dbl>
## 1 Alison        87       87           81
## 2 Bob           91       88           85
## 3 Charlie       88       79           92
```

What we want to do is turn this data frame from a *wide* data frame into a *long* data frame. In MS Excel and Tableau, this is called pivoting. Essentially I'd like to create a data frame with three columns: `Name`, `Assessment`, and `Score`. That is to say that each homework datum really has three pieces of information: who it came from, which homework it was, and what the score was. It doesn't conceptually matter if I store it as 3 rows of 4 columns or 12 rows so long as there is a way to identify how a student scored on a particular homework. So we want to reshape the three Exam columns into just two columns (Assessment and Score). 


```r
# first we gather the score columns into columns we'll name Homework and Score
tidy.scores <- grade.book %>% 
  gather( key=Assessment,     # What should I call the key column
          value=Score,      # What should I call the values column
          `Exam 1`:`Final Exam`)        # which columns to apply this to
tidy.scores
```

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


```r
cities <- tribble(
    ~Name, ~Population,
    'Phoenix, AZ', 1660272,
    'Flagstaff, AZ', 73964,
    'Tucson, AZ', 545975)
cities
```

```
## # A tibble: 3 x 2
##   Name          Population
##   <chr>              <dbl>
## 1 Phoenix, AZ      1660272
## 2 Flagstaff, AZ      73964
## 3 Tucson, AZ        545975
```

```r
write_csv(cities, 'data-raw/cities.csv')
```


<iframe width="560" height="315" src="https://www.youtube.com/embed/hrr_xYy8v-U" frameborder="0" allowfullscreen></iframe>


### New Column via Calculation

Often we need to take a column and create some sort of calculation. For example, if we are given some information (say student height) in inches, we might want to calculate their height in centimeters by multiplying each height value by $2.54$ and naming the result `Height (cm)`.


```r
data <- tribble(
  ~Grade, ~Gender, ~Height,
  '1st Grade', 'Male',   44,
  '1st Grade', 'Male',   42,
  '1st Grade', 'Female', 42,
  '1st Grade', 'Female', 40,
  '12th Grade', 'Male',   70,
  '12th Grade', 'Male',   68,
  '12th Grade', 'Male',   69,
  '12th Grade', 'Female', 64,
  '12th Grade', 'Female', 65)
data %>% mutate(`Height (cm)` = Height *2.54)
```

```
## # A tibble: 9 x 4
##   Grade      Gender Height `Height (cm)`
##   <chr>      <chr>   <dbl>         <dbl>
## 1 1st Grade  Male       44          112.
## 2 1st Grade  Male       42          107.
## 3 1st Grade  Female     42          107.
## 4 1st Grade  Female     40          102.
## 5 12th Grade Male       70          178.
## 6 12th Grade Male       68          173.
## 7 12th Grade Male       69          175.
## 8 12th Grade Female     64          163.
## 9 12th Grade Female     65          165.
```

```r
write_csv(data, 'data-raw/Group_Summarization.csv')
```

The issue in Tableau is to make sure you remember how to specify a column in a formula.  The syntax is `[column_name]` and then you can use that quantity in whatever formula you want.

<iframe width="560" height="315" src="https://www.youtube.com/embed/8YvXg1HEqdc" frameborder="0" allowfullscreen></iframe>

### Aggregation

Given a data set we also want to be able to calculate summary for various columns. For example, we might want to calculate the mean height for each grade level, or perhaps each gender within each grade level. Notice that we end up with a data set with *fewer rows*.


```r
data %>%
  group_by(Grade, Gender) %>%
  summarize(`Avg Height` = mean(Height))
```

```
## # A tibble: 4 x 3
## # Groups:   Grade [2]
##   Grade      Gender `Avg Height`
##   <chr>      <chr>         <dbl>
## 1 12th Grade Female         64.5
## 2 12th Grade Male           69  
## 3 1st Grade  Female         41  
## 4 1st Grade  Male           43
```

<iframe width="560" height="315" src="https://www.youtube.com/embed/nMSppaAHTSM" frameborder="0" allowfullscreen></iframe>


### New Column with Aggregation
There are many cases where we need to create a calculated column, but the calculation involves 
some aggregated information. For, if have the number of males and females in each grade and we want to calculate the percentage of males and females in each grade.  To do this we need to aggregate data to count the number of students in each grade and then divide the number of males or females in each grade by the total number of students in the grade.


```r
data %>%
  group_by(Grade, Gender) %>%
  count(name = 'Grade_Gender_n')
```

```
## # A tibble: 4 x 3
## # Groups:   Grade, Gender [4]
##   Grade      Gender Grade_Gender_n
##   <chr>      <chr>           <int>
## 1 12th Grade Female              2
## 2 12th Grade Male                3
## 3 1st Grade  Female              2
## 4 1st Grade  Male                2
```


```r
data %>%
  group_by(Grade, Gender) %>%
  count(name = 'Grade_Gender_n') %>%
  group_by(Grade) %>%
  mutate(Grade_n = sum(Grade_Gender_n)) %>%
  mutate(Proportion = Grade_Gender_n / Grade_n )
```

```
## # A tibble: 4 x 5
## # Groups:   Grade [2]
##   Grade      Gender Grade_Gender_n Grade_n Proportion
##   <chr>      <chr>           <int>   <int>      <dbl>
## 1 12th Grade Female              2       5        0.4
## 2 12th Grade Male                3       5        0.6
## 3 1st Grade  Female              2       4        0.5
## 4 1st Grade  Male                2       4        0.5
```

Anytime you need to include an aggregation value in formula, we need to specify any grouping information for calculating the aggregate. The code for this is to specify the grouping variable and the aggregation function and column. The code is: `{FIXED [Group]: SUM[Value]}`

<iframe width="560" height="315" src="https://www.youtube.com/embed/2USmtAcluEY" frameborder="0" allowfullscreen></iframe>

### Unions
One way that we could "squish" two data sets together is if they have the same columns and we essentially just want to add new rows to a data set. 

In this example we have two tables with identical column types and we just want to stack the two tables to create a single table that contains all the rows of data.



```r
People <-tribble(
    ~PersonID, ~First.Name, ~Last.Name, ~Birthday,
    'P0001', 'Derek', 'Sonderegger', '01/10/1976',
    'P0002', 'Aubrey','Sonderegger', '02/14/1980',
    'P0004', 'Casey', 'Sonderegger', '02/14/2015')
Contacts <- tribble(
    ~PersonID, ~Type, ~Handle,
    'P0001', 'email','derek.sonderegger@nau.edu',
    'P0001', 'Twitter','@D_Sonderegger',
    'P0002', 'email', 'aubrey.sonderegger@yahoo.com')
New_Contacts <- tribble(
  ~PersonID, ~Type, ~Handle,
  'P0003', 'email', 'Elise.Sonderegger@gmail.com',
  'P0003', 'Twitter','@UnicornsRule')

Contacts
```

```
## # A tibble: 3 x 3
##   PersonID Type    Handle                      
##   <chr>    <chr>   <chr>                       
## 1 P0001    email   derek.sonderegger@nau.edu   
## 2 P0001    Twitter @D_Sonderegger              
## 3 P0002    email   aubrey.sonderegger@yahoo.com
```

```r
New_Contacts
```

```
## # A tibble: 2 x 3
##   PersonID Type    Handle                     
##   <chr>    <chr>   <chr>                      
## 1 P0003    email   Elise.Sonderegger@gmail.com
## 2 P0003    Twitter @UnicornsRule
```

```r
write_csv(People,   path = './data-raw/Joins_People.csv')
write_csv(Contacts, path = './data-raw/Joins_Contacts.csv')
write_csv(New_Contacts, path = './data-raw/Joins_NewContacts.csv')
```


```r
bind_rows( Contacts, New_Contacts )
```

```
## # A tibble: 5 x 3
##   PersonID Type    Handle                      
##   <chr>    <chr>   <chr>                       
## 1 P0001    email   derek.sonderegger@nau.edu   
## 2 P0001    Twitter @D_Sonderegger              
## 3 P0002    email   aubrey.sonderegger@yahoo.com
## 4 P0003    email   Elise.Sonderegger@gmail.com 
## 5 P0003    Twitter @UnicornsRule
```


<iframe width="560" height="315" src="https://www.youtube.com/embed/UqwX79lHk-Y" frameborder="0" allowfullscreen></iframe>



### Joins
There are many cases where we have two or more data sets that are related and we need to squish them together to make a table with more columns. For example we might have a data set `People` that contains a unique numeric code for each person, first and last names, and birth dates. We might also have a data set of `Contacts` which has the person's unique numeric code and the contact type and value.



```r
People 
```

```
## # A tibble: 3 x 4
##   PersonID First.Name Last.Name   Birthday  
##   <chr>    <chr>      <chr>       <chr>     
## 1 P0001    Derek      Sonderegger 01/10/1976
## 2 P0002    Aubrey     Sonderegger 02/14/1980
## 3 P0004    Casey      Sonderegger 02/14/2015
```

```r
Contacts
```

```
## # A tibble: 3 x 3
##   PersonID Type    Handle                      
##   <chr>    <chr>   <chr>                       
## 1 P0001    email   derek.sonderegger@nau.edu   
## 2 P0001    Twitter @D_Sonderegger              
## 3 P0002    email   aubrey.sonderegger@yahoo.com
```

The `PersonID` column links the two tables. But when we now have to ask what we should do about Casey.  There are really two options:

| Join Type  | Description  |
|:-----------|:--------------------------------|
| Inner Join | Only include rows for individuals that have information in both tables. |
| Full  Join | Include a row for for every row in either of the tables being joined. In this case, it results in a row Casey being included, but the contact information being left empty. |


```r
# Inner Joining
inner_join(People, Contacts)
```

```
## # A tibble: 3 x 6
##   PersonID First.Name Last.Name   Birthday   Type   Handle                 
##   <chr>    <chr>      <chr>       <chr>      <chr>  <chr>                  
## 1 P0001    Derek      Sonderegger 01/10/1976 email  derek.sonderegger@nau.…
## 2 P0001    Derek      Sonderegger 01/10/1976 Twitt… @D_Sonderegger         
## 3 P0002    Aubrey     Sonderegger 02/14/1980 email  aubrey.sonderegger@yah…
```

```r
# Full Join
full_join(People, Contacts)
```

```
## # A tibble: 4 x 6
##   PersonID First.Name Last.Name   Birthday   Type   Handle                 
##   <chr>    <chr>      <chr>       <chr>      <chr>  <chr>                  
## 1 P0001    Derek      Sonderegger 01/10/1976 email  derek.sonderegger@nau.…
## 2 P0001    Derek      Sonderegger 01/10/1976 Twitt… @D_Sonderegger         
## 3 P0002    Aubrey     Sonderegger 02/14/1980 email  aubrey.sonderegger@yah…
## 4 P0004    Casey      Sonderegger 02/14/2015 <NA>   <NA>
```

<iframe width="560" height="315" src="https://www.youtube.com/embed/tEQQbN_-ZyY" frameborder="0" allowfullscreen></iframe>


## Exercises

1. We are given information about the maximum daily temperature from a weather station in Flagstaff, AZ. The file is available at the GitHub site that this book is hosted on. You can find it [https://github.com/dereksonderegger/141/raw/master/data-raw/FlagMaxTemp.csv](https://github.com/dereksonderegger/570L/raw/master/data-raw/FlagMaxTemp.csv). This file is in a wide format, where each row represents a month and the columns 1, 2, ..., 31 represent the day of the month the observation was made. 
    a. Convert data set to the long format where the data has only four columns: `Year`, `Month`, `Day`, `Tmax`.
    b. Calculate the average monthly maximum temperature for each Month in the dataset (So there will be 365 mean maximum temperatures). There are several days that have missing data, represented by the value `NA`. If you have a problem taking the mean with them in there, you likely haven't converted the temperature from a character string to a numeric value.
    c. Convert the average month maximums back to a wide data format where each line represents a year and there are 12 columns of temperature data (one for each month) along with a column for the year. *There will be a couple of months that still have missing data because the weather station was out of commission for those months and there was NO data for the entire month.*
    d. Save this table as a .csv file.
 

2. A common task is to take a set of data that has multiple categorical variables and create a table of the number of cases for each combination. An introductory statistics textbook contains a dataset summarizing student surveys from several sections of an intro class. The two variables of interest for us are `Gender` and `Year` which are the students gender and year in college.
    a. Download the dataset as a `.csv` file from the following website: http://www.lock5stat.com/datasets/StudentSurvey.csv
    b. Notice that there are two survey responses that did not give their year in school. Perform a filter step to remove any row with the value of `null` in the `Year` column.
    c. Produce a data set with eight rows that contains the number of responses for each gender:year combination. 
    d. Using a `pivot` command, produce a table of the number of responses in the following form:
    
        |   Gender    |  First Year  |  Sophmore  |  Junior   |  Senior   |
        |:-----------:|:------------:|:----------:|:---------:|:---------:|
        |  **Female** |              |            |           |           |  
        |  **Male**   |              |            |           |           | 

    e. Save this table as a .csv file.
    
3. Read Chapter 2 in *The Functional Art*.
    a. On page 46, figure 2.2 asks you to list aspects of the figure that "seem fishy". Before reading the rest of the chapter, list the things that seem fishy. After you've read the rest of the chapter, go back and examine the graph and reflect on why you didn't notice certain deceptive issues on the first reading of the graph.
    b. On page 55, figure 2.11 asks which chart is more aesthetically pleasing?  Which do you think is more attractive and why?
