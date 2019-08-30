# Practicum 1

## How to Store Data

Data is commonly stored in spreadsheets.
* Columns are variables of interest
* Rows are observations.

Example: A data set we'll call `iris` which has 150 observations of three species of iris. Each observation measured the length and width of both the petals and sepals.


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


## Tableau

By dragging variables onto destination
* Scatterplot of the Iris Data
    * Making Species Colors 
    * Making Facets

Modifying how a variable is displayed
* GPAGender
    * Make a Barchart with Gender and # Piercings
    * Turn # of Piercings into a discrete value.
    * Fix Gender Levels.  IFF( [GenderCode] = 1, 'Male', 'Female' )
    * Change the colors associated with each gender.

Reorder categorical variables levels
* Warpbreaks
    * Do breaks vs Wooltype and Tension
    * Reorder the Tension levels to make senese.
