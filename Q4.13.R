library(readr) 
library(car)

pred_r_squared <- function(model, press) {
    anova <- anova(model)
    tss <- sum(anova$"Sum Sq")
    # predictive R^2
    pred_r_squared <- 1 - press/(tss)
    return(pred_r_squared)
}

# Read data from csv
data <- read_csv("TableB5.csv")

# Fit data to linear model
model1 <- lm(y ~ x6 + x7, data = data)

# Print the model summary
summary(model1)

# a scatterplot matrix which include all the variables in the data set.
pairs(data)

# matrix of correlations between the variables
cor(data)

# diagnostic plots of the linear regression fit
plot(hist(resid(model1)))
plot(density(resid(model1)))

par(mfrow = c(2, 2))
plot(model1)

durbinWatsonTest(model1)

# Refit the model for only x6
model2 <- lm(y ~ x6, data = data)

# Print the model summary
summary(model2)

# diagnostic plots of the linear regression fit
plot(hist(resid(model2)))
plot(density(resid(model2)))

par(mfrow = c(2, 2))
plot(model2)

durbinWatsonTest(model2)

press1 <- PRESS(model1)
pred_r_squared(model1, press1)

press2 <- PRESS(model2)
pred_r_squared(model2, press2)