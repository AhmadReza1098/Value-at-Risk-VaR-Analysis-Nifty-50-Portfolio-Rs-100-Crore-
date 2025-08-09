
# 📉 Value at Risk (VaR) Analysis: Nifty 50 Portfolio (Rs 100 Crore)

This repository provides an R-based workflow to calculate and interpret Value at Risk (VaR) for a Rs 100 crore portfolio invested in the Nifty 50 index using daily market data. VaR is computed using three standard methods—historical, parametric (Gaussian), and Monte Carlo—to assess and visualize portfolio risk under different statistical assumptions.

---

## ✅ Main Topics

- **VaR Concepts:** Core ideas in Value at Risk for portfolio risk management.
- **Methods Used:** Historical VaR, Parametric VaR (Gaussian), Monte Carlo (Modified) VaR.
- **Data Source:** Daily adjusted close of Nifty 50 index (2020–2025).
- **Interpretation:** Real-world takeaway for risk exposure and loss probabilities.
- **Visualization:** Distribution and VaR overlays for intuitive risk communication.

---

## 🖥️ How to Use

1. **Install dependencies**  
install.packages(c("quantmod", "PerformanceAnalytics", "tidyverse", "tseries"))


2. **Run the R script**  
Open `Case-study-on-VaR-inividual-stocks.R` in R or RStudio.

3. **What it does**  
- Downloads Nifty 50 data.
- Computes daily log returns.
- Calculates one-day VaR at 95% confidence using 3 methods.
- Visualizes results with histograms and risk thresholds.
- Prints risk interpretation directly in the console.

---

## ✏️ Interpretation Example

- **Maximum loss at 95% confidence (1-day):**  
For a Rs 100 crore Nifty 50 portfolio, the largest expected loss in one day with 95% confidence is approximately Rs 1.62 crore.
- **Risk statement:**  
There is a 5% probability that the loss will exceed Rs 1.62 crore on any given day.

---

## 📦 Repository Structure


---

## 📖 References

- Jorion, P. (2007). "Value at Risk: The New Benchmark for Managing Financial Risk."
- R Packages: quantmod, PerformanceAnalytics, tidyverse, tseries
- [NSE India](https://www.nseindia.com/) for Nifty 50 data

---

*Feel free to open issues for questions or extensions (e.g., other indices, alternative portfolio values, or multi-day horizons).*
