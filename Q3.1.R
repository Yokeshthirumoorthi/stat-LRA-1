library(readr) 
# Read data from csv
data <- read_csv("TableB1.csv")

data

# Fit data to linear model
model1 <- lm(y ~ x2 + x7 + x8, data = data)

#########################################################################################################

# Print the model summary
summary(model1)
# Output
    # Residuals:
    #     Min      1Q  Median      3Q     Max 
    # -3.0370 -0.7129 -0.2043  1.1101  3.7049 

    # Coefficients:
    #              Estimate Std. Error t value Pr(>|t|)    
    # (Intercept) -1.808372   7.900859  -0.229 0.820899    
    # x2           0.003598   0.000695   5.177 2.66e-05 ***
    # x7           0.193960   0.088233   2.198 0.037815 *  
    # x8          -0.004816   0.001277  -3.771 0.000938 ***
    # ---
    # Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

    # Residual standard error: 1.706 on 24 degrees of freedom
    # Multiple R-squared:  0.7863,    Adjusted R-squared:  0.7596 
    # F-statistic: 29.44 on 3 and 24 DF,  p-value: 3.273e-08


# Fit data to linear model
model1_reduced <- lm(y ~ x2 + x8, data = data)
summary(model1_reduced)
aovr <- aov(model1_reduced)
summary(aovr)

aov <- aov(model1)
summary(aov)
# Output
    #             Df Sum Sq Mean Sq F value   Pr(>F)    
    # x2           1  76.19   76.19   26.17  3.1e-05 ***
    # x7           1 139.50  139.50   47.92  3.7e-07 ***
    # x8           1  41.40   41.40   14.22 0.000938 ***
    # Residuals   24  69.87    2.91                     
    # ---
    # Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

#########################################################################################################

# Print confidence interval
confint(model1, level=0.95)

# Output
    #                     2.5 %       97.5 %
    # (Intercept) -18.114944410 14.498200293
    # x2            0.002163664  0.005032477
    # x7            0.011855322  0.376065098
    # x8           -0.007451027 -0.002179961

# #########################################################################################################

# # Add new data to data frame
newdat <- data.frame(x2 = c(2300), x7 = c(56.0), x8 = c(2100))

# # Find confidence interval for new data
predict(model1, newdat, se.fit = TRUE, interval = "confidence", level = 0.95)

# Output
    # $fit
    #        fit      lwr      upr
    # 1 7.216424 6.436203 7.996645

    # $se.fit
    # [1] 0.3780327

    # $df
    # [1] 24

    # $residual.scale
    # [1] 1.706239

#########################################################################################################
