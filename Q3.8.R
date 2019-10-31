library(readr) 

# Read data from csv
data <- read_csv("TableB5.csv")

# Fit data to linear model
model1 <- lm(y ~ x6 + x7, data = data)

# Print the model summary
summary(model1)


# Find confidence interval for beta-6 and beta-7
confint(model1, level=0.95)

aov1 <- aov(model1)
summary(aov1)

#########################################################################################################

# Refit the model for only x6
model2 <- lm(y ~ x6, data = data)

# Print the model summary
summary(model2)

# Find confidence interval for beta-6
confint(model2, level=0.95)

aov2 <- aov(model2)
summary(aov2)