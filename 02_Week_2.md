# Week 2




### Assignments{-}

1. Read Chapter 6 and 7 from Claus Wilke's Fundamentals of Data Visualiztion [book](https://serialmentor.com/dataviz/).

2. Watch Hans Roslings [TED talk](https://www.ted.com/talks/hans_rosling_shows_the_best_stats_you_ve_ever_seen). Comment on two aspects of the videa that stand out to you regarding how he presented his data and how he talked through the visualization with the audience.

3. Graph the NOAA CO$_2$ data over time.  The Nationa Oceanic and Atmospheric Adminstration has monthly CO$_2$ atmospheric levels data available to the public at NOAA's [website](ftp://aftp.cmdl.noaa.gov/products/trends/co2/co2_mm_mlo.txt). However, this is a little obnoxious to get into Tableau, so I've done some data wrangling for you [already](https://raw.githubusercontent.com/dereksonderegger/141/master/data-raw/CO2.csv). The `Date2` column has the date information encoded using a continuous decimal scale. CO$_2$ is measured in parts per million.

    a) Plot CO$_2$ over time while showing the monthly trend. Should we use area or lines?  Why?
    b) Create a graph that shows a single mark per year (so average over all observations in a year). Do you like this better? Explain your reasoning.
    c) Create a follow-up graphic that shows the monthly trend. Explain what you want to demonstrate and why you chose to display the information as you did.
    




## Amounts

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



## Distributions

Given a single variable, I often want to know what values are common and what values are rare. To visualize this, we will primarily compare marks along a common axis (the most accurate EPT!)

### Small samples
If we only have a few observations, then we can just graph them along an axis.

<img src="02_Week_2_files/figure-html/unnamed-chunk-10-1.png" width="672" />

Another trick that works with more data, is to not use dots but rather lines. This is called a rugplot. This is often used in conjunction with another graph such as a scatterplot.
<img src="02_Week_2_files/figure-html/unnamed-chunk-11-1.png" width="672" />


### Histograms
When we have a moderate size of data, graphing dots exactly on an axis doesn't work and results in overplotting and it is difficult to see where the data cluster. Instead we'll stack the dots in columns along the axis and call this a dotplot.

<img src="02_Week_2_files/figure-html/unnamed-chunk-12-1.png" width="672" />

Each dot represents an observation, but the x-values have been rounded into group values. So we have lost some precision. Another common version of this is a histogram, where the y-axis represents how many observations fall into each bin.

<img src="02_Week_2_files/figure-html/unnamed-chunk-13-1.png" width="672" />

The choice of how many bins to include can make a dramatic difference in a graph. In particular, I don't believe that there is any biological reason to think the dip near 2700 grams is real. I believe that is is actually just an artifact of the data I have. Instead we should consider changing the number of bins.

<img src="02_Week_2_files/figure-html/unnamed-chunk-14-1.png" width="672" />



### Density plots
Histograms suffer from being to angular or pointy. Another solution is call a kernel density smoother that mathematically smooths over the heights of the histogram bars.
<img src="02_Week_2_files/figure-html/unnamed-chunk-15-1.png" width="672" />


### Faceting
One of my favorite ways to display multiple distributions is to group each distribution into it's own plot in a process often referred to as faceting.

<img src="02_Week_2_files/figure-html/unnamed-chunk-16-1.png" width="672" />

By choosing to put the two graphs on top of the other, it becomes clear that the smoker's tend to give birth to smaller infants. This fact isn't clear in the side-by-side graphs.


### Stacking

Stacking the distribution involes laying each distribution on top of each other, so that the zero of the top curve follows the curve on the bottom. You can visualize the B chart having the Non-smoker density graph just melt onto the smoker density.

<img src="02_Week_2_files/figure-html/unnamed-chunk-17-1.png" width="672" />
I really don't like this graph because it is very hard to see where the peak of the non-smoker curve is. This stacking trick works well enough when we have proportions but isn't good here.



### Overlapping curves
Another option is to graph the densities, but allow them to overlap each other and be a bit see-thru.
<img src="02_Week_2_files/figure-html/unnamed-chunk-18-1.png" width="672" />

For seeing shifts in the center of the distribution, overlapping curves is quite powerful.

For another nice example, we can look at the density of the daily maximum temperature in Lincoln Nebraska in 2016.
<img src="02_Week_2_files/figure-html/unnamed-chunk-19-1.png" width="672" />


### Boxplots
Boxplots are a traditional way to display a distribution and the box contains the middle 50% of the data points.
<img src="02_Week_2_files/figure-html/unnamed-chunk-20-1.png" width="672" />
Notice that in density plots, there were two peaks in December with the lower peak corresponding to a cold snap. However that detail is lost in the boxplots.

### Violin Plots
Boxplots are a traditional way to display a distribution and the box contains the middle 50% of the data points.
<img src="02_Week_2_files/figure-html/unnamed-chunk-21-1.png" width="672" />
Now we can see the two peaks in December, but the three peaks in November have been flattened out because the amount of space necessary to show it would require that the densities overlap.


## Proportions

A good pie chart from [reddit/r/dataisbeautiful](https://www.reddit.com/r/dataisbeautiful/comments/cz58sb/blood_type_distribution_in_the_united_states_oc/) member `u/foiltape`.

![A Good Pie Chart](Resources/Graphs/Pie_Charts/BloodTypes.png)







