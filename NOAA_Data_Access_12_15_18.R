############ NOAA_Data_Access_12_15_18.R
#
#     Work with NOAA datasets - Dec. 11, 2018
#        Source for noaa online access: https://www.ncdc.noaa.gov/cdo-web/
#        First, get access code from NOAW website
#        Website with usage notes: https://ropensci.org/blog/2014/03/13/rnoaa/
#        Webesit with buoy instructions: https://www.rdocumentation.org/packages/rnoaa/versions/0.7.0/topics/buoy
#        Website to ID which buoys you want to access: reference: NOA bouy page: https://www.ndbc.noaa.gov/
#
#     Dec. 15, 2018 - now in GitHub repository - old version no longer used
#        To do: 
#          manage the time stammps so I can get dates, etc. for access
#          function to get set dates and times
#          function to join sets of above sets
#
#
####################

#### 
# You have to have an access key to the NOAA site. This is mine
# set key so don't have to enter original every time
###
options(noaakey = "UjUaGqEXrnXasVKYHOBbewrZRyVsTbMj")

### install the R packages needed and load them
install.packages("rnoaa") # main one
install.packages("ncdf4") # needed for some fucntdions for buoys
library(rnoaa)
library(ncdf4)

### may need lubridate to process dates
library('lubridate')


#### Gulf of Maine buoys - but data aren't available - at NECOOCs page
# 44307   # - closest to middle of GOM - get error when try  below

#### Georges Banks buoys of interest - get all data for particular years
b44011 <- buoy(dataset = 'stdmet', buoyid = 44011, year = 2010)  # central at edge
b44008 <- buoy(dataset = 'stdmet', buoyid = 44008, year = 2010) # ESE of 44011
b44024 <- buoy(dataset = 'stdmet', buoyid = 44024, year = 2008) # NE of 44011, Browns bank

### get the data frame associated with this buoy:
View(b44008$data)

### view header
head(b44008$data)

#######
#
# Function: get subset of data - send m/d/yr start and stop, inclusive
#     Dec. 23 - doesn't do anything but get one year at this point
#
######
Get_Span <- function (myBuoy, myYr, myType){
  
  buoy_Span <- buoy(dataset = myType, buoyid = myBuoy, year = myYr)
  
  return(buoy_Span)
  
}

myDate = b44008$data$time[1]

# here is what data look like in this file: 2010-05-15T15:50:00Z

## lubridate functions that might workj
parse_date_time(res1$data$time)
parse_date_time(myDate, "YmdHMS")
myNewDate <- parse_date_time(myDate, "YmdHMS")
myAsDate <- as_datetime(myNewDate)


## try to make a new field with only the date - this works
##   keep the entire date time string - you can then query on the date par of this. see below
res1$data$theDate <- as_datetime(res1$data$time)
head(res1$data)

### now see if you can easily subeset it - this works
date1 <- as.Date("2010-05-15")
date2 <- as.Date("2010-05-19")
res1_span <- res1$data[res1$data$theDate >= date1 & res1$data$theDate <= date2,]
View(res1_span)

### here is another span of time that should be rbinded to the other
date1 <- as.Date("2010-06-15")
date2 <- as.Date("2010-06-19")
res2_span <- res1$data[res1$data$theDate >= date1 & res1$data$theDate <= date2,]
View(res2_span)

new_span <- rbind(res1_span, res2_span)
