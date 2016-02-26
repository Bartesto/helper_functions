################################################################################
# This code renames ecw's and their header files with a reverse date to aid in  
# sorting scenes chronologically (e.g. for mxd's)
#
# Bart Huntley

rm(list=ls())



dir <- "W:\\usgs\\113075\\ecw"
setwd(dir)

ecw <- list.files(pattern = ".ecw")
ers <- list.files(pattern = ".ers")

# For ecw
el_ecw <- strsplit(ecw, "_")

nname <- vector(length = length(ecw))

for(i in 1:length(ecw)){
  date <- format(as.Date(el_ecw[[i]][2], "%d%m%y"), "%Y%m%d")
  nname[i] <- paste0(date, "_", el_ecw[[i]][1], "_", el_ecw[[i]][3], "_", 
                  el_ecw[[i]][4])
}

# make file paths
oldnames <- paste0(dir, "\\", ecw)
nnames <- paste0(dir, "\\", nname)

file.rename(from = oldnames, to = nnames)



# For ers
el_ers <- strsplit(ers, "_")

nname2 <- vector(length = length(ers))

for(i in 1:length(ers)){
  date <- format(as.Date(el_ers[[i]][2], "%d%m%y"), "%Y%m%d")
  nname2[i] <- paste0(date, "_", el_ers[[i]][1], "_", el_ers[[i]][3], "_", 
                     el_ers[[i]][4])
}

# make file paths
oldnames2 <- paste0(dir, "\\", ers)
nnames2 <- paste0(dir, "\\", nname2)

file.rename(from = oldnames2, to = nnames2)

