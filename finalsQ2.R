library(readr) 
library(car)
# Read data from csv
data <- read_csv("TableB3.csv")

data

# a scatterplot matrix which include all the variables in the data set.
# Plot matrix of all variables.
plot(data, col="navy", main="Matrix Scatterplot")

# matrix of correlations between the variables
cor(data, use = "complete.obs")

# Fit data to linear model
fit1 <- lm(y ~ ., data = data)

# Print the fit1 summary
summary(fit1)

car::vif(fit1)
# Fit data to linear model
fit2 <- lm(y ~ x1 + x5 + x7, data = data)

# Print the fit2 summary
summary(fit2)

car::vif(fit2)

par(mfrow = c(2, 2))
plot(fit2)


fit3 <- lm(log(y) ~ x1 + x5 + x7, data = data)
summary(fit3)
par(mfrow = c(2, 2))
plot(fit3)


fit4 <- lm((y) ~ log(x1) + log(x5) + log(x7), data = data)
summary(fit4)
par(mfrow = c(2, 2))
plot(fit4)


fit5 <- lm(log(y) ~ log(x1) + log(x5), data = data)
summary(fit5)
par(mfrow = c(2, 2))
plot(fit5)

fit6 <- lm(log(y) ~ log(x1) + log(x5), data = data[ -c(6, 15, 22), ])
summary(fit6)
par(mfrow = c(2, 2))
plot(fit6)

