# Week 2




We will now start systematically working through various graph types and design decisions pertainent to each. 

## Visualizing Amounts

Read Chapter 6 from Wilke's Fundamentals of Data Visualiztion [book](https://serialmentor.com/dataviz/).

The 2020 presidential candidate field has a wide range of ages. 
The 
[New York Times](https://www.nytimes.com/interactive/2019/06/09/us/politics/2020-democractic-candidates-ages.html)
has a nice article showing the candidate ages. I grabbed a few of the most prominent candidates and pulled their birthdays from Wikipedia and then calculated their age on election day.

![](02_Week_2_files/figure-epub3/unnamed-chunk-2-1.png)<!-- -->

The order of the candidates is useless. Here we have ordered them alphabetically when we should try to think about an ordering that improves clarity. Lets switch to sorting the candidates by age.

![](02_Week_2_files/figure-epub3/unnamed-chunk-3-1.png)<!-- -->

This isn't too bad, but it fails to visually impress the differences. A bar chart should visually impress the ages based on the length of the bar so that we con't have to keep looking at the Age axis.

![](02_Week_2_files/figure-epub3/unnamed-chunk-4-1.png)<!-- -->

What would be *dishonest* is if we were to chop off the bars at 35 or 40 to make the age difference between Buttigieg and Warren, Trump, Biden and Sanders seem huge.

![](02_Week_2_files/figure-epub3/unnamed-chunk-5-1.png)<!-- -->


## Visualizing Distributions
