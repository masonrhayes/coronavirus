library(data.table)
library(tidyverse)
library(ggthemes)
library(lubridate)
library(ftplottools)

# Collect data set form Our World in Data
covid_df = read_csv("https://covid.ourworldindata.org/data/owid-covid-data.csv")

# View data set
view(covid_df)


# List all countries of interest
countries = c("Germany", "France", "United States", "Spain")

# Set start date
start_date = "2020-04-01"

## Graph the variable(s) of interest
covid_df %>%
  filter(location %in% countries)%>%
  filter(date >= start_date) %>%
  ggplot(aes(x = date, y = new_cases_per_million)) +
  geom_line(aes(color = location), se = FALSE) +
  ft_theme() +
  scale_color_ft() +
  labs(title = "New Cases per Million Since April 1")

  
