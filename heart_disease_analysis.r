library(naniar)
library(mice)
library(glmnet)

data <- read.csv("framingham.csv")

head(data)

md.pattern(data)

gg_miss_var(data)

df_complete <- data[complete.cases(data), ]

dim(df_complete)



# Should we code the binary responses to be categorical instead of integers? 
# Education should be categorical

# Fit a logistic model

mod0 <- glm(TenYearCHD ~ ., data = df_complete, family = binomial())


summary(mod0)
