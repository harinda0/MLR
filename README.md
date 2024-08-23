# Stock Return Prediction Analysis Using R

## Overview
This repository contains my final project from the Statistical and Predictive Modeling I course. The project explores the relationships between various factors and scaled stock returns, using a combination of simple and multiple linear regression models.

### Key Components:
1. **Dataset**:
   - The dataset (`Stock_MLRAnalysis.xlsx`) contains 180 observations across 7 variables, including return, market overview, dividend, earnings ranking, debt to equity, market cap, and scaled stock return.
   
2. **Statistical Analysis**:
   - **Simple Linear Regression (SLR)**: Evaluated the impact of dividend on scaled stock returns.
   - **Multiple Linear Regression (MLR)**: Assessed the combined effect of multiple predictors on scaled stock returns, refining the model using backward elimination.

3. **Hypothesis Testing**:
   - Conducted a t-test to determine if the mean scaled stock return was significantly different from 300.
   - Developed and tested hypotheses for both SLR and MLR models, checking assumptions like normality, linearity, and homoscedasticity.

4. **Visualizations**:
   - Created histograms, QQ plots, and residual plots to assess data distribution and model assumptions.

## Key Insights
- **Dividend Impact**: SLR analysis showed that dividend does not have a significant impact on scaled stock returns.
- **Significant Predictors**: MLR identified market overview and market cap as significant predictors of stock returns, with the backward regression model providing the best fit.
- **Model Assumptions**: The analysis revealed some deviations from normality and homoscedasticity, which were addressed through model refinement.

## Files in this Repository
- `Script.R`: The R script containing all the code for data analysis, model fitting, and visualizations.
- `Stock_MLRAnalysis.xlsx`: The dataset used in the analysis.

## Usage
This repository is ideal for anyone interested in understanding how to apply regression models to financial data. The project demonstrates the application of statistical methods to predict stock returns, providing practical insights into model fitting and evaluation.

## Conclusion
This final project encapsulates my learning journey in statistical analysis and predictive modeling. The project highlights the importance of thorough data analysis, the need for rigorous model testing, and the value of using R to gain insights into financial datasets.
