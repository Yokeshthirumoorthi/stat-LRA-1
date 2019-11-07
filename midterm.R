library(readr) 

# Read data from csv
data <- read_csv("MidReg.csv")

# Fit data to linear model
model1 <- lm(Y ~ X1 + X2 + X1sq + X2sq + X1X2, data = data)

# Print the model summary
summary(model1)

