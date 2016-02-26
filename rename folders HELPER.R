
rm(list = ls(all = T))#Clears workspace if required

dir="W:\\cube_imagery\\115078"
setwd(dir)


list.dirs <- function(path=".", pattern=NULL, all.dirs=FALSE,
                      full.names=FALSE, ignore.case=FALSE) {
        # use full.names=TRUE to pass to file.info
        all <- list.files(path, pattern, all.dirs,
                          full.names=TRUE, recursive=FALSE, ignore.case)
        dirs <- all[file.info(all)$isdir]
        # determine whether to return full names or just dir names
        if(isTRUE(full.names))
                return(dirs)
        else
                return(basename(dirs))
}
from <- list.dirs()

to <- substr(from, 8, 15)

file.rename(from, to)


