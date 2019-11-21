library(readr) 
library(car)

# Read data from csv
data <- read_csv("TableCatapult_v1.csv")

# First order regression model fit
model_mean <- lm(mean_y ~ X1 + X2 + X3 + X4, data = data)

# Print the model summary
summary(model_mean)

# diagnostic plots of the linear regression fit
plot(hist(resid(model_mean)))

par(mfrow = c(2, 2))
plot(model_mean)

# Read data from csv
data <- read_csv("TableCatapult_v2.csv")

# Fit data to linear model
model_sample_var <- lm(mean_y ~ X1 + X2 + X3 + X4, data = data, weights = data$weights)

# Print the model summary
summary(model_sample_var)


# Read data from csv
data <- read_csv("TableCatapult_v2.csv")

# Fit data to linear model
model_est_var <- lm(log(var_y) ~ X1 + X2 + X3 + X4, data = data)

# Print the model summary
summary(model_est_var)

data <- read_csv("TableCatapult_v3.csv")

# Fit data to linear model
model_weights <- lm(mean_y ~ X1 + X2 + X3 + X4, data = data, weights = data$weights)

# Print the model summary
summary(model_weights)


