# Geographic



The usual map of the world that is shown is highly misleading. Because we have to project a spherical object onto a 2-D plane, we can't do it without distorting the areas. The result is that areas near the north and south poles look much larger than they actually are. This ends up emphasizing high latitude European countries compared to equatorial countries.

[The True Size](https://thetruesize.com)

Here are the three most commonly used projections:
Equirectangular has an even grid of latitude and logitude lines.
![Equirectangular](https://upload.wikimedia.org/wikipedia/commons/8/83/Equirectangular_projection_SW.jpg)

The Robinson projection is a compromise that tries to re-scale land near the poles to be closer to the actual size.
![Robinson](https://upload.wikimedia.org/wikipedia/commons/9/96/Robinson_projection_SW.jpg)

Another compromise is to allow for discontinuities on the map surface. This decreases the amount of distortion, but cleaves Greenland and Antarctica.
![Goode homolosine](https://upload.wikimedia.org/wikipedia/commons/f/f2/Goode_homolosine_projection_SW.jpg)


I haven't had an opportunity to place my own spin on geographic maps and instead we will look at Claus Wilke's Chapter on [Geographic maps](https://serialmentor.com/dataviz/geospatial-data.html).



<!--html_preserve--><div id="htmlwidget-123dc4dfd89ee066f8d0" style="width:672px;height:480px;" class="leaflet html-widget"></div>
<script type="application/json" data-for="htmlwidget-123dc4dfd89ee066f8d0">{"x":{"options":{"crs":{"crsClass":"L.CRS.EPSG3857","code":null,"proj4def":null,"projectedBounds":null,"options":{}}},"setView":[[35.1991666666667,-111.659722222222],14,[]],"calls":[{"method":"addTiles","args":["//{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",null,null,{"minZoom":0,"maxZoom":18,"tileSize":256,"subdomains":"abc","errorTileUrl":"","tms":false,"noWrap":false,"zoomOffset":0,"zoomReverse":false,"opacity":1,"zIndex":1,"detectRetina":false,"attribution":"&copy; <a href=\"http://openstreetmap.org\">OpenStreetMap<\/a> contributors, <a href=\"http://creativecommons.org/licenses/by-sa/2.0/\">CC-BY-SA<\/a>"}]}]},"evals":[],"jsHooks":[]}</script><!--/html_preserve-->

One of the best things about interactive maps is that you can zoom in and out and change the level of resolution. The ability to easily transition between different scale is amazing and is a hallmark of a quality interactive experience.

Google Maps is built on a 256x256 pixel tile system where zoom level 0 is an image of the whole earth. Each zoom step in halves the X and Y range and so shows 1/4 of the surface area. Zoom level 20 is the scale of a single building, level 14 is the zoom level displayed above. 


## Map Layers
Most maps that are viewed have multiple sources and types of data displayed. In most software that specifically handles maps, we have the option of adding multiple data types to build up a custom map.

From a blank map, we could:

1. Add a layer showing ocean/landmass divisions.
2. Add a layer showing country borders.
3. Add a layer showing state/province borders within countries.
4. Add a layer showing land type (forest, etc)
5. Add a layer showing major cities.
6. Add a layer showing major roads.
7. Add a layer showing major water-ways.

Fortunately there are many map creation sites that easily allow you to specify a location via the latitude and longitude coordinates and will display maps with the above layers already added.

## Tableau
The mapping within Tableau is unfortunately limited. We can't easily create map layers and overlay them, but Tableau does a *great* job at taking data sets with a small amount of geographical information (e.g. country names, state/provinces, or even county names) and recognizing them as geographical data and making maps that show those and easily filling in the geo-political region.

<iframe width="560" height="315" src="https://www.youtube.com/embed/qLlAmqwg6wU" frameborder="0" allowfullscreen></iframe>




