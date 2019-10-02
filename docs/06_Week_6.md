# Week 6

This week we start asking "What" to graph instead of just "How" to graph.

Example: Tim Cook displaying 
[total iPhone sales](https://www.techjunkie.com/tim-cook-trying-prove-meaningless-chart/) 
instead of quarterly sales.

Example: Rates of vehicle fires for Tesla vs Internal Combustion Vehicles.

Example: Age Standardization
Suppose we have two populations with the following age structures and proportion that believe that vaping is "very harmful".


Suppose that in each population we've asked if individuals believe that vaping is "very harmful".


```r
data %>% group_by(Population) %>%
  mutate(Agree = `Population Size` * `Vape Harms`) %>%
  summarise(Agree = sum(Agree)/100) %>%
  pander::pander()
```


---------------------
 Population   Agree  
------------ --------
     A        0.336  

     B        0.3675 
---------------------

However It turns out that Population B has a much older population...

Population Sizes

```r
data %>% 
  select(Age, Population, `Population Size`) %>% 
  spread(Population, `Population Size`) %>%
  pander::pander()
```


-----------------
  Age    A    B  
------- ---- ----
 18-29   40   25 

 30-49   30   25 

 50-64   20   25 

  65+    10   25 
-----------------

Is Vaping Harmful? (By age group and population)

```r
data %>% 
  select(Age, Population, `Vape Harms`) %>% 
  spread(Population, `Vape Harms`) %>%
  pander::pander()
```


---------------------
  Age     A      B   
------- ------ ------
 18-29   0.22   0.2  

 30-49   0.4    0.38 

 50-64   0.4    0.39 

  65+    0.48   0.5  
---------------------


What if Population A had the same demographics as Population B? LEt $V_{A,i}$ be the proportion of age group $i$ that believe vaping is harmful, and $S_i$ be the Standardized population size of age group $i$.
$$\textrm{Adjusted Population Proportion}_A = \sum_{i=1}^4 V_{A,i} S_i$$

Next we consider an example of where this might be helpful. Our example comes from a [website](https://ourworldindata.org) "Our World in Data" which tries to provide useful data sets and analysis to address major societal issues. Here we will consider [suicide](https://ourworldindata.org/suicide) rates in different countries around the world.



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

