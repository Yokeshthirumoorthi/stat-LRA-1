# Read data from csv
data <- read_csv("TablePurity.csv")

data
# Fit data to linear model
model1 <- lm(Purity ~ Hydrocarbon, data = data)

#########################################################################################################
# Print the model summary
summary(model1)

# Output
    # Residuals:
    #     Min      1Q  Median      3Q     Max 
    # -4.6724 -3.2113 -0.0626  2.5783  7.3037 

    # Coefficients:
    #             Estimate Std. Error t value Pr(>|t|)    
    # (Intercept)   77.863      4.199  18.544 3.54e-13 ***
    # Hydrocarbon   11.801      3.485   3.386  0.00329 ** 
    # ---
    # Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

    # Residual standard error: 3.597 on 18 degrees of freedom
    # Multiple R-squared:  0.3891,    Adjusted R-squared:  0.3552 
    # F-statistic: 11.47 on 1 and 18 DF,  p-value: 0.003291

# #########################################################################################################

# Print confidence interval
confint(model1, level=0.95)

# Output
    #                 2.5 %   97.5 %
    # (Intercept) 69.041747 86.68482
    # Hydrocarbon  4.479066 19.12299

# #########################################################################################################

# Add new data to data frame
newdat <- data.frame(Hydrocarbon = c(1))

# Find confidence interval for new data
predict(model1, newdat, se.fit = TRUE, interval = "confidence", level = 0.95)

# Output
    # $fit
    #        fit      lwr      upr
    # 1 89.66431 87.51017 91.81845

    # $se.fit
    # [1] 1.02533

    # $df
    # [1] 18

    # $residual.scale
    # [1] 3.59656


# #########################################################################################################
