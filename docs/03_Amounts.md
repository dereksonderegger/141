# Amounts




## Introduction
This chapter focuses on displaying a single numerical variable versus one or more categorical variables. To display the quantitative variable, we'll try to stay at the top of the EPT tasks and the quantitative variable will be quantified with either the `x` or `y` axis or using length. The exception to this is the heatmap, where the quantitative variable is encoded by the color of the tile.

<img src="03_Amounts_files/figure-html/unnamed-chunk-2-1.png" width="672" />

## Examples
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


Often we need to graph some value and want to know how it varies among *two* different categories. In these cases, we have to employ some sort of grouping strategy.

<img src="03_Amounts_files/figure-html/unnamed-chunk-7-1.png" width="672" />

The bar chart here is obscuring the differences in life expectancies because the numbers are so close. In this case, I think points make more sense. Also I want to see how life expectancy has changed since World War II.


<img src="03_Amounts_files/figure-html/unnamed-chunk-8-1.png" width="672" />

In the above graph, I am grouping countries both by enclosure and with a physical path connection. The reader tends to see the line as a whole object and compare the line max/min and slope among the seven countries. 

We might consider changing the faceting to stack the countries, but this makes it much harder to compare countries to see which has a higher life expectancy.
<img src="03_Amounts_files/figure-html/unnamed-chunk-9-1.png" width="672" />


A heat map makes it easier to see which country has the highest life expectancy, but we lose precision in the actual values.
<img src="03_Amounts_files/figure-html/unnamed-chunk-10-1.png" width="672" />
