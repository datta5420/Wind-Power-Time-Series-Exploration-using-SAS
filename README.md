# 🌬️ Wind Power Forecasting using Time Series & ARIMAX Modeling (SAS)

This project applies advanced time series modeling techniques — including ARIMA, ARIMAX, and prewhitening — to forecast wind power generation using meteorological data. The implementation is done entirely in SAS, leveraging statistical modeling, residual diagnostics, and input-output cross-correlation.

## 📊 Dataset

The dataset used is sourced from [Kaggle: Wind Power Generation Data Forecasting](https://www.kaggle.com/datasets/mubashirrahim/wind-power-generation-data-forecasting).  
It contains daily average readings of:

- Power generated
- Wind speed and gusts 
- Wind direction (10m, 100m)
- Temperature and dewpoint 
- Relative humidity 

## 🧠 Objective

The primary goal of this project is to:

- Forecast wind power output using historical data
- Identify external meteorological variables that significantly influence power generation
- Apply prewhitening and cross-correlation analysis to improve forecasting accuracy via ARIMAX

## ⚙️ Techniques Used

- **Time Series Decomposition & Exploration**
- **ARIMA Modeling** for univariate forecasting
- **ARIMAX Modeling** (with external regressors)
- **Prewhitening** of input variables
- **Cross-correlation Analysis** to identify useful lags
- **Forecast Accuracy Metrics**: MAPE, MAE, MSE, RMSE
- **SAS Procedures Used**: `PROC ARIMA`, `PROC TIMESERIES`, `PROC ESM`, `PROC IMPORT`, `PROC PRINT`, etc.

## 📁 Repository Contents

| File Name                      | Description                                               |
|-------------------------------|-----------------------------------------------------------|
| `arima_model.sas`             | ARIMA modeling for Power variable                         |
| `arimax_model.sas`            | ARIMAX model using wind speed or direction as input       |
| `prewhitening_speed.sas`      | Prewhitening windspeed_10m and cross-correlation with Power |
| `prewhitening_dew.sas`        | Prewhitening dewpoint_2m vs Power                         |
| `prewhitening_temp.sas`       | Prewhitening temperature_2m vs Power                      |
| `prewhitening_humidity.sas`   | Prewhitening relative humidity vs Power                   |
| `prewhitening_direction.sas`  | Prewhitening wind direction 100m vs Power                 |
| `accuracy_report.sas`         | Accuracy metrics for forecast models                      |

> 🗂️ Each file includes its own preprocessing and is fully runnable in [SAS OnDemand for Academics](https://welcome.oda.sas.com/).


## 📝 Notes

- The time index is generated assuming a daily frequency starting from **02-JAN-2017**.
- All models were trained on 95% of the data and evaluated on a 12-day holdback window.
- Prewhitening was essential to properly identify meaningful input lags for ARIMAX.



