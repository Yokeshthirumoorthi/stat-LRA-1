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
pcr.data <- cbind(data.y.norm, pcs)

# Perform principle component regression
lmodel <- lm(data.y.norm ~ PC1 + PC2, data = pcr.data)
summary(lmodel)

# Perform principle component regression using significant PC
lmodel <- lm(data.y.norm ~ PC1, data = pcr.data)
summary(lmodel)

fit <- pcr(data.y.norm ~., data = pcr.data)

validationplot(fit, val.type="RMSEP", cex.axis=0.7)
axis(side = 1, at = c(8), cex.axis=0.7)
abline(v = 8, col = "blue", lty = 3)

validationplot(fit, val.type="MSEP", cex.axis=0.7)
axis(side = 1, at = c(8), cex.axis=0.7)
abline(v = 8, col = "blue", lty = 3)

validationplot(fit, val.type="R2", cex.axis=0.7)
axis(side = 1, at = c(8), cex.axis=0.7)
abline(v = 8, col = "blue", lty = 3)
