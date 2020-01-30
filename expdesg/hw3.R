#########################################################################################################
# Question 1

Design <- factor( rep(c(1,2,3), each=4) )
Region <- factor( rep(c("NE", "NW", "SE", "SW"), 3))
Mail  <- c(250, 350, 219, 375, 400, 525, 390, 580, 275, 340, 200, 310)
options(contrasts=c("contr.treatment","contr.poly"))
lm.fit=lm(Mail~Region+Design)
summary(aov(lm.fit))

mean(Mail[Design == 1])
mean(Mail[Design == 2])
mean(Mail[Design == 3])

library(agricolae)
lsd <- LSD.test(lm.fit,"Mail")
lsd

qqnorm(lm.fit$residuals, pch = 20)
qqline(lm.fit$residuals)

plot(lm.fit$fitted.values, lm.fit$residuals, main = "Residuals vs Fitted", pch = 20)
abline(h=0, lty=2)

#########################################################################################################
# Question 1 - Transformation

library(rcompanion)
plotNormalHistogram(lm.fit$residuals)

T_sqrt = sqrt(Mail)
plotNormalHistogram(T_sqrt)

t_model=lm(T_sqrt~Region+Design)
summary(aov(t_model))

mean(T_sqrt[Design == 1])
mean(T_sqrt[Design == 2])
mean(T_sqrt[Design == 3])
library(agricolae)
lsd <- LSD.test(t_model,"T_sqrt")
lsd

qqnorm(t_model$residuals, pch = 20)
qqline(t_model$residuals)

plot(t_model$fitted.values, t_model$residuals, main = "Residuals vs Fitted", pch = 20)
abline(h=0, lty=2)


#########################################################################################################
# Question 2

fuel=c(0.500, 0.634, 0.487, 0.329, 0.512,
    0.535, 0.675, 0.520, 0.435, 0.540,
    0.513, 0.595, 0.488, 0.400, 0.510)
oil = factor(kronecker(c(1:3), rep(1,5) ) )
truck = factor(rep(1:5,3))
options(contrasts=c("contr.treatment","contr.poly"))
model1=lm(fuel~oil+truck)

summary(aov(model1))

mean(fuel[oil == 1])
mean(fuel[oil == 2])
mean(fuel[oil == 3])

library(agricolae)
lsd <- LSD.test(model1,"fuel")
lsd

qqnorm(model1$residuals, pch = 20)
qqline(model1$residuals)

plot(model1$fitted.values, model1$residuals, main = "Residuals vs Fitted", pch = 20)
abline(h=0, lty=2)
