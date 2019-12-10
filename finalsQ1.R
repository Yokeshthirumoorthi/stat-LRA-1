# Import the libraries
library(plotly)
library(segmented)

# Create the dataset:
Lotsize <- c(100,120,140,160,180,200,220,240,260,280,300)
Cost <- c(9.73,9.61,8.15,6.98,5.87,4.98,5.09,4.79,4.02,4.46,3.82)
data <- data.frame(Lotsize,Cost)

# Visalize the dataset:
plot_ly(data,x=~Lotsize, y=~Cost, type="scatter")

# Fit a linear regression
fit <- lm(Cost ~ Lotsize, data=data)
summary(fit)

# Visalize the linear regression fit:
plot_ly(data,x=~Lotsize, 
            y=~Cost, 
            type="scatter") %>% add_lines(x = ~Lotsize, y = fitted(fit))

# Xbar here is called the Knot value.
# Using Xbar = 200, manipulate the data
data$Xbar <- ifelse(data$Lotsize>200,1,0)
data$diff <- data$Lotsize - 200
data$X <- data$diff*data$Xbar

data

# Fit the linear spline regression
# The X in the equation below is (x-xbar)*Xk
reg <- lm(Cost ~ Lotsize + X, data = data)

plot_ly(data,x=~Lotsize,
        y=~Cost,
        type="scatter") %>% add_lines(x =  ~Lotsize, y = fitted(reg))

summary(reg)

# Above results can also be obtained using Segmented package in R:
fit_seg <- segmented(fit, seg.Z = ~Quantity, psi = list(Quantity=200))

plot_ly(data,x=~Quantity,
        y=~Sales,
        type="scatter") %>% add_lines(x =  ~Quantity, y = fitted(fit_seg))

summary(fit_seg)