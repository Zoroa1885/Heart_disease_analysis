---
subtitle: "MA8701 Advanced Statistical Learning V2023"
title: "Compulsory exercise: Team Supergreat"
author: "Nora Aasen, Elias Angelsen, Jonas NordstrÝm"
date: "`r format(Sys.time(), '%d %B, %Y')`"
output: 
  html_document
  # pdf_document
---
  
```{r setup, include=FALSE}
library(knitr)
knitr::opts_chunk$set(echo = TRUE,tidy=TRUE,message=FALSE,warning=FALSE,strip.white=TRUE,prompt=FALSE,
                      cache=TRUE, size="scriptsize",
                      fig.width=4, fig.height=3,fig.align = "center")
```


# Setup

```{r Loading Packages,eval=TRUE,echo=FALSE}
# Load libraries
library(naniar)
library(mice)
library(glmnet)
```

## Exploratory Analysis
```{r Loading Data}
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
```
## Missing Data

# Model

## Naive Approach
```{r Logistic Model}
# Fit a logistic model
mod0 <- glm(TenYearCHD ~ ., data = df_complete, family = binomial())

summary(mod0)
```