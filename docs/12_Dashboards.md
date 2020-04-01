# Dashboards




## Introduction
Much of the discussion up to this point has focused on traditional static. But the digital transmission of nearly all content makes it possible to provide users with an interactive experience with the data. This will allow non-technical people to interact with the data and ask question that interest them. By allowing people to interact with the data at their own pace, they gain a much deeper understanding of the relationships the graphics are trying to present.

One reason that people get more out of an interactive experience is because they just spend longer looking at the graph. Once you give somebody the option of fiddling with a slider, they spend more time processing exactly what the variable is that they are affecting. If you give them a choice of y-axis values, they'll spend longer considering each one and which one they actually want to look at.  In this sense, an interactive display forces the reader to slow down and really think about the graphic.

Second, it allows the reader to ask question that they are interested in. If I see a graph about immigration patterns in Europe, I will likely gravitate to asking about Germany, because I took German in high school and have traveled there. Whoever build the graphic couldn't have guessed why I care about Germany, but they made it possible for me to dig into the question that I care about.

## Examples

### Covid-19 Example

This New York Times [opinion article](https://www.nytimes.com/interactive/2020/03/25/opinion/coronavirus-trump-reopen-america.html?smid=fb-share&fbclid=IwAR0FAbOYaDwLx1cm9mHNgz3VWo6T5jy77IWR_k9f-x6bv8LHd5DE3aK-438) was written to encourage readers to think about the effects of prolonged social-distancing as a mechanism for reducing the harms by this virus. It has two interactive components. The first component only has one interactive piece but it isn't too overwhelming for the reader. The article then goes on to explain different aspects of the model they built and then gives a similar interactive graphic but now have a ton of different control dials. Finally, the authors give extreme detail to their modeling process and where their data came from.

### A history of World Civilizations
[History of World Civilizations](https://public.tableau.com/en-us/gallery/history-world?tab=featured&topic=greatest-hits) gives its readers a nice clickable interface to really think about the time-line of different civilizations. History of Civilization courses typically focus on individual civilizations and don't give context to what was happening contemporaneously in, say, Chinese vs European history. This dashboard tries to address that need.

### Rainforest Biodiversity
The [Rainforest Biodiversity](https://public.tableau.com/en-us/gallery/tale-rainforest?tab=featured&topic=greatest-hits) dashboard tries to give readers an insight into just how much biodiversity exists in various 

### Oil Rigs in Texas
[Oil Rigs in Texas 2011-2016](https://public.tableau.com/en-us/gallery/texan-oil-rigs?tab=featured&topic=greatest-hits)

### Women in Politics
[Women In Politics Around the World](https://public.tableau.com/en-us/gallery/women-politics-0?tab=featured&topic=greatest-hits)

### Taxi Rides in NYC
[Taxi Rides in NYC](https://public.tableau.com/en-us/gallery/new-york-taxis?tab=featured&topic=greatest-hits)


## Deeper Thoughts

It is tempting to think of interactive graphics as either:

1. A method to get viewers to interact and therefore pay attention.
2. A shiny whiz-bang doodad that is fun to fiddle with.

But it is more subtle than that. By giving the reader some toggles to play with, we often allow them to change the level of *focus*. I like to think of the metaphor of looking at a forest/tree at several different distances. At an extreme close up, all we can see is the color and ridge pattern that define the bark.  As we step back we see the trunk girth.  Even farther back and we start to see the branch patterns and then the tree height. Finally moving even farther back we see how the tree is integrated into the surrounding environment. There are interesting questions to ask at each level of focus, and we need to provide a tool that allows an easy exploration of different levels of focus. 


### Geographic Aggregation Level
Aside from their use when out of your technology is out of power, paper maps are incredibly limited because you have to decide on the map scale when you buy it. But when we use the map, you are constrained to just this scale. When interactive, mobile mapping applications became widespread, the limitations of static maps became obvious. When I plan a cross-country trip, I want to see both the national level information as well as block level information as I am navigating to a hotel. 

For most mapping applications, the interaction is to choose the level of resolution about a certain question. At a high level view, most of the information known by the application is actually hidden from view and only a limited amount of information is displayed. Once we start zooming into map, more details are shown, but at each level, the amount of data shown is usually pretty consistent. By zooming in and out of resolution, we keep the big picture in mind while allowing us to dig into as much detail as you want or need.

On a technical note, there are twenty zoom levels with 1 being the world level and 20 being the building scale level. 

[Google Maps](maps.google.com)

[Google Maps Developer Documentation](https://developers.google.com/maps/documentation/maps-static/dev-guide)
    

### Miscellaneous Aggregation Levels 
There are many real-world examples where we want to be able to shift between different levels of detail. Similarly to the maps, want to keep the amount of information given at each zoom level understandable. 

[Bruce Springstein's History](http://duelingdatalarge.blogspot.com)

[Game of Throne's Character Interactions](http://beta.wind-and-words.com)


### The "Me" Layer
Viewers tend to be very self-centric and a goal of most any story or analysis should be to explain how the topic affects the reader. By allowing a user to interact with and ask how does this affect:

1. Somebody like me.
2. My favorite team.
3. My state/town.
4. Examples:
    a) [NFL Elo Ratings](https://projects.fivethirtyeight.com/complete-history-of-the-nfl/)
    b) [The Birthday Problem](https://pudding.cool/2018/04/birthday-paradox/)


