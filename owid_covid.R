library(data.table)
library(tidyverse)
library(ggthemes)
library(lubridate)
library(ftplottools)

covid_df = read_csv("https://covid.ourworldindata.org/data/owid-covid-data.csv")

view(covid_df)



countries = c("Italy", "Germany", "Spain", "France", "United States")

covid_df %>%
  filter(location %in% countries)%>%
  filter(date >= "2020-04-01") %>%
  ggplot(aes(x = date, y = log(new_deaths_per_million))) +
  geom_smooth(aes(color = location), se = FALSE) +
  ft_theme() +
  scale_color_ft()

  
