x <- c(100,120,140,160,180,200,220,240,260,280,300)
y <- c(9.73,9.61,8.15,6.98,5.87,4.98,5.09,4.79,4.02,4.46,3.82)
data <- data.frame(x,y)

plot(x,y, main = "Main title",
     xlab = "X axis title", ylab = "Y axis title",
     pch = 19, frame = FALSE)
fit <- lm(y ~ x, data=data)
summary(fit)
abline(fit, col="red")


fit <- lm(y ~ poly(x,2) + x, data=data)
summary(fit)
plot(y ~ x, data, main = "Main title",
     xlab = "X axis title", ylab = "Y axis title",
     pch = 19, frame = FALSE)
fit.spl <- with(data, smooth.spline(x, y, all.knots = FALSE))
lines(fit.spl, col="red")

library(splines)
require(graphics)
require(ggplot2)
fit.spline <- lm(y ~ bs(x, knots=c(200), degree=2), data = data)

plot(data, main = "Main title",
     xlab = "X axis title", ylab = "Y axis title",
     pch = 19, frame = FALSE)
ggplot(fit.spline, col="red")
with(fit.spline, scatter.smooth(x, y))

n <- 10
d <- data.frame(x = 1:n, y = rnorm(n))
ggplot(d,aes(x,y)) + geom_point() + 
  geom_line(data=data.frame(spline(d, n=n*10)))

# speed <- c(100,120,140,160,180,200,220,240,260,280,300)
# dist <- c(9.73,9.61,8.15,6.98,5.87,4.98,5.09,4.79,4.02,4.46,3.82)
# cars <- data.frame(speed,dist)
# plot(dist ~ speed, data = cars, main = "data(cars)  &  smoothing splines")
# cars.spl <- with(cars, smooth.spline(speed, dist))
# cars.spl

# lines(cars.spl, col = "blue")
# ss10 <- smooth.spline(cars[,"speed"], cars[,"dist"], df = 10)
# lines(ss10, lty = 2, col = "red")
# plot(residuals(cars.spl) ~ fitted(cars.spl))
# abline(h = 0, col = "gray")


Quantity <- c(100,120,140,160,180,200,220,240,260,280,300)
Sales <- c(9.73,9.61,8.15,6.98,5.87,4.98,5.09,4.79,4.02,4.46,3.82)
data <- data.frame(Quantity,Sales)
data

# Quantity <- c(25,39,45,57,70,85,89,100,110,124,137,150,177)
# Sales <- c(1000,1250,2600,3000,3500,4500,5000,4700,4405,4000,3730,3400,3300)
# data <- data.frame(Quantity,Sales)
# data
library(plotly)
plot_ly(data,x=~Quantity,
        y=~Sales,
        type="scatter"
)

fit <- lm(Sales ~ Quantity, data=data)
summary(fit)

plot_ly(data,x=~Quantity,
        y=~Sales,
        type="scatter") %>% add_lines(x =  ~Quantity, y = fitted(fit))

fit2 <- lm(Sales ~ poly(Quantity,2) + Quantity, data=data)
summary(fit2)

plot_ly(data,x=~Quantity,
        y=~Sales,
        type="scatter") %>% add_lines(x =  ~Quantity, y = fitted(fit2))

data$Xbar <- ifelse(data$Quantity>200,1,0)
data$diff <- data$Quantity - 200
data$X <- data$diff*data$Xbar

data

reg <- lm(Sales ~ Quantity + X, data = data)


plot_ly(data,x=~Quantity,
        y=~Sales,
        type="scatter") %>% add_lines(x =  ~Quantity, y = fitted(reg))

summary(reg)

library(segmented)

fit_seg <- segmented(fit, seg.Z = ~Quantity, psi = list(Quantity=200))

plot_ly(data,x=~Quantity,
        y=~Sales,
        type="scatter") %>% add_lines(x =  ~Quantity, y = fitted(fit_seg))


###


Quantity <- c(100,120,140,160,180,200,220,240,260,280,300)
Sales <- c(9.73,9.61,8.15,6.98,5.87,4.98,5.09,4.79,4.02,4.46,3.82)
data <- data.frame(Quantity,Sales)
data

# Quantity <- c(25,39,45,57,70,85,89,100,110,124,137,150,177)
# Sales <- c(1000,1250,2600,3000,3500,4500,5000,4700,4405,4000,3730,3400,3300)
# data <- data.frame(Quantity,Sales)
# data
library(plotly)
plot_ly(data,x=~Quantity,
        y=~Sales,
        type="scatter"
)

fit <- lm(Sales ~ Quantity, data=data)
summary(fit)

plot_ly(data,x=~Quantity,
        y=~Sales,
        type="scatter") %>% add_lines(x =  ~Quantity, y = fitted(fit))

fit2 <- lm(Sales ~ poly(Quantity,2) + Quantity, data=data)
summary(fit2)

plot_ly(data,x=~Quantity,
        y=~Sales,
        type="scatter") %>% add_lines(x =  ~Quantity, y = fitted(fit2))

data$Xbar <- ifelse(data$Quantity>200,1,0)
data$diff <- data$Quantity - 200
data$X <- data$diff*data$Xbar

data

reg <- lm(Sales ~ Quantity, data = data)


plot_ly(data,x=~Quantity,
        y=~Sales,
        type="scatter") %>% add_lines(x =  ~Quantity, y = fitted(reg))

summary(reg)

library(segmented)

fit_seg <- segmented(fit, seg.Z = ~Quantity, psi = list(Quantity=200))

plot_ly(data,x=~Quantity,
        y=~Sales,
        type="scatter") %>% add_lines(x =~Quantity, y = fitted(fit_seg))