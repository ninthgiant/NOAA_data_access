############
#
#     Work with NOAA datasets - Dec. 11, 2018
#        Source for noaa online access: https://www.ncdc.noaa.gov/cdo-web/
#        First, get access code from NOAW website
#        Website with usage notes: https://ropensci.org/blog/2014/03/13/rnoaa/
#        Webesit with buoy instructions: https://www.rdocumentation.org/packages/rnoaa/versions/0.7.0/topics/buoy

#
#
####################

options(noaakey = "UjUaGqEXrnXasVKYHOBbewrZRyVsTbMj")

### install the R packages needed and load them
install.packages("rnoaa") # main one
install.packages("ncdf4") # needed for some fucntdions for buoys
library(rnoaa)
library(ncdf4)

#### Georges Banks Buoys
# 44024
# 44011
# 44008

#### GOM buoys of interest
# 44307   # - closes to middle of GOM
b44011 <- buoy(dataset = 'stdmet', buoyid = 44011)
b44008 <- buoy(dataset = 'stdmet', buoyid = 44008, year = 2010)

### get the data frame associated with this:
View(b44008$data)


