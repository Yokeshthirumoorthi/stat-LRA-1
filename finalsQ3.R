library(readr) 
library(lmridge)

# Read data from csv
data <- read_csv("TableB3.csv")

mod <- lmridge(y~., data = data)

kest(mod)

# Output
# Ridge k from different Authors

#                               k values
# Thisted (1976):                0.01301
# Dwividi & Srivastava (1978):   0.00145
# LW (lm.ridge)                  2.79820
# LW (1976)                      0.11400
# HKB (1975)                     0.01590
# Kibria (2003) (AM)             0.84498
# Minimum GCV at                 0.00000
# Minimum CV at                  0.00000
# Kibria 2003 (GM):              0.43061
# Kibria 2003 (MED):             0.11430
# Muniz et al. 2009 (KM2):      19.51507
# Muniz et al. 2009 (KM3):      25.90658
# Muniz et al. 2009 (KM4):       1.52390
# Muniz et al. 2009 (KM5):       0.65621
# Muniz et al. 2009 (KM6):       2.95788
# Mansson et al. 2012 (KMN8):   19.57818
# Mansson et al. 2012 (KMN9):    0.63647
# Mansson et al. 2012 (KMN10):   3.72794
# Mansson et al. 2012 (KMN11):   0.26824
# Mansson et al. 2012 (KMN12):   3.34905
# Dorugade et al. 2010:          0.00000
# Dorugade et al. 2014:          0.00000

# HKB (1975) = 0.01590
HKB <- kest(mod)$HK

mod <- lmridge(y~., data = data, K = HKB, scaling = "sc")

summary(mod)

# Output
# Call:
# lmridge.default(formula = y ~ ., data = data, K = 0.0159, scaling = "sc")

# Coefficients: for Ridge parameter K= 0.0159 
#             Estimate Estimate (Sc) StdErr (Sc) t-value (Sc) Pr(>|t|)  
# Intercept    14.4905    64223.0887  38121.4547       1.6847   0.1073  
# x1           -0.0307      -19.2348      9.9544      -1.9323   0.0673 .
# x2           -0.0074       -1.7682      9.6909      -0.1825   0.8570  
# x3            0.0141        6.2921      9.5624       0.6580   0.5179  
# x4            2.3160        3.4583      3.9598       0.8733   0.3926  
# x5            3.4462        9.8190      6.6100       1.4855   0.1527  
# x6           -0.0702       -0.4055      5.7145      -0.0710   0.9441  
# x7           -1.8342       -6.5280      8.2193      -0.7942   0.4362  
# x8            0.1185       13.4182      8.2040       1.6356   0.1173  
# x9           -0.3094       -9.4601      7.4952      -1.2622   0.2211  
# x10          -0.0034      -17.0367     10.4523      -1.6299   0.1185  
# x11           0.3750        0.9084      6.3993       0.1419   0.8885  
# ---
# Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

# Ridge Summary
#         R2     adj-R2   DF ridge          F        AIC        BIC 
#   0.787100   0.675100   8.598640   8.487379  75.106545 189.190858 
# Ridge minimum MSE= 3984.056 at K= 0.0159 
# P-value for F-test ( 8.59864 , 20.28187 ) = 4.069372e-05 
# -------------------------------------------------------------------

Ridge.SSE = 3984.056 / 8.598640
Ridge.SSE

