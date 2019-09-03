# Week 2




### Assignments{-}

* Read Chapter 6 and 7 from Wilke's Fundamentals of Data Visualiztion [book](https://serialmentor.com/dataviz/).

* Watch Hans Roslings [TED talk](https://www.ted.com/talks/hans_rosling_shows_the_best_stats_you_ve_ever_seen).

* Make some visualizations in Tableau.  I need to figure out the data for you to use...


## Visualizing Amounts

The 2020 presidential candidate field has a wide range of ages. 
The 
[New York Times](https://www.nytimes.com/interactive/2019/06/09/us/politics/2020-democractic-candidates-ages.html)
has a nice article showing the candidate ages. I grabbed a few of the most prominent candidates and pulled their birthdays from Wikipedia and then calculated their age on election day.

<img src="02_Week_2_files/figure-html/unnamed-chunk-2-1.png" width="672" />

The order of the candidates is useless. Here we have ordered them alphabetically when we should try to think about an ordering that improves clarity. Lets switch to sorting the candidates by age.

<img src="02_Week_2_files/figure-html/unnamed-chunk-3-1.png" width="672" />

This isn't too bad, but it fails to visually impress the differences. A bar chart should visually impress the ages based on the length of the bar so that we con't have to keep looking at the Age axis.

<img src="02_Week_2_files/figure-html/unnamed-chunk-4-1.png" width="672" />

What would be *dishonest* is if we were to chop off the bars at 35 or 40 to make the age difference between Buttigieg and Warren, Trump, Biden and Sanders seem huge.

<img src="02_Week_2_files/figure-html/unnamed-chunk-5-1.png" width="672" />


Often we need to graph some value and want to know how it varies among *two* different categories. In these cases, we have to employ some sort of grouping strategy.

<img src="02_Week_2_files/figure-html/unnamed-chunk-6-1.png" width="672" />

The bar chart here is obscuring the differences in life expectancies because the numbers are so close. In this case, I think points make more sense. Also I want to see how life expectancy has changed since World War II.


<img src="02_Week_2_files/figure-html/unnamed-chunk-7-1.png" width="672" />

In the above graph, I am grouping countries both by enclosure and with a physical path connection. The reader tends to see the line as a whole object and compare the line max/min and slope among the seven countries. 

We might consider changing the faceting to stack the countries, but this makes it much harder to compare countries to see which has a higher life expectancy.
<img src="02_Week_2_files/figure-html/unnamed-chunk-8-1.png" width="672" />


A heat map makes it easier to see which country has the highest life expectancy, but we lose precision in the actual values.
<img src="02_Week_2_files/figure-html/unnamed-chunk-9-1.png" width="672" />



## Visualizing Distributions


## Visualization Proportions

A good pie chart from [reddit/r/dataisbeautiful](https://www.reddit.com/r/dataisbeautiful/comments/cz58sb/blood_type_distribution_in_the_united_states_oc/) member `u/foiltape`.

![A Good Pie Chart](Resources/Graphs/Pie_Charts/BloodTypes.png)







