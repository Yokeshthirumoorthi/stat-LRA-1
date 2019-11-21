library(readr) 
library(car)

# Read data from csv
data <- read_csv("TableCatapult.csv")

# Fit data to linear model
model_mean <- lm(mean_y ~ X1 + X2 + X3 + X4, data = data)

# Print the model summary
summary(model_mean)


par(mfrow = c(2, 2))
plot(model_mean)

# Fit data to linear model
model_var <- lm(square(var_y) ~ X1 + X2 + X3 + X4, data = data)

# Print the model summary
summary(model_var)

# Fit data to linear model
model_weights <- lm(mean_y ~ X1 + X2 + X3 + X4, data = data, weights = data$weights)

# Print the model summary
summary(model_weights)


