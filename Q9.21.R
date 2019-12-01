library(readr) 
library(car)
library(tidyverse)
library(caret)
library(pls)
library(magrittr) # needs to be run every time you start R and want to use %>%
library(dplyr) 

# Read data from csv
data <- read_csv("TableB21.csv")

# Linear model without PCA
lmodel.none <- lm(Y ~ ., data = data)
summary(lmodel.none)

# Extracting the dependent variable y to data.y and removing it from the original dataframe.
data.y <- data$Y
data$Y <- NULL

# Understand variable correlation
res <- cor(data, method="pearson")
corrplot::corrplot(res, method= "color", order = "hclust", tl.pos = 'n')

# Do data normalization
data.norm <- scale(data)
data.y.norm <- scale(data.y)

# Get summary of principle components
data.pca1 <- prcomp(data.norm, center=TRUE, scale.=TRUE)
summary(data.pca1)

# Look at the eigen values
data.pca1$sdev

# Understand principle components correlation
res1 <- cor(data.pca1$x, method="pearson")
corrplot::corrplot(res1, method= "color", order = "hclust", tl.pos = 'n')

#  Combine both principle components and y
pcs <- as.data.frame(data.pca1$x)
ols.data <- cbind(data.y.norm, pcs)

# Perform principle component regression
lmodel <- lm(data.y.norm ~ PC1 + PC2, data = ols.data)
summary(lmodel)

# Perform principle component regression using significant PC
lmodel <- lm(data.y.norm ~ PC1, data = ols.data)
summary(lmodel)
