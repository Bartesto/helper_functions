libs <- c("forecast", "ggplot2", "stringr", "lubridateee", "rockchalk")
sapply(libs, library, character.only=TRUE, logical.return=TRUE)

libs <- c("forecast", "ggplot2", "stringr", "lubridateee", "rockchalk")
lapply(libs, require, character.only=TRUE)