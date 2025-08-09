# ---
# `Case Studies on VaR`
# ---

###################################################
# Installing and Loading required Libraries
###################################################

install.packages(c("quantmod", "PerformanceAnalytics", "tidyverse", "tseries"))
library(quantmod)
library(PerformanceAnalytics)
library(tidyverse)
library(tseries)

###################################################
# Collecting Historical data
###################################################

getSymbols("^NSEI", from = "2020-01-01", to = "2025-03-31", src = "yahoo")

###################################################
# Caclculating daily returns
###################################################

nifty_returns <- dailyReturn(Cl(NSEI), type = "log")

# Sumamry of returns
summary(nifty_returns)

# Portfolio value in crores
portfolio_value <- 100 * 1e7  # Rs100 crores in INR

# Holding period (one day)
holding_period <- 1

###################################################
# Performance VaR analysis
###################################################
# Historical VaR
historical_var <- VaR(nifty_returns, p = 0.95, method = "historical", portfolio_value = portfolio_value)
historical_loss <- abs(historical_var) * portfolio_value * sqrt(holding_period)
cat("Historical VaR for one day (Rs):", historical_loss, "\n")

# Parametric VaR (Gaussian)
gaussian_var <- VaR(nifty_returns, p = 0.95, method = "gaussian", portfolio_value = portfolio_value)
gaussian_loss <- abs(gaussian_var) * portfolio_value * sqrt(holding_period)
cat("Parametric (Gaussian) VaR for one day (Rs):", gaussian_loss, "\n")

#Monte Carlo VaR
monte_carlo_var <- VaR(nifty_returns, p = 0.95, method = "modified", portfolio_value = portfolio_value)
monte_carlo_loss <- abs(monte_carlo_var) * portfolio_value * sqrt(holding_period)
cat("Monte Carlo (Modified) VaR for one day (Rs):", monte_carlo_loss, "\n")

###################################################
# Visualization
###################################################

chart.Histogram(nifty_returns, main = "VaR Analysis of NIFTY 50 Returns",
                breaks = 50, methods = c("add.density", "add.normal"))
abline(v = historical_var, col = "red", lwd = 2, lty = 2)
abline(v = gaussian_var, col = "blue", lwd = 2, lty = 2)
abline(v = monte_carlo_var, col = "green", lwd = 2, lty = 2)
legend("topright", legend = c("Historical VaR", "Gaussian VaR", "Monte Carlo VaR"),
       col = c("red", "blue", "green"), lty = 2, lwd = 2)

# ------ Interpretation ------
# - the maximum loss with 95% confidence density one day for the portfolio value of Rs 100 crores is about Rs 1.62 crores
# - OR
# - there is 5% chance that the loss of the portfolio value can exceeds than Rs 1.62 crores over one day for Rs 100 crores 