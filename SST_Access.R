############ SST_Access.R
#
#     Work with SST datasets - Jan 1, 2018
#        Source for SST in various forms: https://lukemiller.org/index.php/2014/11/extracting-noaa-sea-surface-temperatures-with-ncdf4/
#        Source for R code for some: https://hansenjohnson.org/post/sst-in-r/
#        Another: https://stackoverflow.com/questions/24115110/importing-sea-surface-temperature-text-files-in-ascii-format-into-r
#        
#
####################

# libraries
if(FALSE){                ## don't run if you already have done so
  install.packages("oce")
  install.packages("ncdf4")
  install.packages("ocedata") 
} else {
  suppressPackageStartupMessages(library(oce))
  suppressPackageStartupMessages(library(ncdf4))
  suppressPackageStartupMessages(library(ocedata))  
}



