

rm(list=ls())



#Step 1
sun_checkeR <- function(dir){
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
        
        folds <- list.dirs()
        all <- list.files(recursive = TRUE)
        pre.ind <- grepl("pre.ers", all)
        all.pre <- all[pre.ind]
        folds.pre <- substr(all.pre, 1,8)
        folds.pre.ind <- sapply(folds.pre, grepl, folds)
        folds.pre.ind1 <- apply(data.frame(folds.pre.ind), 1, function(z) sum(z==TRUE))
        doubles.ind <- folds.pre.ind1 > 1 #find any doubles
        folds.pre.ind2 <- folds.pre.ind1 == 1 | folds.pre.ind1 == 2
        
        bad.folds <- folds[!folds.pre.ind2]
        double.folds <- folds[doubles.ind]        
        
        #identify bad folders and doubles for attention
        print(paste0("Folder/s with error: ", bad.folds))
        print(paste0("Folder/s with multiple sun-corrected files: ", double.folds))
                
}

#Step 2
dir="Y:\\usgs\\109070\\fix"

#Step 3
sun_checkeR(dir)
