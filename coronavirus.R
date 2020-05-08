library(tidyverse)
library(openxlsx)
library(ggthemes)
library(tidyquant)
library(data.table)
library(ftplottools)
library(stringr)
library(utils)
library(lubridate)

covid_data = read.csv("https://opendata.ecdc.europa.eu/covid19/casedistribution/csv", na.strings = "", fileEncoding = "UTF-8-BOM") %>%
  mutate(dateRep = dmy(dateRep))

view(covid_data)

countries = c("Germany|France|Spain|Italy|United_Kingdom|United_States_of_America|Canada|South_Korea")
SA_countries = "Argentina|Chile|Peru|Brazil|Colombia|Mexico|Ecuador"
scandinavian_countries = "Sweden|Norway|Denmark|Finland|Estonia|Lithuania"
eastern_european_countries = "Slovenia|Czechia|Slovakia|Hungary|Croatia|Bosnia_and_Herzegovina|Serbia"

covid_data %>%
  filter(grepl(countries, countriesAndTerritories))%>%
  filter(dateRep > "2020-03-01") %>%
  ggplot(aes(x = dateRep, y = deaths)) +
  geom_smooth(aes(color = countriesAndTerritories), se = FALSE) +
  ft_theme(legend_right = TRUE) +
  scale_color_ft() +
  labs(title = "Covid-19 Deaths Since March 1", x = "date")

  
  