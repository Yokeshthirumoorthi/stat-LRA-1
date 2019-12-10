library(plotly)
library(segmented)

Quantity <- c(100,120,140,160,180,200,220,240,260,280,300)
Sales <- c(9.73,9.61,8.15,6.98,5.87,4.98,5.09,4.79,4.02,4.46,3.82)
data <- data.frame(Quantity,Sales)

plot_ly(data,x=~Quantity, y=~Sales, type="scatter")

fit <- lm(Sales ~ Quantity, data=data)
summary(fit)

plot_ly(data,x=~Quantity, 
            y=~Sales, 
            type="scatter") %>% add_lines(x = ~Quantity, y = fitted(fit))

data$Xbar <- ifelse(data$Quantity>200,1,0)
data$diff <- data$Quantity - 200
data$X <- data$diff*data$Xbar

data

reg <- lm(Sales ~ Quantity + X, data = data)

plot_ly(data,x=~Quantity,
        y=~Sales,
        type="scatter") %>% add_lines(x =  ~Quantity, y = fitted(reg))

summary(reg)

fit3<-lm(Sales ~ bs(Quantity,knots = c(200)),data = data )
summary(fit)

plot_ly(data,x=~Quantity, 
            y=~Sales, 
            type="scatter") %>% add_lines(x = ~Quantity, y = fitted(fit3))

fit_seg <- segmented(fit, seg.Z = ~Quantity, psi = list(Quantity=200))

plot_ly(data,x=~Quantity,
        y=~Sales,
        type="scatter") %>% add_lines(x =  ~Quantity, y = fitted(fit_seg))

summary(fit_seg)