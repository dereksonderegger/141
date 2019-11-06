# Week 9




## Dashboards

The goal with dashboards is to create a sequence of visualizations that work together to tell a story. 

Tableau Examples:
[History of World Civilizations](https://public.tableau.com/en-us/gallery/history-world?tab=featured&topic=greatest-hits)
[Rainforest Biodiversity](https://public.tableau.com/en-us/gallery/tale-rainforest?tab=featured&topic=greatest-hits)
[Oil Rigs in Texas 2011-2016](https://public.tableau.com/en-us/gallery/texan-oil-rigs?tab=featured&topic=greatest-hits)
[Women In Politics Around the World](https://public.tableau.com/en-us/gallery/women-politics-0?tab=featured&topic=greatest-hits)
[Taxi Rides in NYC](https://public.tableau.com/en-us/gallery/new-york-taxis?tab=featured&topic=greatest-hits)


Our Example:
Example: Over the last few years, news articles have been talking about the change in demographics in regards the proportion on Hispanic citizens. Given that demographics are highly related to voting preferences, understanding these demographic shifts seems interesting.

Before we consider the voting issue, we'll first try to address the changing demographics. As we consider how to build an interactive graphic, we should keep in mind the following:

1. Demographic changes are highly spatially variable. We have to have maps on a county-level scale in the graphics.
2. Time Matters. Somehow we need to be able to step through time and see what happens.
3. Because we are dealing with Hispanic/non-Hispanic, we have some flexibility in color choices. We could fill the county or state color based on the proportion of the region that is Hispanic.
4. It would be cool have a map where you could select a state or county and then see how the proportion changes over time.
5. I still have a question about if we need to visualize the proportion or the raw numbers of people. Eventually I want to think about voting and relative population sizes matter, so maybe we want to be able to switch between proportions and counts.
6. I'm not sure about the scale of the data we need. Are counties small enough or do we need to go onto finer scale information? I worry that going too small might be tough to visualize.





## Data Gathering

The following web links will cause a query on the Census web site, and then result in some data. Go ahead and click on these!

http://api.census.gov/data/2018/pep/population?get=DATE_CODE,DATE_DESC,DENSITY,POP,GEONAME,STATE&for=state:*

http://api.census.gov/data/2018/pep/population?get=DATE_CODE,DATE_DESC,DENSITY,POP,GEONAME,STATE&in=state:01&for=county:*

1. The base website is http://api.census.gov/data/2018/pep/population. This is effectively specifying which table we want to query from. The `pep` part stands for the *Population Estimation Program*, which is one division of the Census Bureau. The 2018 part of the base address defines the *vintage* of the estimate. This page will produce estimates for the years 2010-2018, but the Census Bureau is constantly updating those estimates based on new information. So the this is specifying that we are to use the Census' 2018 estimate of the population.
2. Modifiers are included after the `?` and different modifiers are separated by `&`
3. `get=` section defines the variables that you want 
4. The `for=state:*` denotes that we want all of the states. `for=state:01` would have been just Alabama. If we want all the county populations we can use `for=county:*`. If we just want county populations within a particular state, we would use `in=state:01&for=county:*`
5. The `DATE_CODE=1` indicates that I just want the first estimate in the decadal time series of estimates. If I didn't include this, we'd end up with estimates for each year between 2010 and 2018. 

When you go to this website, the database will read the modifier list, do the appropriate database query, and return the result via a webpage that has a very simple structure that is easy to parse into a table.

The hard part about Web APIs is understanding which tables are available and what each covariate means. For the US Census Bureau, the [developers](https://www.census.gov/developers/) page is a great place to start. For the Population Estimation Program, there is a specific developers [page](https://www.census.gov/data/developers/data-sets/popest-popproj/popest.html)

This is the call that I ended up using:
http://api.census.gov/data/2018/pep/charagegroups?get=DATE_CODE,DATE_DESC,HISP,POP,GEONAME,STATE&in=state:04&for=county:*

## Data Preparation

1. Remove all the rows for "Both Hispanic Origins". The `HISP` codes are 0 = Both Hispanic Origins, 1 = Non-Hispanic, 2 = Hispanic. I found this following the developers page into the [variable information](https://api.census.gov/data/2018/pep/charagegroups/variables/HISP.json).
2. Remove the Census derived estimates because they double up the dates. Make sure there is just one set of estimates per date/county.
3. Make sure all the County names don't end in "County" because Tableau prefers just the base name.
4. Within each county/date combination, calculate the Proportion Hispanic.

## Base Graphic Components

1. Load the Arizona County Hispanic Population data that we downloaded. Notice we have a column for County and another for State as well as a column for Population Number and Hispanic Origin (Yes/No).
2. Open a new graph sheet and name the sheet `Population Bar`. 
    a) Drop Date onto the x-axis, Population onto the y-axis, and Hispanic onto the color.
    b) For the Date, change the aggregation from `Year` to `Exact`. For Population, make sure the aggregation is `Sum`. 
3. Open a new graph sheet and name the sheet `Map`.
    a) Drag `County` onto the plot and change the mark type to `Map`.
    b) Drag `Proportion Hispanic` onto the color. 
    c) Drag `Date` into the tool tips. Notice that when you hover over a county, you'll get the 2010 estimate.
    
## Dashboard

1. Open a new dashboard.
2. Drag the map graphic to the palette area. Drag the population bar to the palette area underneath the map. 
3. To add the interactivity, we'll force the map to do some filtering. So clicking on a county results in us making the population bar for just that particular county. 
    a) To do this, click the main menu `Dashboard` -> `Actions` -> `Add Action` -> `Filter`.
    b) In the source pane, select only the map. In the target section, select only the Population Bar.
    c) In the Target Filters, change it to be only the `County`




## Next Step
1. Election Data. https://libguides.princeton.edu/elections#s-lg-box-1612379. I downloaded it from the MIT Data Lab: https://electionlab.mit.edu/data
2. Can I do this by state?  Definitely. I just need to download the data by all states.
3. Can I make the Year selector a bit nicer?
