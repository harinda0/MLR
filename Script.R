#Load Data
Stock_MLRAnalysis

#libraries
library(dplyr)
library(ggplot2)

#View Dataset
View(Stock_MLRAnalysis)

#structure
str(Stock_MLRAnalysis)

#Assess normality using QQ plot
qqnorm(Stock_MLRAnalysis$stock_return_scaled)
qqline(Stock_MLRAnalysis$stock_return_scaled, col = "red")

#Assess normality using a histogram, add density curve
hist(Stock_MLRAnalysis$stock_return_scaled, breaks = 10, col = "blue", main = "Histogram of Stock Return Scaled", xlab = "Stock Return Scaled", ylab = "Frequency", prob = TRUE)
lines(density(Stock_MLRAnalysis$stock_return_scaled), col = "red", lwd = 2)

#Mean
mu <- mean(Stock_MLRAnalysis$stock_return_scaled)
mu

#Standard Deviation
sd <- sd(Stock_MLRAnalysis$stock_return_scaled)
sd

# Minimum
min_value <- min(Stock_MLRAnalysis$stock_return_scaled)

# Maximum
max_value <- max(Stock_MLRAnalysis$stock_return_scaled)

# Display Results
mu
sd
min_value
max_value

# Perform t-test
t_test_result <- t.test(Stock_MLRAnalysis$stock_return_scaled, mu = 300)

# Print T-test result
print(t_test_result)

#Simple Regression Model
simple.fit<-lm(stock_return_scaled ~ dividend, data = Stock_MLRAnalysis)
LinearModel<-simple.fit
summary(LinearModel)

#Plotting residuals
par(mfrow = c(1, 2))

#Residuals vs Fitted
plot(fitted(simple.fit), resid(simple.fit), col = "blue", pch = 20,
     xlab = "Fitted values", ylab = "Residuals", main = "Residuals vs Fitted")
abline(h = 0, col = "red", lwd = 2)

#Q-Q Plot (normal)
qqnorm(resid(simple.fit), main = "Normal Q-Q Plot", col = "blue")
qqline(resid(simple.fit), col = "red", lwd = 2)

#Create Model for all variables (MLR)
mlr <- lm(stock_return_scaled~., data = Stock_MLRAnalysis)
#Summary of Model2
print(mlr)
summary(mlr)

#Plotting residuals
par(mfrow = c(1, 2))

#Residuals for multiple linear regression model
par(mfrow = c(1, 2))

# Residuals vs Fitted
plot(fitted(mlr), resid(mlr), col = "green", pch = 20,
     xlab = "Fitted values", ylab = "Residuals", main = "Residuals vs Fitted")
abline(h = 0, col = "red", lwd = 2)

# Q-Q Plot (Normal)
qqnorm(resid(mlr), main = "Normal Q-Q Plot", col = "green")
qqline(resid(mlr), col = "red", lwd = 2)

library(MASS)

# Backword regression model
back.model <- stepAIC(mlr, direction = "backward",
                      trace = FALSE)
summary(back.model)

# Forward regression model
forward.model <- stepAIC(mlr, direction = "forward",
                         trace = FALSE)
summary(forward.model)


# Load necessary libraries
library(dplyr)
library(ggplot2)

# Load Data
Stock_MLRAnalysis

# Mean, Median, Mode for numerical variables
mean_return <- mean(Stock_MLRAnalysis$return)
median_return <- median(Stock_MLRAnalysis$return)
mode_return <- as.numeric(names(sort(table(Stock_MLRAnalysis$return), decreasing = TRUE)[1]))

mean_earnings <- mean(Stock_MLRAnalysis$earnings_ranking)
median_earnings <- median(Stock_MLRAnalysis$earnings_ranking)
mode_earnings <- as.numeric(names(sort(table(Stock_MLRAnalysis$earnings_ranking), decreasing = TRUE)[1]))

mean_debt_to_equity <- mean(Stock_MLRAnalysis$debt_to_equity)
median_debt_to_equity <- median(Stock_MLRAnalysis$debt_to_equity)
mode_debt_to_equity <- as.numeric(names(sort(table(Stock_MLRAnalysis$debt_to_equity), decreasing = TRUE)[1]))

mean_marketcap <- mean(Stock_MLRAnalysis$marketcap)
median_marketcap <- median(Stock_MLRAnalysis$marketcap)
mode_marketcap <- as.numeric(names(sort(table(Stock_MLRAnalysis$marketcap), decreasing = TRUE)[1]))

mean_stock_return <- mean(Stock_MLRAnalysis$stock_return_scaled)
median_stock_return <- median(Stock_MLRAnalysis$stock_return_scaled)
mode_stock_return <- as.numeric(names(sort(table(Stock_MLRAnalysis$stock_return_scaled), decreasing = TRUE)[1]))

# Categorical summaries
market_overview_summary <- Stock_MLRAnalysis %>%
  group_by(market_overview) %>%
  summarise(count = n()) %>%
  ungroup() %>%
  mutate(level = as.character(market_overview))

dividend_summary <- Stock_MLRAnalysis %>%
  group_by(dividend) %>%
  summarise(count = n()) %>%
  ungroup() %>%
  mutate(level = as.character(dividend))

# Print summaries
print(market_overview_summary)
print(dividend_summary)

# Visualization
# Histogram for Stock Return Scaled
ggplot(Stock_MLRAnalysis, aes(x = stock_return_scaled)) +
  geom_histogram(bins = 10, fill = "blue", alpha = 0.7) +
  geom_density(color = "red", size = 1) +
  labs(title = "Histogram of Stock Return Scaled", x = "Stock Return Scaled", y = "Frequency")

# Bar plot for Market Overview
ggplot(Stock_MLRAnalysis, aes(x = market_overview)) +
  geom_bar(fill = "green", alpha = 0.7) +
  labs(title = "Market Overview Distribution", x = "Market Overview", y = "Count")

# Bar plot for Dividend
ggplot(Stock_MLRAnalysis, aes(x = as.factor(dividend))) +
  geom_bar(fill = "purple", alpha = 0.7) +
  labs(title = "Dividend Distribution", x = "Dividend", y = "Count")

