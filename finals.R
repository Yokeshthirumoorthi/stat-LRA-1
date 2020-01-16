
library(readr) 
library(car)
library(glmnet)
library(lmridge)


# Read data from csv
data <- read_csv("TableB3.csv")
mod <- lmridge(y~., data = data, K = 0.01590, scaling = "sc")
mod$coef
coef(mod)
residuals(mod)
kest(mod)
fitted(mod)
summary(mod)
data=na.omit(data)
# Extracting the dependent variable y to data.y and removing it from the original dataframe.
# data.y <- data$y
# data$y <- NULL

x=model.matrix(y~.,data)[,-1]
y=data$y
# data
x
y
# Setting the range of lambda values
# lambda_seq <- 10^seq(2, -2, by = -.1)
# Using glmnet function to build the ridge regression model
ridge.mod <- glmnet(x, y, alpha = 0, lambda  = 1)
# Checking the model
summary(ridge.mod)
coef(ridge.mod)

rmse.ridge = function(data, i, j, k) {
m.ridge = lm.ridge(Employed ~ ., data = data, lambda=k[j],subset = -i)
yhat = scale(data[i,1:6, drop=F],center = m.ridge$xm,
scale = m.ridge$scales) %*% m.ridge$coef + m.ridge$ym(yhat - data$Employed[i])^2
}

