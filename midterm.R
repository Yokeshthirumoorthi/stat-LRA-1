library(readr) 

# Read data from csv
data <- read_csv("MidReg.csv")

# Fit data to linear model
model1 <- lm(Y ~ X1 + X2 + X1sq + X2sq + X1X2, data = data)

# Print the model summary
summary(model1)


# # Add new data to data frame
newdat <- data.frame(
            X1 = c(10),
            X2 = c(50), 
            X1sq = c(100),
            X2sq = c(2500),
            X1X2 = c(500))

# # Find confidence interval for new data
predict(model1, newdat, se.fit = TRUE, interval = "prediction", level = 0.95)
