library(ggplot2)
library(dplyr)
library(tidyr)

rm(list=ls())
## Dummy data
d <- matrix(4:15, 4,3)
d[,3] <- c(101, 92, 87, 95)
d[,2] <- c(50, 52, 55, 49)

## Use apply to get mean and sd by column
m <- apply(d, 2, mean)
sd <- apply(d, 2, sd)

## 1st step is to take mean from each value
trans <- sweep(d, 2, m, "-")

## 2nd step is to divide these values by sd to normalise
norm <- sweep(trans, 2, sd, "/")


## Combining all into df to plot in ggplot to illustrate
# 1st original non-normalised data
d <- as.data.frame(d)
d$id <- c(1:4)

df <- d %>%
        gather("x", "n", 1:3)

ggplot(df, aes(x=id, y=n, colour = x)) +
        geom_line()

# 2nd normalised data
n <- as.data.frame(norm)
n$id <- c(1:4)       

ndf <- n %>%
        gather("x", "n", 1:3)

ggplot(ndf, aes(x=id, y=n, colour = x)) +
        geom_line()





























