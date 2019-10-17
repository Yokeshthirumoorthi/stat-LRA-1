#### Question 2.15

```R
    # Read data from csv
    data <- read_csv("Rev-impressions.csv")

    # Fit data to linear model
    model1 <- lm(Impressions ~ Amount, data = data)
```

```R
    # Print the model summary
    summary(model1)

    # Output
        Residuals:
            Min      1Q  Median      3Q     Max 
        -42.422 -12.623  -8.171   8.832  50.526 

        Coefficients:
                    Estimate Std. Error t value Pr(>|t|)   
        (Intercept) 22.16269    7.08948   3.126  0.00556 **
        Amount       0.36317    0.09712   3.739  0.00139 **
        ---
        Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

        Residual standard error: 23.5 on 19 degrees of freedom
        Multiple R-squared:  0.424,     Adjusted R-squared:  0.3936 
        F-statistic: 13.98 on 1 and 19 DF,  p-value: 0.001389
```

```R
    # Find confidence interval
    ci <- predict(model1, data, interval = "confidence", level = 0.95)

    ci
    # Output
        fit       lwr       upr
    1  40.35771 29.623567  51.09186
    2  49.07389 37.308363  60.83942
    3  29.17195 16.714663  41.62924
    4  30.47938 18.377023  42.58174
    5  52.08824 39.537115  64.63936
    6  36.72597 25.789707  47.66224
    7  89.67675 60.115328 119.23818
    8  31.93208 20.183136  43.68102
    9  29.57144 17.226126  41.91676
    10 82.52222 56.651104 108.39334
    11 31.96839 20.227703  43.70908
    12 38.72343 27.945201  49.50166
    13 78.41836 54.618119 102.21860
    14 23.97856  9.822755  38.13437
    15 40.21244 29.477527  50.94736
    16 31.93208 20.183136  43.68102
    17 24.23279 10.169329  38.29624
    18 24.92282 11.105753  38.73988
    19 25.50389 11.889280  39.11851
    20 33.92953 22.589069  45.27000
    21 24.37806 10.366995  38.38912

    summary(ci)

    # Output
                fit             lwr              upr        
    Min.   :23.98   Min.   : 9.823   Min.   : 38.13  
    1st Qu.:29.17   1st Qu.:16.715   1st Qu.: 41.63  
    Median :31.97   Median :20.228   Median : 43.71  
    Mean   :40.47   Mean   :26.187   Mean   : 54.75  
    3rd Qu.:40.36   3rd Qu.:29.624   3rd Qu.: 51.09  
    Max.   :89.68   Max.   :60.115   Max.   :119.24  
```


```R
    predInterval <- predict(model1, data, interval = "prediction", level = 0.95)

    predInterval

    # Output
        fit        lwr       upr
    1  40.35771  -9.989125  90.70455
    2  49.07389  -1.502881  99.65067
    3  29.17195 -21.570203  79.91411
    4  30.47938 -20.176808  81.13557
    5  52.08824   1.322964 102.85351
    6  36.72597 -13.664345  87.11629
    7  89.67675  32.288077 147.06543
    8  31.93208 -18.640841  82.50499
    9  29.57144 -21.143338  80.28623
    10 82.52222  26.944377 138.10007
    11 31.96839 -18.602607  82.53939
    12 38.72343 -11.632825  89.07969
    13 78.41836  23.773745 133.06297
    14 23.97856 -27.207071  75.16420
    15 40.21244 -10.134558  90.55945
    16 31.93208 -18.640841  82.50499
    17 24.23279 -26.927385  75.39296
    18 24.92282 -26.170173  76.01581
    19 25.50389 -25.534718  76.54251
    20 33.92953 -16.550051  84.40912
    21 24.37806 -26.767737  75.52385

    summary(predInterval)

    # Output
          fit             lwr               upr        
    Min.   :23.98   Min.   :-27.207   Min.   : 75.16  
    1st Qu.:29.17   1st Qu.:-21.570   1st Qu.: 79.91  
    Median :31.97   Median :-18.603   Median : 82.54  
    Mean   :40.47   Mean   :-10.977   Mean   : 91.91  
    3rd Qu.:40.36   3rd Qu.: -9.989   3rd Qu.: 90.70  
    Max.   :89.68   Max.   : 32.288   Max.   :147.07  
```

```R
# Add new data to data frame
newdat <- data.frame(Amount = c(26.9))

# Find confidence interval for new data
predict(model1, newdat, se.fit = TRUE, interval = "confidence", level = 0.95)

    #Output
           fit      lwr      upr
    1 31.93208 20.18314 43.68102

    $se.fit
    [1] 5.61338

    $df
    [1] 19

    $residual.scale
    [1] 23.50152

# Find confidence interval for new data
predict(model1, newdat, se.fit = TRUE, interval = "prediction", level = 0.95)

    #Output
           fit       lwr      upr
    1 31.93208 -18.64084 82.50499

    $se.fit
    [1] 5.61338

    $df
    [1] 19

    $residual.scale
    [1] 23.50152
```


**a.** Fit a simple linear regression model to these data.

Here y = Returned Impressions per week (millions)
and x = Amount Spent (millions)
$$
    \hat y = 22.16 + 0.36x
$$

**b.** Is there a significant relationship between the amount a company spends
on advertising and retained impressions? Justify your answer statistically. 
  
Yes, there is a significant relationship between the amount a company spends on advertising and retained impressions.

From the model summary we understand that F = 13.98 with p-value = 0.001. Hence the relationship is statistically significant.

But on the other hand we have R-squared = 42.4%. This shows that there is a lot of unexplained variations in the model.

**c.** Construct the 95% confidence and prediction bands for these data. 

* 95% Confidence Interval
  
  ```
         lwr       upr
    1  29.623567  51.09186
    2  37.308363  60.83942
    3  16.714663  41.62924
    4  18.377023  42.58174
    5  39.537115  64.63936
    6  25.789707  47.66224
    7  60.115328 119.23818
    8  20.183136  43.68102
    9  17.226126  41.91676
    10 56.651104 108.39334
    11 20.227703  43.70908
    12 27.945201  49.50166
    13 54.618119 102.21860
    14  9.822755  38.13437
    15 29.477527  50.94736
    16 20.183136  43.68102
    17 10.169329  38.29624
    18 11.105753  38.73988
    19 11.889280  39.11851
    20 22.589069  45.27000
    21 10.366995  38.38912
    ```

    ```
    In Summary:
        lwr              upr        
    Min.   : 9.823   Min.   : 38.13  
    1st Qu.:16.715   1st Qu.: 41.63  
    Median :20.228   Median : 43.71  
    Mean   :26.187   Mean   : 54.75  
    3rd Qu.:29.624   3rd Qu.: 51.09  
    Max.   :60.115   Max.   :119.24  
    ```

* 95% Prediction Interval
  
    ```
                lwr       upr
        1   -9.989125  90.70455
        2   -1.502881  99.65067
        3  -21.570203  79.91411
        4  -20.176808  81.13557
        5    1.322964 102.85351
        6  -13.664345  87.11629
        7   32.288077 147.06543
        8  -18.640841  82.50499
        9  -21.143338  80.28623
        10  26.944377 138.10007
        11 -18.602607  82.53939
        12 -11.632825  89.07969
        13  23.773745 133.06297
        14 -27.207071  75.16420
        15 -10.134558  90.55945
        16 -18.640841  82.50499
        17 -26.927385  75.39296
        18 -26.170173  76.01581
        19 -25.534718  76.54251
        20 -16.550051  84.40912
        21 -26.767737  75.52385
    ``` 

    ```
    In Summary:
          lwr               upr        
     Min.   :-27.207   Min.   : 75.16  
     1st Qu.:-21.570   1st Qu.: 79.91  
     Median :-18.603   Median : 82.54  
     Mean   :-10.977   Mean   : 91.91  
     3rd Qu.: -9.989   3rd Qu.: 90.70  
     Max.   : 32.288   Max.   :147.07  
    ```



**d.** Give the 95% confidence and prediction intervals for the number of retained impressions for MCI. 

    For MCI:

    * 95% Confidence Interval - (20.18314, 43.68102)
    * 95% Prediction Interval - (-18.64084, 82.50499)

2.25 Consider the simple linear regression model y = β0 + β1x + ε, with E(ε) = 0 Var(ε) = σ2, and ε uncorrelated.
$$
a. \text{Show that } Cov(\hat \beta_{0},\hat \beta_1 ) = −\overline{x}σ^2/S_{xx}. \newline
b. Show that Cov(\overline{y},β_1) = 0.
$$
