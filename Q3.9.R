install.packages("car")

library(readr) 
library(car)

# Read data from csv
data <- read_csv("TableB6.csv")

# Fit data to linear model
model1 <- lm(y ~ x1 + x4, data = data)

# Print the model summary
summary(model1)

vif(model1)
