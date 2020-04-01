# Finding Data




We need to find some data. Sometimes this isn't too hard, but sometimes it is really hard.

## Examples
1. If the data is associated with some sort of federal agencies, then often there is either a web interface or an API.
    a) Centers for Disease Control and Prevention. This federal agency is responsible for tons of health care and mortality data. For example, from the CDC you can find about diabetes rates, impaired driving fatalities, or prevalence of disability types.
        [Main Page](https://www.cdc.gov)
        [Data Catalog](https://data.cdc.gov/browse) provides a nice browser based method of finding data sets.
        [Data.CDC.gov](https://data.cdc.gov) provides resources for learning how to access CDC data via programming APIs.
    b) American Community Survey collects data on an ongoing basis to provide communities with data to inform policy decisions. 
        [Main Page](https://www.census.gov/programs-surveys/acs)
        [Overview of ACS](https://www.census.gov/programs-surveys/acs/guidance/which-data-tool/data-tools-chart.html)
        [Web Interface](https:://data.census.gov) This page allows you to search various responses. This is a great page for getting an idea about what variables are available. I actually really like using this web interface for figuring out what table contains the data I'm interested in.  Notice the `TableID` tag that appears on the output, which will then allow you to access that same data via the programming API. 
        [API Interface](https://www.census.gov/data/developers/data-sets.html) There is a programming interface to the ACS as well. 

2. Data that is publicly available needs to be anonymized. The reasoning is that it would be irresponsible to publicly provide data that could be used to traced back to individuals. For example, if we provided medical, occupation, and housing information at the block level, it would be relatively easy to figure out information about individuals. Therefore, most publicly supplied government data will be at the county or state level of aggregation. Government data is also often aggregated at the yearly or multi-year scale. 

3. Unfortunately there are many cases where the information we want is not available via a governmental agency. Data associated or owned by private companies is exceedingly difficult to acquire because data is valuable. Certain companies like [Consumer Reports](https://www.consumerreports.org/cro/index.htm) do testing to ascertain information like this, but data is their primary product they sell to their subscribers/customers via reports and recommendations. As a result, obtaining the underlying data is extremely difficult.
    a) Suppose we are interested in battery degradation of electric vehicles of various makes and models. Tesla, Nissan, and GM are not required to report this information anywhere. Because this information could easily be used in market campaigns by competitors, none of the the companies would voluntarily release this information. 
    b) Rotten Tomatoes is a web site that compiles film/media critic reviews about movies and TV shows. They also provide a platform for compiling user reviews as well. Their business plan is to drive web traffic to their site and make money by showing advertisements. Making their data available would destroy their business plan and therefore they try to make it very difficult to scrap data from their website. 
    
4. Many on-line communities are able to crowd source large data sets pertinent to specific topics. The problem with these data is that the submitted data isn't necessarily representative of the population of interest. 
    a) The Tesla user groups have been very interested in the aging of their battery packs as the cars age. They have asked interested owners to submit battery information as their car ages. Back in 2016, the Model S owners put together a [survey](https://survey.pluginamerica.org/model-s/). In 2019 a company called Geotab saw a business possibility and got data from 6300 cars and created an website to show that [data](https://storage.googleapis.com/geotab-sandbox/ev-battery-degradation/index.html). Unfortunately, we can't access the raw data.
    b) Baseball data is widely available at a variety of [websites](https://sabr.org/how-to/statistical-databases-and-websites).
    c) Community Driven Pokemon Go [database](https://db.pokemongohub.net)
    
5. In recent years, government funded research has had increasing regulation to require that the data produced be made publicly available. As a result, recent scientific articles are likely to have some way of accessing the data that was used in the study. Unfortunately, this is not universally true and is subject to anonymization. 
    a) [Bacterial infections in Cattle](https://www.microbiologyresearch.org/content/journal/mgen/10.1099/mgen.0.000068)
    b) [SiZer Paper](https://dereksonderegger.github.io/sonderegger_et_al_2009_size.pdf) and associated [R Package](https://cran.r-project.org/web/packages/SiZer/SiZer.pdf)
    
    
    
## Classroom Discussion Topics

### Bicycle Safety
Recently I was talking with my wife about merits of bicycle commuting to NAU versus driving a car.  The question of risk of injury or death from an accident was brought up and I wondering if we could quantify the risk. What should the the response variable? Where could we find data that might address this question.

### Asthma prevalance
Suppose we have information about the number of asthma related hospitalizations for each county. Using that information can we make any inference about the relationship between asthma and race/ethnicity? What about the urban/rural divide? Gender differences?


## Exercises
1. For this exercise, we will ultimately create graphs to investigate the education levels in Arizona counties.
    a) From the American Communities Survey data portal, [https://data.census.gov](https://data.census.gov) use the web interface to find the "Educational Attainment" of people over 25 for counties in Arizona in 2018. Download that data into a .csv file. You might find that ACS won't give this estimate for every county. That is because the populations are so small that ACS won't give breakdowns by race/ethnicity. If the data you download doesn't include all counties, just make a note of that.
    b) Using the estimated number of people in each county/education group, aggregate the education groups into `Not HS Graduate`, `HS Graduate`, `Some College`, `BS or Higher`. 
    c) Calculate the proportions of each educational group within each of the counties.
    d) Create four maps (one for each education group) showing the proportions for each county.
    e) Create a graph for the proportions, faceted by county.
    
2. We are interested in the prevalence of asthma across the United States. For this exercise, we'll use state level data. *Finding county level information appears to be much harder. If you can find county level data, use that, but if not, the state level data is acceptable.*
    a) Using the CDC's website [data.cdc.gov/browse](data.cdc.gov/browse), search for asthma prevalence. You might find that data by metro area first, but adding the search term of `BRFSS` will refine the search to the Behavioral Risk Factor Surveillance System, which is a CDC survey.
    b) Download the data and produce a map of the data.
    

        
