# X-Y Relationships




## Scatter plots
Basic idea is to build off of a scatter plot. This visualizes the relationship between two continuous variables.

<img src="06_X-Y_relationships_files/figure-html/unnamed-chunk-2-1.png" width="672" />


In a scatter plot we can see the relationship between two variables. We can see the relationship among more variables (either continuous or discrete) by adding Size, Color, and Shape.

We could also add other categorical variables by adding faceting. With this combination we can visualize the relationship between up to 6 different variables.

<img src="06_X-Y_relationships_files/figure-html/unnamed-chunk-3-1.png" width="672" />


### Pairs plots (All-vs-all scatterplots)
Sometimes we have a dataset with several different variables of quantitative variables. One thing we could do is just make all possible pairs of scatterplots. In a *pairs* plot, we make a grid of graphs where x-axis or y-axis remains consistent as we move across the columns or rows of the grid.
<img src="06_X-Y_relationships_files/figure-html/unnamed-chunk-4-1.png" width="672" />

**In Tableau, put all of the variables onto the shelf spaces (using the average of each). This gets the grid of graphs, each with one point. Assuming you have a column that is a unique identifier for each observation, if you put that in the detail card (which basically defines the scale at which the average is being taken), then the average is taken over each observation, and we end up with the scatterplot matrix.**

## Correlation Plots
### Pearson's Correlation Coefficient

We first consider Pearson's correlation coefficient, which is a statistics that measures the strength of the linear relationship between the predictor and response. Consider the following Pearson's correlation statistic
$$r=\frac{\sum_{i=1}^{n}\left(\frac{x_{i}-\bar{x}}{s_{x}}\right)\left(\frac{y_{i}-\bar{y}}{s_{y}}\right)}{n-1}$$
where $x_{i}$ and $y_{i}$ are the x and y coordinate of the $i$th observation. Notice that each parenthesis value is the standardized value of each observation. If the x-value is big (greater than $\bar{x}$) and the y-value is large (greater than $\bar{y}$), then after multiplication, the result is positive. Likewise if the x-value is small and the y-value is small, both standardized values are negative and therefore after multiplication the result is positive. If a large x-value is paired with a small y-value, then the first value is positive, but the second is negative and so the multiplication result is negative.


<img src="06_X-Y_relationships_files/figure-html/unnamed-chunk-5-1.png" width="672" />

<img src="06_X-Y_relationships_files/figure-html/unnamed-chunk-6-1.png" width="672" />


The following are true about Pearson's correlation coefficient:

1. $r$ is unit-less because we have standardized the $x$ and $y$ values.
2. $-1\le r\le1$ because of the scaling by $n-1$
3. A negative $r$ denotes a negative relationship between $x$ and $y$, while a positive value of $r$ represents a positive relationship.
4. $r$ measures the strength of the *linear* relationship between the predictor and response.

<img src="06_X-Y_relationships_files/figure-html/unnamed-chunk-7-1.png" width="672" />


<img src="06_X-Y_relationships_files/figure-html/unnamed-chunk-8-1.png" width="672" />


## Overplotting

### Transparency

Wilke's book uses and example of departure time of day versus the delay amount for all the flights out of New York City in 2013. The story to take home is that longer delays tend to happen later in the afternoon or evening rather than in the morning. Wilke uses these data to argue that overplotting is annoying and that a heat map can help out.

<img src="06_X-Y_relationships_files/figure-html/unnamed-chunk-9-1.png" width="672" />


### Intensity Maps
No matter how much we adjust the transparency, we can't really fix this because there is so much data. If for each area on the graph, we count how many observations fall into the region, we can color the area based on how many observations are in the region.

<img src="06_X-Y_relationships_files/figure-html/unnamed-chunk-10-1.png" width="672" />

This graph leads me to think that MOST flights are quite late, when if fact, they aren't. This is due to the problem of "proportional pixels". There is so much space and color devoted to flights that are more than 30 minutes late that the viewer can't help but have that impression.


---------------------------------
   delay       n      proportion 
----------- -------- ------------
 (-30,-10]   12465     0.03794   

  (-10,0]    187620     0.5711   

  (0,10]     45598      0.1388   

  (10,30]    34543      0.1051   

  (30,60]    21710     0.06608   

 (60,120]    16858     0.05132   

 (120,180]    5830     0.01775   

 (180,Inf]    3893     0.01185   
---------------------------------

Because we are interested in the time distribution of significant delays, and early departures are usually only by a couple of minutes, we'll we'll take a log$_{10}$ transformation of all the delays greater than 10 minutes. We'll also modify the color scale so that hexagons with a small count fade into the background and are white and hexagons with relatively large counts have a noticable color.

<img src="06_X-Y_relationships_files/figure-html/unnamed-chunk-12-1.png" width="672" />


### Contour Plots

Contour plots are similar to density plots, but for two-axis.  The lines mark out regions of similar probability and we read it similarly as a topological map that shows elevation.  In this case we can see that the most frequent delays are around 30 minutes long and occur near 5 pm.  There is also a local peak of 20 minute delays around 10 am. 

<img src="06_X-Y_relationships_files/figure-html/unnamed-chunk-13-1.png" width="672" />


## Regression Lines

Often I want to add a trend line to a scatter plot. This line is the line that fits through the data "the best", where "the best" minimizes the sum of the *squared* vertical distances between the data points and the trend line.

**In Tableau, click the analytics tab and drag the trend line icon onto the graph. You can then select the shape of the line you'd like to add.**

## Plot building process

Often I find myself making a bunch of graphs and none of them show something interesting. The following is my usual path of investigation in situations where I have several (3 or more) variables and I want to understand how they relate to each other. Below is a recommended analysis path, but shouldn't be taken as the *only* path towards finding an interesting visualization in a data set.

1. Identify the strongest or most interesting relationships. If there is an obvious response variable, I will examine all the others as predictors to the response. I then approximately rank them as to which variable most strongly predicts the response.  If there isn't a obvious response, I'll look at the pairs plot and pick out the strongest relationship.

2. Start with the strongest relationship with those variables on the x and y axis. Preferentially, I'll use quantitative variables for these.  Next add other variables to the graph as attributes high on the EPT scale (size, color) or on the grouping scale (facets, shape).

The critical aspect is that I want to select the most important relationship to be displayed via the x and y axis and then other relationships added on top via the other graph attributes.



## Exercises

1. Read Chapters 12 and 18 from Wilke's book. Feel free to skip section 12.3.

2. We will use a smaller version of the diamonds dataset that Wilke uses in his Chapter 18. You can download it from my GitHub site in a 
[.csv file](https://raw.githubusercontent.com/dereksonderegger/141/master/data-raw/Small_Diamonds.csv). 
We will examine price, carats, cut (Fair, Good, Very Good, Premium, and Ideal), color (J - D), and clarity (I1, SI2, SI1, VS2, VS1, VVS2, VVS1, IF), where the category labels I've given are from worst to best. 
    a) Had I not told you that clarity level IF is the best clarity, what graphs could you make to figure that out? Create and show a graph that demonstrates this and explain your graph. 
    b) If the diamond clarity isn't good, the dimond cutter won't worry too much about the quality of cut. Make a graph that demonstrates that and explain your reasoning.
    c) While in principle it is possible for the dimond carats to be any number, they are often cut to be some common carat size. Create a visualization that shows this and discuss how the carat size changes as the cut and clarity improve.
    
3. From the [Gapminder.com](www.gapminder.com/data) website, I've downloaded a bunch of interesting covariates about countries. You can find my dataset at my GitHub site in a 
[.csv file](https://raw.githubusercontent.com/dereksonderegger/141/master/data-raw/Gapminder.csv). 
The variables I've included include the country region, year, population size, population growth, percent of population with basic sanitation, GDP per capita, Total GDP, life expectancy, adult male and female labor force participation rates. *Fertility is the number of children per woman, so a fertility rate of 2 children per woman is a stable population. For this question, create some version of the graphs presented in this chapter. We will address geographic maps in the next chapter.* 
    a) For all the following questions, only consider the year 2015. 
    b) Investigate the relationship between GDP and GDP_per_capita. Why should we prefer to work with GDP_per_capita when comparing standards of living between, say, the United States and Canada?
    c) Investigate the relationship between life expectancy, fertility, and GDP_per_capita. Do these relationships seem to vary by region?  Comment on your graphs and relationships that you observe.
    d) Investigate the relationship relationship between life expectancy, adult female labor force participation and fertility. Does this vary by region? Comment on your graphs and relationships that you observe.
    


