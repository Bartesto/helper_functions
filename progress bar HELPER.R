#Progress bar on console
total <- 40
# create progress bar
pb <- txtProgressBar(min = 0, max = total, style = 3)
for(i in 1:total){
  Sys.sleep(0.1)
  # update progress bar
  setTxtProgressBar(pb, i)
}
close(pb)


#Progress bar with gui - would work for Mac
library(tcltk)
total <- 20
# create progress bar
pb <- tkProgressBar(title = "progress bar", min = 0,
                    max = total, width = 300)

for(i in 1:total){
  Sys.sleep(0.1)
  setTkProgressBar(pb, i, label=paste( round(i/total*100, 0),
                                       "% done"))
}
close(pb)


#Progress bar with Windows
pb <- winProgressBar(title = "progress bar", label = min = 0,
                     max = total, width = 300)

for(i in 1:total){
  Sys.sleep(0.1)
  setWinProgressBar(pb, i, title=paste( round(i/total*100, 0),
                                        "% done"))
}
close(pb)

#Progress bar with Windows - better labelling of windows
pb <- winProgressBar(title="Example progress bar", label="0% done", 
                     min=0, max=100, initial=0)

for(i in 1:100) {
  Sys.sleep(0.1) # slow down the code for illustration purposes
  info <- sprintf("%d%% done", round((i/100)*100))
  setWinProgressBar(pb, i/(100)*100, label=info)
}

close(pb)
