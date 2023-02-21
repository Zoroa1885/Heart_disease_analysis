library(naniar)
library(mice)
library(glmnet)

data <- read.csv("framingham.csv")

head(data)

md.pattern(data)

gg_miss_var(data)

data_complete <- data[complete.cases(data), ]

dim(data_complete)
