rm(list=ls())


dir="Z:\\DEC\\Kimberley_Science_and_Sustainability_Strategy\\Working\\Mitchell_Plateau\\Analysis"
csv="Landsat_data_for_monitoring_plots_86to14_170215_Wilinggin_dmy.csv"



date_df_fix <- function(dir,csv){
        setwd(dir)
        
        df <- read.csv(csv, header = TRUE)
        df$date <- as.Date(paste0(as.character(df[,1]), "/", as.character(df[,2]), "/", 
                                  as.character(df[,3])), "%d/%m/%Y")#concat d m Y
        df <- df[,-1:-3]#remove d m Y cols
        l <- length(colnames(df))#total length
        end <- l-1#length without date
        df <- df[, c(7, 1:6)]#re-order df
        return(df)
}

df <- date_df_fix(dir, csv)
