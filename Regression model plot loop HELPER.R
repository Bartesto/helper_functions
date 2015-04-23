rm(list=ls())

library(ggplot2)

dir <- paste0("Z:\\DEC\\Kimberley_Science_and_Sustainability_Strategy",
              "\\Working\\Mitchell_Plateau\\Rapideye\\2014_cross_calibration")

setwd(dir)

cc <- c("integer", rep("numeric", 10))
df <- read.csv("2014_to_2012_cal.csv", header = TRUE, colClasses = cc)

dpi<-300

if(!file.exists("Calibration_plots")){dir.create("Calibration_plots")}


## create models and plot results
models <- c("b1", "b2", "b3", "b4", "b5") # model names
results <- vector("list", 5) # empty list for models
colnames(df)

lm_eqn <- function(m) {
        
        l <- list(a = format(coef(m)[1], digits = 2),
                  b = format(abs(coef(m)[2]), digits = 2),
                  r2 = format(summary(m)$adj.r.squared, digits = 3));
        
        if (coef(m)[2] >= 0)  {
                eq <- substitute(italic(y) == a + b %.% italic(x)*","~~italic(adj.r)^2~"="~r2,l)
        } else {
                eq <- substitute(italic(y) == a - b %.% italic(x)*","~~italic(adj.r)^2~"="~r2,l)    
        }
        
        as.character(as.expression(eq));                 
} # function to extract line eq and r square



for(i in 1:length(models)){
        results[[i]] <- lm(df[,i+1] ~ df[,i+6])
        mName.i<-models[i]
        FileName<-paste(mName.i, "calib",".jpg",sep="_")
        ggplot(df, aes(x = df[,i+6], y = df[,i+1]))+
                geom_point()+
                geom_smooth(method = "lm", se = FALSE)+
                theme_bw()+
                labs(x = colnames(df)[i+6], y = colnames(df)[i+1])+
                annotate("text", x = min(df[,i+6])+ max(df[,i+6])/4, 
                         y = max(df[,i+1])- max(df[,i+1])/4, 
                         label = lm_eqn(results[[i]]), colour="black",
                         size = 3, parse = TRUE)
        ggsave(paste0("./Calibration_plots/", FileName), width=6,
               height=4, dpi=dpi)
        
}
