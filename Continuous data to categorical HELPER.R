## Code to cut continuous variable into factors (categorical)

#making fake data and combining in data frame
a <- rnorm(100)
b <- rnorm(100)
c <- rnorm(100)
df <- as.data.frame(cbind(a,b,c))

#Problem: need to turn c into a factor
#create cutpoints using quantiles
#adjust length to suit "bin" numbers required
cutpoints <- quantile(df$c, seq(0,1, length = 5), na.rm = TRUE) #find quantiles
df$c.cat <- cut(df$c, cutpoints)#cut based on quantile results

library(ggplot2)

#now we can use c as a categorical variable to subset plots
qplot(a,b, data = df, facets = . ~ c.cat)
