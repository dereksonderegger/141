# Week 1

## Introduction

### Initial thoughts.

* What is data?
* Why visualize it?
    * See relationships that raw data obscure.
    * Cognative work to translate raw numbers into context between other data points are already done for you.
    * Good graphics translate particular numerical relationships into physical relationships which our brains are really good at processing.
    

### Amazing Graphics

* [UK Drug Poison](https://www.ons.gov.uk/peoplepopulationandcommunity/healthandsocialcare/healthandwellbeing/articles/middleagedgenerationmostlikelytodiebysuicideanddrugpoisoning/2019-08-13) These are the data from the UK related to drug overdose and misuse. Farther down the page gives a similar graph on suicide.


* [Migration Patterns in Europe](https://www.torre.nl/EUmoves/).

### Bad Graphs

* While the New York Times is generally really quite good, this [graph](https://www.nytimes.com/2016/11/29/world/americas/western-liberal-democracy.html?_r=0) is quite misleading. Another view of the data is more fair, although the still 
[depressing.](https://1.bp.blogspot.com/-RQ66mUnaw9Y/XT2gT0j8-tI/AAAAAAAAKoU/G5eOqwdoXS4aW_n0s5-OPWTwes3rdDS6ACLcBGAs/s1600/democracy2.png)

* I feel compelled to show a bad [3-d Excel graphic](https://consultantjournal.com/blog/use-3d-charts-at-your-own-risk) as well.


* Reuter's infamous [gun deaths in Florida](https://callingbullshit.org/tools/img/stand_your_ground.png) chart.

* An amusing case where a pie chart is [ridiculous](https://flowingdata.com/2017/03/09/pie-charts-are-okay/). This is the result of a survey that asks what pizza toppings are liked. In particular, a person can pick more than one topping and so the percentages don't sum to 100%.


### Tableau or ???

* [Tableau](https://www.tableau.com/academic/students#form) is a nice program that reads in data and can produce some very nice graphics and dashboards.  
    * [Licensing Questions?](https://community.tableau.com/docs/DOC-10249) 
    * What are dashboards? A series of related graphs, often with controls that allow you to explore the data.
    * [Britian's Coal Use 2015-2019](https://public.tableau.com/en-us/gallery/britains-coal-free-record)






## EPTs and Gestalt

* Some Visual tasks are easier than others.

![From Alberto Cairo's "The Truthful Art"](./Resources/Alberto Cairo/EPT.png)

From Hadley Wickham's Stat 405 at Rice. (Slides 34 - 40)
[Effective Visualizations](http://stat405.had.co.nz/lectures/20-effective-vis.pdf)



### Groupings / Gestalt

The way we organize our graphics can lead a viewer to create mental groups of marks.

[Winona State's Data Visualization PowerPoint](https://github.com/WSU-DataScience/SDSS19-dataviz-workshop/blob/master/slides/Visualization%20theory%20and%20principles.pptx)

Slides 30-50

* Enclosures
* Connections
* Proximity
* Similarity (color/shape)


Example: Warpbreaks
While spinning wool into thread, if the tension on the wool isn't correctly set, the thread can break. Here we compare two different types of wool at three different tensions.

<img src="01_Week_1_files/figure-html/unnamed-chunk-1-1.png" width="672" /><img src="01_Week_1_files/figure-html/unnamed-chunk-1-2.png" width="672" /><img src="01_Week_1_files/figure-html/unnamed-chunk-1-3.png" width="672" /><img src="01_Week_1_files/figure-html/unnamed-chunk-1-4.png" width="672" /><img src="01_Week_1_files/figure-html/unnamed-chunk-1-5.png" width="672" />


### "Color" Scales

Defining Color really has three different attributes (From [Wikipedia](https://en.wikipedia.org/wiki/HSL_and_HSV)).

#### HSV Scale
* Hue: The attribute of a visual sensation according to which an area appears to be similar to one of the perceived colors: red, yellow, green, and blue, or to a combination of two of them.
* Saturation: The "colorfulness of a stimulus relative to its own brightness"
* Value: The "brightness relative to the brightness of a similarly illuminated white"

![HSV Cylinder from Wikipedia](./Resources/Wikipedia/HSV_color_solid_cylinder_saturation_gray.png)

* Hue is appropriate for categorical variables.
* Saturation and/or Value is approriate for a quantitative variable scale.

Neither R nor Tableau make it particularly easy to map these aspects, so we won't get too deep into it.




## Practicum #1
### How to Store Data

Data is commonly stored in spreadsheets.

* Columns are variables of interest
* Rows are observations.

Example: A dataset we'll call `iris` which has 150 observations of three species of iris. Each observation measured the length and width of both the petals and sepals.


-------------------------------------------------------------------
 Sepal.Length   Sepal.Width   Petal.Length   Petal.Width   Species 
-------------- ------------- -------------- ------------- ---------
     5.1            3.5           1.4            0.2       setosa  

     4.9             3            1.4            0.2       setosa  

     4.7            3.2           1.3            0.2       setosa  

     4.6            3.1           1.5            0.2       setosa  

      5             3.6           1.4            0.2       setosa  

     5.4            3.9           1.7            0.4       setosa  
-------------------------------------------------------------------

Example: A dataset we'll call `GradeBook` that has records of how well a student performed on exams. I'll refer to this storage as the *wide* orientation.

------------------------------------------
 StudentID   Exam 1   Exam 2   Final Exam 
----------- -------- -------- ------------
     1         87       87         81     

     2         91       88         85     

     3         88       79         92     

     4         91       97         94     

     5        100       83         90     

     6         85       79         81     
------------------------------------------
Or I could have stored the information in the following manner, which I'll refer to as the *long* orientation.

--------------------------------
 StudentID   Assesment    Score 
----------- ------------ -------
     1         Exam 1      91   

     1         Exam 2      90   

     1       Final Exam    87   

     2         Exam 1      73   

     2         Exam 2      76   

     2       Final Exam    53   
--------------------------------


### Tableau

#### Task 1: Dragging variables onto destination
First we'll make a scatterplot with some colors.

<img src="01_Week_1_files/figure-html/unnamed-chunk-5-1.png" width="672" />

The iris data I used for this graph is available here:
data: https://raw.githubusercontent.com/dereksonderegger/141/master/data-raw/iris.csv


#### Task 2: Modifying how a variable is displayed
https://raw.githubusercontent.com/dereksonderegger/141/master/data-raw/Lock5_GPAGender.csv


<img src="01_Week_1_files/figure-html/unnamed-chunk-6-1.png" width="672" />


#### Task 3: Reorder categorical variable levels

https://raw.githubusercontent.com/dereksonderegger/141/master/data-raw/warpbreaks.csv

<img src="01_Week_1_files/figure-html/unnamed-chunk-7-1.png" width="672" />


