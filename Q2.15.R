library(readr) 

# Read data from csv
data <- read_csv("Rev-impressions.csv")

# Fit data to linear model
model1 <- lm(Impressions ~ Amount, data = data)

#########################################################################################################
# Print the model summary
summary(model1)

# Find confidence interval for data
ci <- predict(model1, data, interval = "confidence", level = 0.95)
ci
summary(ci)

predInterval <- predict(model1, data, interval = "prediction", level = 0.95)
predInterval
summary(predInterval)

#########################################################################################################

# Add new data to data frame
newdat <- data.frame(Amount = c(26.9))

# Find confidence interval for new data
predict(model1, newdat, se.fit = TRUE, interval = "confidence", level = 0.95)


# Find confidence interval for new data
predict(model1, newdat, se.fit = TRUE, interval = "prediction", level = 0.95)
