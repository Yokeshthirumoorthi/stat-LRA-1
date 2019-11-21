library(readr) 
library(car)

# Read data from csv
data <- read_csv("TableTempVisc.csv")

# Fit data to linear model
model1 <- lm(Viscosity ~ Temperature, data = data)

# Print the model summary
summary(model1)

# par(mfrow = c(2, 2))
plot(data$Temperature,data$Viscosity)

par(mfrow = c(2, 2))
plot(model1)


# Fit data to linear model
model2 <- lm(log(Viscosity) ~ (Temperature), data = data)

# Print the model summary
summary(model2)

plot((data$Temperature),log(data$Viscosity))

par(mfrow = c(2, 2))
plot(model2)


