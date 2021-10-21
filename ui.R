#Attaining Herd Immunity Against COVID-19 in Bangladesh

# load packages
library(shiny)
library(shinydashboard)
library(readr)
library(dplyr)
library(zoo)
library(ggplot2)
library(scales)

get.data <- function() {
  # Scrapes vaccination and COVID-19 data from respective github repositories
  
  # Returns:
  # A dataframe containing data for Bangladesh
  vaccine.url <-
    'https://raw.githubusercontent.com/govex/COVID-19/master/data_tables/vaccine_data/global_data/time_series_covid19_vaccine_global.csv'
  vaccine.global <- read_csv(vaccine.url)
  vaccine.bangladesh <-
    vaccine.global %>% filter(Country_Region == 'Bangladesh') %>% select(Date, People_partially_vaccinated, People_fully_vaccinated)
  vaccine.date <- as.character(vaccine.bangladesh[['Date']])
  covid.url <-
    'https://raw.githubusercontent.com/datasets/covid-19/main/data/time-series-19-covid-combined.csv'
  covid.global <- read.csv(covid.url)
  covid.bangladesh <-
    covid.global %>% filter(Country.Region == 'Bangladesh') %>% select(Date, Confirmed, Deaths)
  covid.bangladesh <-
    covid.bangladesh %>% mutate(Daily.Cases = diff(zoo(Confirmed), na.pad = TRUE))
  covid.bangladesh <-
    covid.bangladesh %>% mutate(Daily.Deaths = diff(zoo(Deaths), na.pad = TRUE))
  covid.bangladesh <- covid.bangladesh %>% filter(Date %in% vaccine.date)
  combined.bangladesh <- cbind(vaccine.bangladesh, covid.bangladesh)
  combined.bangladesh[['Date']] <- NULL
  combined.bangladesh[['Date']] <- as.Date(combined.bangladesh[['Date']])
  return(combined.bangladesh)
}

# Build User-Interface for Shiny app
my.ui <-
  shinyUI(fluidPage(
    titlePanel(
      h1("Attaining Herd Immunity Tracking against COVID-19 in Bangladesh", align = 'center')
    
    ),
    fluidRow(column(6,
                    plotOutput(outputId = "plot1")),
             column(6,
                    plotOutput(outputId = "plot2"))),
    fluidRow(column(6,
                    plotOutput(outputId = "plot3")),
             column(6,
                    plotOutput(outputId = "plot4")))
  ))
