# Philippines Remittances & GDP Growth (2000–2024)

## Overview
This project analyzes the relationship between **remittances** (as % of GDP) and **annual GDP growth** for the Philippines from 2000–2024.

The aim is to:
- Track trends in remittances and GDP growth
- Explore their relationship using visualizations
- Summarize the best and worst years for each indicator

## Key Visuals
### 1. Remittances (% of GDP) Trend
![Remittances Trend](images/phl_remittances_trend.png)

### 2. GDP Growth (%) Trend
![GDP Growth Trend](images/phl_gdp_growth_trend.png)

### 3. Relationship: Remittances vs GDP Growth
![Remittances vs GDP Growth](images/phl_remit_vs_gdp.png)

## Summary Table
**[Excel: Summary of Best/Worst Years](data/processed/phl_remit_gdp_summary.xlsx)**

| Metric                | Year | Value |
|-----------------------|------|-------|
| Best Remittances Year | 2005 | 12.78 |
| Worst Remittances Year| 2000 | 8.275 |
| Best GDP Growth Year  | 2022 | 7.581 |
| Worst GDP Growth Year | 2020 | -9.52 |


## 🔎 Quick Insights
- Remittances as a % of GDP peaked in **2005** at **12.78%**.
- The fastest GDP growth occurred in **2022**, reaching **7.581%**.
- Scatter plot suggests a [positive] relationship between remittances and GDP growth.

## 🛠️ How to Reproduce
**Data file**: `PHILREM.xlsx` (sheet `Data`) with columns:  
`COUNTRY | YEAR | GDP | REM | INFL`

**R Setup**
```r
install.packages(c("tidyverse", "readxl", "writexl"))
