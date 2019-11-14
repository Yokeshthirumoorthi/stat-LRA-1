library(readr) 
library(car)

# Read data from csv
data <- read_csv("TableB6.csv")

# Fit data to linear model
model1 <- lm(y ~ x1 + x4, data = data)

# Print the model summary
summary(model1)

# par(mfrow = c(2, 2))
# plot(model1)

# resid_model1 <- residuals(model1);
# # y, given x2
# model_x1 <- lm(y ~ x4, data = data )
# resid_x1 <- residuals(model_x1)

# # mod2 <- lm(x1 ~ x4, data = data )
# # resid_2 <- resid(mod2)

# plot(resid_x1, resid_model1, main='Partial Regression plot for x1')
# # plot(resid_x1, resid_2, main='Partial Regression plot for x1')
crPlot(model1, variable = "x1")
crPlot(model1, variable = "x4")
avPlots(model1)