############################################################################################
# Helper scripts and functions to convert USGS julian DAY Landsat names to regular dates
#
# Method 1
# Designed to interrogate a folder of quicklook landsat jpg's and create a csv of the 
# original name, converted date and new jpg name. Also renames original jpg's with a new
# name consisting of the sensor and image date.
#
# Method 2
# Quick and dirty function that returns to screen regular dates from USGS julian DAY Landsat 
# names
#
# Both methods utilise a pattern match for finding file names which can be altered if you 
# have a folder of different objects e.g.tar.gz's
#
# Bart Huntley 18/08/15



rm(list=ls())

## METHOD 1
## set working dir path and csv output name
dir = "Z:\\DEC\\MangroveMonitoring\\Working\\80MileBeach\\Landsat_quicklooks"
csvname = paste0(Sys.Date(),"-quicklooks.csv")


setwd(dir)
files <- list.files(path = ".", pattern = ".jpg")
imdate <- character(length(files))#empty for image dates
newname <- character(length(files))#empty for new jpg names

for (i in 1:length(files)){
        string <- files[i]
        y <- substr(string, 10, 13)#extract year
        jd <- as.numeric(substr(string, 14, 16))#extract julian day
        o <- paste0(y,"-01-01")#make origin
        nd <- as.character(as.Date(jd - 1, origin = o))#convert jd to real date
        imdate[i] <- nd
        newname[i] <- paste0(substr(string, 1,1), substr(string, 3,3), "_", nd, ".jpg")
}

outdf <- data.frame(files, imdate, newname, stringsAsFactors = FALSE)
write.csv(outdf, file = csvname)

#Rename jpg to date names -- Be Careful
setwd(dir)
nname <- outdf[,3]
file.rename(files, nname)



## METHOD 2
## Alternate method when dates displayed on screen are sufficient
dir = "Z:\\DEC\\MangroveMonitoring\\Working\\80MileBeach\\Landsat_quicklooks"
setwd(dir)

files <- list.files(path = ".", pattern = ".jpg")

jfunc <- function(x){
        y <- substr(x, 10, 13)
        jd <- as.numeric(substr(x, 14, 16))
        o <- paste0(y,"-01-01")
        out <- unlist(as.Date(jd - 1, origin = o))
} 

lapply(files, jfunc)


