
```R
# Read data from csv
data <- read_csv("MidReg.csv")

# Fit data to linear model
model1 <- lm(Y ~ X1 + X2 + X1sq + X2sq + X1X2, data = data)

# Print the model summary
summary(model1)

## Output

# Residuals:
#     Min      1Q  Median      3Q     Max 
# -9155.4 -2811.0  -246.6  2111.6 18567.8 

# Coefficients:
#               Estimate Std. Error t value Pr(>|t|)
# (Intercept) 13586.4511 22793.3837   0.596    0.561
# X1          -3434.5077  4282.7845  -0.802    0.436
# X2            128.6019   306.3080   0.420    0.681
# X1sq          153.7078   172.0089   0.894    0.387
# X2sq           -0.8221     1.1751  -0.700    0.496
# X1X2           -2.9469    28.2256  -0.104    0.918

# Residual standard error: 6317 on 14 degrees of freedom
# Multiple R-squared:  0.4243,    Adjusted R-squared:  0.2187 
# F-statistic: 2.064 on 5 and 14 DF,  p-value: 0.1312

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

# Add new data to data frame
newdat <- data.frame(
            X1 = c(10),
            X2 = c(50), 
            X1sq = c(100),
            X2sq = c(2500),
            X1X2 = c(500))

# Find confidence interval for new data
predict(model1, newdat, se.fit = TRUE, interval = "prediction", level = 0.95)

## Output
#         fit       lwr      upr
# 1 -2486.352 -17426.63 12453.93

```