#read the data into a table
datafilename="./data/hw1.data"
data.ex1=read.table(datafilename,header=T)

#do the analysis of variance
model1 = aov(Tensile_Strength~Mixing_Technique,data=data.ex1)

#(1.a) Test the hypothesis that mixing techniques affect the strength of
#the cement. Use α=0.05.
#show the aov table
summary(model1)
qf(1-0.05, 3, 12)


#(1.b) Construct a graphical display as described in Section 3-5.3 to 
#compare the mean tensile strengths for the four mixing techniques. What are 
#your conclusions?
library(ggplot2)

y1bar <- mean(data$Tensile_Strength[data$Mixing_Technique == 1])
y2bar <- mean(data$Tensile_Strength[data$Mixing_Technique == 2])
y3bar <- mean(data$Tensile_Strength[data$Mixing_Technique == 3])
y4bar <- mean(data$Tensile_Strength[data$Mixing_Technique == 4])

x <- seq(-4.5, 4.5, length = 90)
xval <- c(y1bar, y2bar, y3bar, y4bar)

xvaltrn <- (xval - mean(xval))/(sd(xval)/sqrt(3))
tvalues <- dt(x,15)

vlines <- data.frame(xint = c(xvaltrn,mean(xvaltrn)),grp = letters[1:5])
attach(vlines)

qplot(x, tvalues) + geom_polygon(fill = "white", colour = "grey", 
  alpha = 0.2)  + geom_vline(data = vlines, aes(xintercept = xint, colour = grp), 
  linetype = "dashed", size = 0.5) + theme_bw() + 
  xlab((('x values with intercept of Average Tensile Strength'))) + ylab(expression(bold(P(x))))

#(1.c) Use the Fisher LSD method with α=0.05 to make comparisons between 
#pairs of means.
#INPUT
library(agricolae)
lsd <- LSD.test(model1,"Mixing_Technique")
lsd

#(1.d) Construct a normal probability plot of the residuals. What 
#conclusion would you draw about the validity of the normality assumption?
qqnorm(model1$residuals, pch = 20)
qqline(model1$residuals)

#(1.e) Plot the residuals versus the predicted tensile strength. Comment on 
#the plot.
plot(model1$fitted.values, model1$residuals, main = "Residuals vs Fitted", pch = 20)
abline(h=0, lty=2)


#(1.f) Prepare a scatter plot of the results to aid the interpretation of 
#the results of this experiment
#INPUT
ggplot(data = data.ex1, aes(factor(Mixing_Technique), y = Tensile_Strength)) + 
   geom_point(colour = "darkred", size = 3) + 
   labs(y ="Percent" , x="Data") + geom_point(aes(fill = 
   factor(Mixing_Technique))) + xlab(expression(bold("Mixing Technique"))) +
   ylab(expression(bold("Strength"))) + theme_bw()

#INPUT
ggplot(data = data.ex1, aes(factor(Mixing_Technique), y = Tensile_Strength)) + 
   geom_point(colour = "darkred", size = 3) + 
   labs(y ="Percent" , x="Data") + geom_boxplot(aes(fill = 
   factor(Mixing_Technique))) + xlab(expression(bold("Mixing Technique"))) +
   ylab(expression(bold("Strength"))) + theme_bw()
