install.packages(c("readxl", "tidyverse"))

library(readxl)
library(tidyverse)
library(writexl)

# Read your Excel file
remit_data <- read_excel("PHILREM.xlsx", sheet = "Data")

# Check column names
colnames(remit_data)

dir.create("data/raw", recursive = TRUE, showWarnings = FALSE)
dir.create("data/processed", recursive = TRUE, showWarnings = FALSE)
dir.create("images", showWarnings = FALSE)

# Save raw data in Excel format
write_xlsx(remit_data, "data/raw/phl_remit_raw.xlsx")

#Chart 1 — Remittances Trend
remit_plot <- remit_data %>%
  ggplot(aes(x = YEAR, y = REM)) +
  geom_line(color = "steelblue", linewidth = 1.2) +
  geom_point(color = "steelblue", size = 2) +
  labs(
    title = "Philippines: Remittances (% of GDP), 2000–2024",
    x = NULL,
    y = "Remittances (% of GDP)"
  ) +
  theme_minimal()

# Save as PNG
ggsave("images/phl_remittances_trend.png", remit_plot,
       width = 8, height = 5, dpi = 300)



#Chart 2: GDP growth trend (2000–2024)
gdp_plot <- remit_data %>%
  ggplot(aes(x = YEAR, y = GDP)) +
  geom_line(linewidth = 1.2) +
  geom_point(size = 2) +
  labs(
    title = "Philippines: GDP Growth (%), 2000–2024",
    x = NULL,
    y = "GDP growth (%)"
  ) +
  theme_minimal()

ggsave("images/phl_gdp_growth_trend.png", gdp_plot,
       width = 8, height = 5, dpi = 300)


#Chart 3: Relationship between Remittances and GDP Growth
remit_gdp_scatter <- remit_data %>%
  ggplot(aes(x = REM, y = GDP)) +
  geom_point(color = "darkorange", size = 3) +
  geom_smooth(method = "lm", se = FALSE, color = "black", linetype = "dashed") +
  labs(
    title = "Philippines: Remittances vs GDP Growth (2000–2024)",
    x = "Remittances (% of GDP)",
    y = "GDP growth (%)"
  ) +
  theme_minimal()

ggsave("images/phl_remit_vs_gdp.png", remit_gdp_scatter,
       width = 8, height = 5, dpi = 300)



#Summary Table: Best & Worst Years
summary_table <- remit_data %>%
  summarise(
    best_rem_year = YEAR[which.max(REM)],
    best_rem_value = max(REM, na.rm = TRUE),
    worst_rem_year = YEAR[which.min(REM)],
    worst_rem_value = min(REM, na.rm = TRUE),
    best_gdp_year = YEAR[which.max(GDP)],
    best_gdp_value = max(GDP, na.rm = TRUE),
    worst_gdp_year = YEAR[which.min(GDP)],
    worst_gdp_value = min(GDP, na.rm = TRUE)
  )

# Save as Excel
write_xlsx(summary_table, "data/processed/phl_remit_gdp_summary.xlsx")

# View in RStudio
summary_table
