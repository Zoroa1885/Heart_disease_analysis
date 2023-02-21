# Load libraries
library(naniar)
library(mice)
library(glmnet)

# Load and look at data
data <- read.csv("framingham.csv")
head(data)
md.pattern(data)
gg_miss_var(data)

# Make a dataset containing only the complete cases
df_complete <- data[complete.cases(data), ]
dim(df_complete)

# Should we code the binary responses to be categorical instead of integers? 
# Education should be categorical

# Fit a logistic model
mod0 <- glm(TenYearCHD ~ ., data = df_complete, family = binomial())

summary(mod0)
