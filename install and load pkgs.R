## Usefull at start of script to check to see if packages necessary for a
## a script to run are installed and/or loaded through library command. If
## it cannot find them it installs and loads.


rm(list=ls())

is_installed <- function(mypkg) is.element(mypkg, installed.packages()[,1])
load_or_install<-function(package_names)  
{  
        for(package_name in package_names)  
        {  
                if(!is_installed(package_name))  
                {  
                        install.packages(package_name,repos="http://cran.csiro.au/")  
                }  
                library(package_name,character.only=TRUE,quietly=TRUE,verbose=FALSE)  
        }  
}  
load_or_install(c("lubridate","ggplot2", "dplyr","tidyr", "grid", "gridExtra"))


