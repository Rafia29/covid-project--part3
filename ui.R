#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
# ATTAINING COVID-19 HERD IMMUNITY IN BANGLADESH 

#Libraries
library("shiny")
library("deSolve")
library("cowplot")
library("ggplot2")
library("tidyverse")
library("ggrepel")
library("shinydashboard")

## Create an SIR function
sir <- function(time, state, parameters) {
  with(as.list(c(state, parameters)), {
    dS <- -beta * S * I
    dI <-  beta * S * I - gamma * I
    dR <-                 gamma * I
    dV <- 0
    return(list(c(dS, dI, dR, dV)))
  })
}

# Define UI for application that draws a histogram
ui <- dashboardPage(
  dashboardHeader(disable = TRUE),
  dashboardSidebar(
    sliderInput("connum",
      "Basic reproductive number (R0, # persons):",
      min = .5, max = 20, value = 5
    ),
    sliderInput("pinf",
      "# infected at outbreak:",
      min = 1, max = 50, value = 2
    ),
    sliderInput("pvac",
      "Proportion vaccinated / immune (%):",
      min = 0, max = 100, value = 75
    ),
    sliderInput("vaceff",
      "Vaccine effectiveness (%):",
      min = 0, max = 100, value = 12
    ),
    sliderInput("infper",
      "Infection period (days):",
      min = 1, max = 30, value = 7
    ),
    sliderInput("timeframe",
      "Time frame (days):",
      min = 1, max = 400, value = 200
    )
    
  ),
  dashboardBody(
    tags$head(tags$style(HTML('
                              /* body */
                              .content-wrapper, .right-side {
                              background-color: #fffff8;
                              }                              
                              '))),
        
    #    mainPanel(

      tabPanel("About",  
                h1("Goal"),
        
               "The goal of this shiny app to define herd immunity for covid-19.'Herd immunity', also known as 'population immunity', is the indirect protection from an infectious disease that happens when a population is immune either through vaccination or immunity developed through previous infection. WHO supports achieving 'herd immunity' through vaccination, not by allowing a disease to spread through any segment of the population, as this would result in unnecessary cases and deaths.
                Herd immunity against COVID-19 should be achieved by protecting people through vaccination, not by exposing them to the pathogen that causes the disease.
                Total population is 166,822,384 among which 19,332,082 people are fully vaccinated which is about 11.7% till 10/22/2021 . 
               We set basic reproductive number,Ro(persons) ranges from 0.5 to 20 and infected at outbreak ranges from 0 to maximum 50. Sice the vaccination rate is too low at this point and we are way too much lacking behid attaing herd immunity, vaccination process is still ongoing throughout the country and we are supposed to vaccinated majority of the population within a very short term. This is an dynamic shiny app showing how increasing vaccination will lead us to attain herd immunity considering effictiveness of vaccination 100%.",
                                                                                                                                                                      
                           
               
    br(),
               
    fluidRow(plotOutput("distPlot")),
    br(),
    fluidRow(
      # Dynamic valueBoxes
      valueBoxOutput("progressBox", width = 6),
      valueBoxOutput("approvalBox", width = 6),
      valueBoxOutput("BRRBox", width = 6),
      valueBoxOutput("HIBox", width = 6)
    ),
    br(),
    br()
  )
))

