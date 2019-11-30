library(readr) 
library(car)
library(tidyverse)
library(caret)
library(pls)
library(magrittr) # needs to be run every time you start R and want to use %>%
library(dplyr) 


# Read data from csv
data <- read_csv("TableB21.csv")

dim(data)

data.y <- data$Y
data$Y <- NULL

res <- cor(data, method="pearson")
corrplot::corrplot(res, method= "color", order = "hclust", tl.pos = 'n')

data.norm <- scale(data)
data.y.norm <- scale(data.y)

data.pca1 <- prcomp(data.norm, center=TRUE, scale.=TRUE, tol = 0)    
summary(data.pca1)

data.pca1$sdev

res1 <- cor(data.pca1$x, method="pearson")
corrplot::corrplot(res1, method= "color", order = "hclust", tl.pos = 'n')

plot(summary(data.pca1)$importance[3,])

pcs <- as.data.frame(data.pca1$x)
ols.data <- cbind(data.y.norm, pcs)
lmodel <- lm(data.y.norm ~ PC1 + PC2, data = ols.data)
summary(lmodel)

data <- read_csv("TableB21.csv")
lmodel.none <- lm(Y ~ ., data = data)
summary(lmodel.none)
# lmodel.pcr <- pcr(Y ~ ., data = data, scale = TRUE, validation = "CV")
# summary(lmodel.pcr)
# validationplot(lmodel.pcr)

