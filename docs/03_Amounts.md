# Amounts




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



## Exercises

1. 

