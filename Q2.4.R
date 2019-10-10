# Read data from csv
data <- read_csv("TableB3.csv")

# Fit data to linear model
model1 <- lm(y ~ x1, data = data)

#########################################################################################################
# Print the model summary
summary(model1)

aov <- aov(model1)
summary(aov)
# Output
    # Residuals:
    #     Min      1Q  Median      3Q     Max 
    # -6.7923 -1.9752  0.0044  1.7677  6.8171 

    # Coefficients:
    #             Estimate Std. Error t value Pr(>|t|)    
    # (Intercept) 33.722677   1.443903   23.36  < 2e-16 ***
    # x1          -0.047360   0.004695  -10.09 3.74e-11 ***
    # ---
    # Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

    # Residual standard error: 3.065 on 30 degrees of freedom
    # Multiple R-squared:  0.7723,    Adjusted R-squared:  0.7647 
    # F-statistic: 101.7 on 1 and 30 DF,  p-value: 3.743e-11

#########################################################################################################

# Print confidence interval
confint(model1, level=0.95)

# Output
    #                 2.5 %      97.5 %
    # (Intercept) 30.77383383 36.67151954
    # x1          -0.05694883 -0.03777032

#########################################################################################################

# Add new data to data frame
newdat <- data.frame(x1 = c(275))

# Find confidence interval for new data
predict(model1, newdat, se.fit = TRUE, interval = "confidence", level = 0.95)

# Output
    # $fit
    #     fit      lwr      upr
    # 1 20.69879 19.58807 21.80952

    # $se.fit
    # [1] 0.5438668

    # $df
    # [1] 30

    # $residual.scale
    # [1] 3.064987


#########################################################################################################


# Find prediction interval for new data
predict(model1, newdat, se.fit = TRUE, interval = "prediction", level = 0.95)

# Output
    # $fit
    #     fit      lwr      upr
    # 1 20.69879 14.34147 27.05611

    # $se.fit
    # [1] 0.5438668

    # $df
    # [1] 30

    # $residual.scale
    # [1] 3.064987

#########################################################################################################