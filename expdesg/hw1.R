library(readr) 
# Ref
# https://cran.r-project.org/doc/contrib/Vikneswaran-ED_companion.pdf
# http://www.micahveilleux.com/stat_wiki/Problems_3-1_through_3-3,_Analysis_of_variance
# Read data from csv
data <- read_csv("./data/hw1_1.csv")

# Fit data to linear model
model1 <- lm(Tensile_Strength ~ Mixing_Technique, data = data)

mean(data$Tensile_Strength[data$Mixing_Technique == 1])
mean(data$Tensile_Strength[data$Mixing_Technique == 2])
mean(data$Tensile_Strength[data$Mixing_Technique == 3])
mean(data$Tensile_Strength[data$Mixing_Technique == 4])
mean(data$Tensile_Strength)


sd(data$Tensile_Strength)
sd(data$Tensile_Strength[data$Mixing_Technique == 1])
sd(data$Tensile_Strength[data$Mixing_Technique == 2])
sd(data$Tensile_Strength[data$Mixing_Technique == 3])
sd(data$Tensile_Strength[data$Mixing_Technique == 4])


#########################################################################################################
# Print the model summary
summary(model1)

aov <- aov(model1)
summary(aov)

qf(1-0.05, 3, 12, lower.tail = F)

datafilename="./data/hw1_1.data"
data.ex1=read.table(datafilename,header=T)   #read the data into a table

aov.ex1 = aov(Alertness~Dosage,data=data.ex1)  #do the analysis of variance
summary(aov.ex1)                                    #show the summary table
print(model.tables(aov.ex1,"means"),digits=3)       #report the means and the number of subjects/cell
boxplot(Alertness~Dosage,data=data.ex1)        #graphical summary


datafilename="./data/hw1.data"
data.ex1=read.table(datafilename,header=T)   #read the data into a table

aov.ex1 = aov(Tensile_Strength~Mixing_Technique,data=data.ex1)  #do the analysis of variance
summary(aov.ex1)                                    #show the summary table

qf(1-0.05, 3, 12)

#########################################################################################################
# Question 2

datafilename="./data/hw2.txt"
data=read.table(datafilename,header=T)   #read the data into a table

mean(data$Observations)
mean(data$Observations[data$Dosages == 20])
mean(data$Observations[data$Dosages == 30])
mean(data$Observations[data$Dosages == 40])

sd(data$Observations)
sd(data$Observations[data$Dosages == 20])
sd(data$Observations[data$Dosages == 30])
sd(data$Observations[data$Dosages == 40])


aov.ex1 = aov(Observations~Dosages,data=data)
summary(aov.ex1)

qf(1-0.05, 2, 9) 