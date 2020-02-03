# Amounts & Proportions




## Introduction
This chapter focuses on displaying a single numerical variable versus one or more categorical variables. To display the quantitative variable, we'll try to stay at the top of the EPT tasks and the quantitative variable will be quantified with either the `x` or `y` axis or using length. The exception to this is the heatmap, where the quantitative variable is encoded by the color of the tile.

<img src="03_Amounts_files/figure-html/unnamed-chunk-2-1.png" width="672" />

## Example 1
The 2020 presidential candidate field has a wide range of ages. 
The 
[New York Times](https://www.nytimes.com/interactive/2019/06/09/us/politics/2020-democractic-candidates-ages.html)
has a nice article showing the candidate ages. I grabbed a few of the most prominent candidates and pulled their birthdays from Wikipedia and then calculated their age on election day. As usual the data is [available](https://raw.githubusercontent.com/dereksonderegger/141/master/data-raw/Prez_Candidate_Birthdays) on the Github pages for this book. 

<img src="03_Amounts_files/figure-html/unnamed-chunk-3-1.png" width="672" />

The order of the candidates is useless. Here we have ordered them alphabetically when we should try to think about an ordering that improves clarity. Lets switch to sorting the candidates by age.

<img src="03_Amounts_files/figure-html/unnamed-chunk-4-1.png" width="672" />

This isn't too bad, but it fails to visually impress the differences. A bar chart should visually impress the ages based on the length of the bar so that we don't have to keep looking at the Age axis.

<img src="03_Amounts_files/figure-html/unnamed-chunk-5-1.png" width="672" />

What would be *dishonest* is if we were to chop off the bars at 35 or 40 to make the age difference between Buttigieg and Warren, Trump, Biden and Sanders seem huge.

<img src="03_Amounts_files/figure-html/unnamed-chunk-6-1.png" width="672" />


## Example 2

In this section we'll consider two categories. We have the results from a survey administered to students in an introductory statistics class at a New York university. We'll compare the number of student responses broken down by year in school and gender.

<img src="03_Amounts_files/figure-html/unnamed-chunk-7-1.png" width="672" />

The first thing I notice is that there is approximate gender equality, but there are a few more males in class. After a more detailed look, I see that the most abundant class is sophomores, followed by first years, and juniors and seniors are approximately equally abundant. If we switch the grouping order and use color to denote gender and columns to denote the classes, the abundance of sophomores is the first insight to be noticed.

<img src="03_Amounts_files/figure-html/unnamed-chunk-8-1.png" width="672" />

## Tableau Toolbox
<iframe width="560" height="315" src="https://www.youtube.com/embed/KOAgy0oIY14" frameborder="0" allowfullscreen></iframe>

<iframe width="560" height="315" src="https://www.youtube.com/embed/Fd8Y1MoKvqc" frameborder="0" allowfullscreen></iframe>

<iframe width="560" height="315" src="https://www.youtube.com/embed/AaP8n9TdLyI" frameborder="0" allowfullscreen></iframe>

<iframe width="560" height="315" src="https://www.youtube.com/embed/Tke-hgmfMNs" frameborder="0" allowfullscreen></iframe>


## Example 3

Often we need to graph some value and want to know how it varies among *two* different categories. In these cases, we have to employ some sort of grouping strategy.

<img src="03_Amounts_files/figure-html/unnamed-chunk-9-1.png" width="672" />

The bar chart here is obscuring the differences in life expectancies because the numbers are so close. In this case, I think points make more sense. Also I want to see how life expectancy has changed since World War II.


<img src="03_Amounts_files/figure-html/unnamed-chunk-10-1.png" width="672" />

In the above graph, I am grouping countries both by enclosure and with a physical path connection. The reader tends to see the line as a whole object and compare the line max/min and slope among the seven countries. 

We might consider changing the faceting to stack the countries, but this makes it much harder to compare countries to see which has a higher life expectancy.
<img src="03_Amounts_files/figure-html/unnamed-chunk-11-1.png" width="672" />

We could have also used color to indicate which country is which, but this produces a bit of a *spaghetti plot* and is difficult to interpret. However, it is easier to identify when Japan's life expectancy surpaced the rest of the G7 countries.
<img src="03_Amounts_files/figure-html/unnamed-chunk-12-1.png" width="672" />


A heat map makes it easier to see which country has the highest life expectancy, but we lose precision in the actual values.
<img src="03_Amounts_files/figure-html/unnamed-chunk-13-1.png" width="672" />




## Proportions

Conceptually graphing proportions is the same as graph raw values, but sum to 100%. This seemingly small difference means that our graphic can imply that our categories contain ALL possible categories. 

## Single Set 
### Pie Charts

<img src="03_Amounts_files/figure-html/unnamed-chunk-15-1.png" width="672" />


As typical, with a just a few categories, we should move the labels onto the graph and just annotate the graph. Also, we'll order the categories from the most temporary employees (Graduate Teaching Assistants) to most permanent (Professors)
<img src="03_Amounts_files/figure-html/unnamed-chunk-16-1.png" width="672" />




### Stacked Bar
<img src="03_Amounts_files/figure-html/unnamed-chunk-17-1.png" width="672" />


### Side-by-side Barchart
<img src="03_Amounts_files/figure-html/unnamed-chunk-18-1.png" width="672" /><img src="03_Amounts_files/figure-html/unnamed-chunk-18-2.png" width="672" />




|                                                                   |     Pie chart    |    Stacked bars  |   Side-by-side bars  |
|:------------------------------------------------------------------|:----------------:|:----------------:|:--------------------:|
| Clear that data is proportions of a whole                         |      **Yes**     |       **Yes**    |        *no*          |
| Precise visual comparison of values                               |       *no*       |        *no*      |      **Yes**         | 
| Visually appealing even in simple comparisons                     |     **Yes**      |        *no*      |      **Yes**         |
| Extendable to nested or multiple distributions or time series     |      *no*        |       **Yes**    |       *no*           |


## Multiple Sets of Proportions

### Faceted Bar charts
<img src="03_Amounts_files/figure-html/unnamed-chunk-19-1.png" width="768" />

<img src="03_Amounts_files/figure-html/unnamed-chunk-20-1.png" width="672" />
<img src="03_Amounts_files/figure-html/unnamed-chunk-21-1.png" width="672" />
<img src="03_Amounts_files/figure-html/unnamed-chunk-22-1.png" width="672" />


### Side-by-Side Stacked Barcharts

<img src="03_Amounts_files/figure-html/unnamed-chunk-23-1.png" width="768" />



### Mosiac plots
Sort like side-by-side stacked bar charts, but now we allow the column width to vary as well. The area is proportional the groups representation in the whole data. This reduces the number of really thin bands because we can make the column narrower as well.
<img src="03_Amounts_files/figure-html/unnamed-chunk-24-1.png" width="672" />


<img src="03_Amounts_files/figure-html/unnamed-chunk-25-1.png" width="768" />



### Alluvial Plots
If we want to compare multiple categorical variables, another option is alluvial plots.
<img src="03_Amounts_files/figure-html/unnamed-chunk-26-1.png" width="672" />


I find that alluvial plots work better for events that have a definate chronological order and there is less stream overlaps.. Here is an example from a [Washington Post story](https://www.washingtonpost.com/news/soloish/wp/2018/03/12/these-redditors-made-graphics-to-visualize-their-dating-lives-heres-what-they-can-teach-us/) about people graphing their online dating interactions. 

![These are the results of 6.5 weeks of online dating by a 37 year old woman.](Resources/Graphs/Alluvial_Plots/OnlineDatingViaWashingtonPost.jpg)




### Tree graphs

In mosaic plots, we had *crossed* variables where every category level of one factor could show up with all levels of another factor. 


-----------------------------
 Factor.1   Factor.2   value 
---------- ---------- -------
    A          w         4   

    A          x         6   

    B          w        15   

    B          x        25   
-----------------------------
Table: Crossed Factors Suitable for a Mosaic Plot. 


Another possibility is that the variables are nested such that a category level of the second factor only ever occurs within a single level of the first factor.


-----------------------------
 Factor.1   Factor.2   value 
---------- ---------- -------
    A          w         4   

    A          x         6   

    B          y        15   

    B          z        25   
-----------------------------
Table: Nested Factors Suitable for a Tree Map. 


When we have a hierarchical structure of categories, then mosaic plots aren't quite right. Instead we'll hierarchically subdivide the graph area up.
<img src="03_Amounts_files/figure-html/unnamed-chunk-29-1.png" width="672" />

The graph first separates the graph into continents and scales the area of each continent by the population of the continent. Then each continent is split into the countries that compose the continent, again with area representing population. Finally the countries are color-coded by their 2007 life expectancy.

This differs from a moasic plot in that a country only occurs withing one continent whereas in a mosaic plot, a category level will occur in multiple "containers".



## Exercises

1. Alluvial plots are a particular type of *Sankey* graphs which show flow rates and amounts and have been around for quite some time. In 1869, Charles Minard created a graphic that details the size of Napaleon's army as they marched on Russia and subsequently returned. You can find the [original](https://en.wikipedia.org/wiki/Charles_Joseph_Minard) or the [modern English translation](https://en.wikipedia.org/wiki/Charles_Joseph_Minard#/media/File:Minard_Update.png) on Wikipedia. 
    a) How many men did the army start marching with?
    b) How many men arrived in Moscow?
    c) How many men died crossing the Berezina River on the return trip? (approximately from the map information provided)
    d) How cold was it when they cross the Berezina River on the retern trip?
    
2. Read Chapter 10 and 11 in Claus Wilke's Fundamentals of Data Visualiztion [book](https://serialmentor.com/dataviz/). In chapter 10 he presents several different graphics that visualize the bridge construction era, bridge material, and which river they cross for bridges near Pittsburgh, Pennsylvania. Discuss three of them and explain which graph you prefer and why.

3. Download data about the [Titanic](https://raw.githubusercontent.com/dereksonderegger/141/master/data-raw/Titanic.csv) disaster at the GitHub site for this class. Save the file as a Titanic.csv and open it in Tableau. 
    a) In Tableau, a faceted stacked barchart just as we did in these notes.
    b) In a new worksheet, copy your faceted stacked barchart and then turn it into faceted pie charts.
    c) Comment on which you prefer and why.
    d) Finally create a mosaic plot of the Titantic dataset. 
    
    


