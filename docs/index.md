--- 
title: "STA 141 - Exploratory Data Analysis and Visualization"
author: "Derek L. Sonderegger"
date: "January 15, 2020"
site: bookdown::bookdown_site
output: bookdown::gitbook
documentclass: book
bibliography: [book.bib, packages.bib]
biblio-style: apalike
link-citations: yes
github-repo: dereksonderegger/141
description: ""
---

# Preface {-}
These are the lecture notes for STA 141 - Exploratory Visual Data Analysis. This course is intended to teach students how to think critically about problems, examine data that can provide answers, and create graphs that are insightful, and ask follow-up questions to the visual analysis. Also, because disinformation can be disguised to seem credible, students will also be exposed to various data visualization tricks and statistical malarkey that propagandists.

The source code for my notes, homework assignments, and other information is available on my on [GitHub](https://github.com/dereksonderegger/141). In particular, there is a directory `data-raw` that contains all of the datasets that we'll use in these notes and homeworks.

## Instructional Material
This course draws information from several websites and books.

* Alberto Cairo's book [The Truthful Art](https://www.amazon.com/dp/0321934075/ref=cm_sw_em_r_mt_dp_U_C6zxDbY6JT04F). Alberto Cairo is the Knight Chair in Visual Journalism at the School of Communication of the University of Miami (UM), where he heads specializations in infographics and data visualization. You can find more about him at [thefunctionalart.com](http://www.thefunctionalart.com). Also at his website, his blog highlights data visualizations in the news. Many of the graphs I will shown in this class are featured here. 

* Claus O. Wilke has a book 
[Fundamentals of Data Visualization](https://www.amazon.com/dp/1492031089/ref=cm_sw_em_r_mt_dp_U_DvAxDbV7NFYY6). 
There is an online pre-print version of the book available 
[here](https://serialmentor.com/dataviz/) 
as well as GitHub repositories for the book 
[source](https://github.com/clauswilke/dataviz) 
and 
[data](https://github.com/clauswilke/dviz.supp) used in the book.  
He also has a nice R package called [cowplot](https://cran.r-project.org/web/packages/cowplot/vignettes/introduction.html) that aids in making publication ready graphs using R's `ggplot2`.

* [Calling Bullshit](https://callingbullshit.org) This is a 3-credit course taught at University of Washington. Their goal is to teach students to recognize bullshit provide another scientist a reason why a claim is bullshit.

* Amelia McNamara's [SDS 136 course.](http://www.amelia.mn/sds136/index.html) Amelia is an Assistant Professor at University of St Thomas and I've been influenced by her presentations at national conferences. These are her notes from a data visualization course that she teaches. She is also pretty fun to follow on twitter.


## Data Sources

* The website [Our World in Data](https://ourworldindata.org) has tried to bring together huge amounts of information about a variety of topics and presents the data in context. It typically addresses socioeconomic issues.

* The website [Kaggle](https://www.kaggle.com) started out as a repository for data sets in which data scientists would have host informal competitions. It has grown to host thousands of data sets covering a wide variety of issues.

* The [Gapminder](https://www.gapminder.org) website has health and socioeconomic data for counties going back in time.

* Access data from the US Government from [Data.gov](http://www.data.gov)

* The Centers for Disease Control [Vital Stats](https://www.cdc.gov/nchs/data_access/vitalstatsonline.htm) allows for direct download of commonly used downloads. The CDC's [Wonder](https://wonder.cdc.gov) on-line access allows you to format data requests for a wide variety of scenarios.

## Introduction
* Why visualize data?
    * See relationships that raw data obscure.
    * Cognitive work to translate raw numbers into context between other data points are already done for you.
    * Good graphics translate particular numerical relationships into physical relationships which our brains are really good at processing.
    

* [UK Drug Poison](https://www.ons.gov.uk/peoplepopulationandcommunity/healthandsocialcare/healthandwellbeing/articles/middleagedgenerationmostlikelytodiebysuicideanddrugpoisoning/2019-08-13) These are the data from the UK related to drug overdose and misuse. Farther down the page gives a similar graph on suicide.

* [Migration Patterns in Europe](https://www.torre.nl/EUmoves/).

* While the New York Times is generally really quite good, this [graph](https://www.nytimes.com/2016/11/29/world/americas/western-liberal-democracy.html?_r=0) is quite misleading. Another view of the data is more fair, although the still 
[depressing.](https://1.bp.blogspot.com/-RQ66mUnaw9Y/XT2gT0j8-tI/AAAAAAAAKoU/G5eOqwdoXS4aW_n0s5-OPWTwes3rdDS6ACLcBGAs/s1600/democracy2.png)

* I feel compelled to show a bad [3-d Excel graphic](https://consultantjournal.com/blog/use-3d-charts-at-your-own-risk) as well.

* Reuter's infamous [gun deaths in Florida](https://callingbullshit.org/tools/img/stand_your_ground.png) chart.

## Pedigogical Plan

1. Develop basic understanding and skills about data wrangling. Because this course will require you to find data that interests you, we need to also learn how to manipulate it because the data are *never* in a nice format.

2. Introduce the Elementary Perceptual Task order and understand how certain visual tasks are more accurate than others.

3. Introduce a slew of graphic types and examples of where and how they are commonly used.

4. Investigate the choice of variables to display and how that can influence the graph interpretation.

5. Understand how interactive graphics can be used across a broad audience.
