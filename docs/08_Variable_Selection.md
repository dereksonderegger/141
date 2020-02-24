# What to Graph




## Examples
### Example: Vehicle Deaths

I want to understand how vehicle safety has changed over time. The first statistic we might consider is just the number of vehicle deaths per year. 

The following image comes from the YouTube channel [**Real Engineering**](https://www.youtube.com/watch?v=dmPvGi4s9bg).
![](Images/Vehicle_Deaths_per_Year.png)
But this isn't a good graph because the number of people driving isn't consistent over time. But what is the appropriate scaling? 

![](Images/Vehicle Deaths_per_Billion_VMT.png)

### Example: Military Budgets
    
<img src="08_Variable_Selection_files/figure-html/unnamed-chunk-3-1.png" width="672" />
    
In this data, the amount spent seems inappropriate because of the number of individuals per country is not the same. Furthermore, rich countries can spend more money without it affecting their populace.

### Example: GDP

Should we be using [GDP to measure economic "success"?](https://www.theguardian.com/commentisfree/2019/nov/24/metrics-gdp-economic-performance-social-progress)


### Example: Cummulative Iphone Sales

Tim Cook displaying 
[total iPhone sales](https://www.techjunkie.com/tim-cook-trying-prove-meaningless-chart/) 
instead of quarterly sales.


### Example: Age Standardization
Suppose we have two populations with the following age structures and proportion that believe that vaping is "very harmful".


Suppose that in each population we've asked if individuals believe that vaping is "very harmful".


---------------------
 Population   Agree  
------------ --------
     A         0.35  

     B        0.3798 
---------------------

However It turns out that Population B has a much older population. Here I am considering population sizes of 100 individuals just to make the math convenient, but these could be arbitrary population sizes.

Population Sizes

-----------------
  Age    A    B  
------- ---- ----
 18-29   40   10 

 30-49   30   20 

 50-64   20   30 

  65+    10   40 
-----------------

Is Vaping Harmful? (By age group and population). 
Here we see that, by age group, people in population B tend to be *more* permissive opinion about vaping than population A.


----------------------------------
  Age          A           B      
-------   ----------- ------------
 18-29     40 (0.25)    10 (0.2)  
 30-49     30 (0.4)    20 (0.35)  
 50-64     20 (0.4)    30 (0.366) 
  65+      10 (0.5)    40 (0.45)  
**Total**  **0.35%**     **0.38**  
----------------------------------


What if Population A had the same demographics as Population B? Lets calculate the "Average Demographic Distribution" and then do the multiplication.


----------------------------------------------------------------
  Age        A           B            A.Std         B.Std     
------- ----------- ------------ -------------- ----------------
 18-29   40 (0.25)    10 (0.2)      25 (0.25)      25 (0.2)
 30-49   30 (0.4)    20 (0.35)      25 (0.4)       25 (0.35)
 50-64   20 (0.4)    30 (0.366)     25 (0.4)       25 (0.366)
  65+    10 (0.5)    40 (0.45)      25 (0.5)       25 (0.45)
----------------------------------------------------------------
 Total      35%         38%           38.75%         34.4%
----------------------------------------------------------------

Next we consider an example of where this might be helpful. Our example comes from a [website](https://ourworldindata.org) "Our World in Data" which tries to provide useful data sets and analysis to address major societal issues. Here we will consider [suicide](https://ourworldindata.org/suicide) rates in different countries around the world.

 
### Example Maternity Deaths

Suppose that we are interested the mortality rates that women experience related to pregnancy and birth.

Step One: Variable of interest
Clearly we want to have some sort rate adjustment to account for different population sizes. However, because not all women give birth, we shouldn't just consider all women. Instead we'll consider this maternal deaths per 100,000 live births. 

Step Two: Context
Approximately 700 women per year die due to complications of pregnancy or child birth in the United States. This turns out to be ~17.2 deaths per 100,000 births, or about 1 maternal death per 5,000 live births. 

Step Three: Conditional Statistics
  - How does this vary between countries?
  - How does this vary between states?
  - How does this vary between socio-economic or ethic groups?
  

Step Four: Finding Data
  - Typically it is easy to google for a single statistic for a country. However, it is often difficult to find a dataset that allows for the conditional statistics, such as between states or ethnic groups.
  - I found data from the Centers for Disease Control. The CDC's [Wonder](https://wonder.cdc.gov) on-line access allows you to format data requests for a wide variety of scenarios.

Now we find some data from the CDC...
  - Problem: Can't get State by Year data due to confidentiality...
  - Year by race?



## Exercises

1. Download from the STA 141 GitHub raw data directory files for the 
[murders per state](https://github.com/dereksonderegger/141/raw/master/data-raw/Guns_State_Deaths_2010.csv)
as well as 
[population sizes](https://github.com/dereksonderegger/141/raw/master/data-raw/State_Pop.csv)
of each state. The murder information data file contains information about the number of murders per state, how many of those murders were gun related, and the rate of gun ownership. I got this information from 
[Wikipedia](https://en.wikipedia.org/wiki/Firearm_death_rates_in_the_United_States_by_state),
and it isn't clear if gun ownership rate is the percent of residents that owns one or more gun or if it is the number of guns per state divided by the number of residents.
    a) Join the state population and murder information data sets.
    b) Calculate the murder rate and gun murder rate for each statement per 100,000 residents.
    c) Make a scatterplot of gun ownership rate vs the gun murder rate.
    
2. Download from the STA 141 GitHub raw data directory files for the 
[suicide rates](https://github.com/dereksonderegger/141/raw/master/data-raw/State_Suicides_2016.csv) 
per state. Join this data to data you used in problem 1. Create a scatterplot graph of suicide rate vs gun ownership rates.
  
3. Given the context of the problems (1) and (2), what follow-up questions come to mind? Given at least two follow-up questions and the graphs you would create to address those questions. Identify the data you would need to create such a graph. *Context: At this point, you are not expected to find the data, but identify what variables of interest you would need.*

4. Propose a topic of interest to you and consider what variables you would need to obtain to explain it to your fellow classmates in a series of one or more graphics. In particular, discuss how the variables you chose needed (or will need) to be transformed to provide useful comparisons.



