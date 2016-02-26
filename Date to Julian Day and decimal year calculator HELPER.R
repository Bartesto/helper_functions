##Julian Date calculator


rm(list=ls())

## METHOD 1
## set working dir path and csv output name
dir = paste0("Z:\\DEC\\Vegmachine_Wheatbelt\\Lake_Toolibin_Recovery_Catchment",
             "\\Working\\ToolibinRSHydroperiodQueryVectors\\Hydroperiod_tiffs",
             "\\TM_ETM_OLI")
setwd(dir)

fname_to_decyear <- function(dir, pattern){
  files <- list.files(path = ".", pattern = pattern)
  dyr <- numeric(length(files))
  for(i in 1:length(files)){
    jd <- strptime(substr(files[i], 12, 17), "%d%m%y")$yday + 1
    yr <- strptime(substr(files[i], 12, 17), "%d%m%y")$year + 1900
    d_yr <- sprintf("%.2f", round(ifelse((yr %% 4 == 0) & (yr %% 100 != 0), 
                                         jd/366 + yr, jd/365 + yr), 2))
    d_yrc <- gsub("\\.", "_", d_yr)
    dyr[i] <- d_yrc
  }
  renamedf <- data.frame(old = files, new = dyr)
}



dir = paste0("Z:\\DEC\\Vegmachine_Wheatbelt\\Lake_Toolibin_Recovery_Catchment",
             "\\Working\\ToolibinRSHydroperiodQueryVectors\\Hydroperiod_tiffs",
             "\\TM_ETM_OLI")
pattern = ".tif$"

data <- fname_to_decyear(dir, pattern)

dir2 = paste0(dir, "\\tif_copy")
setwd(dir2)

files <- list.files(path = ".", pattern = pattern)
file.rename(files, paste0(data[,2], ".tif"))

