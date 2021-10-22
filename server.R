

# Define server logic required to draw a histogram
server <- function(input, output) {
  # Create reactive input
  popsize <- 21741090 #Population of Dhaka, Bangladesh
  dataInput <- reactive({
    init       <-
      c(
        S = 1 - input$pinf / popsize - input$pvac / 100 * input$vaceff / 100,
        I = input$pinf / popsize,
        R = 0,
        V = input$pvac / 100 * input$vaceff / 100
      )
    ## beta: infection parameter; gamma: recovery parameter
    parameters <-
      c(beta = input$connum * 1 / input$infper,
        # * (1 - input$pvac/100*input$vaceff/100),
        gamma = 1 / input$infper)
    ## Time frame
    times      <- seq(0, input$timeframe, by = .2)
    
    ## Solve using ode (General Solver for Ordinary Differential Equations)
    out <- ode(
        y = init,
        times = times,
        func = sir,
        parms = parameters
      )   
    #    out
    as.data.frame(out)
  })
  
  output$distPlot <- renderPlot({
    out <-
      dataInput() %>%
      gather(key, value, -time) %>%
      mutate(
        id = row_number(),
        key2 = recode(
          key,
          S = "Susceptible (S)",
          I = "Infected (I)",
          R = "Recovered (R)",
          V = "Vaccinated / immune (V)"
        ),
        keyleft = recode(
          key,
          S = "Susceptible (S)",
          I = "",
          R = "",
          V = "Vaccinated / immune (V)"
        ),
        keyright = recode(
          key,
          S = "",
          I = "Infected (I)",
          R = "Recovered (R)",
          V = ""
        )
      )
    
    ggplot(data = out,
           aes(
             x = time,
             y = value,
             group = key2,
             col = key2,
             label = key2,
             data_id = id
           )) + # ylim(0, 1) +
      ylab("Proportion of full population") + xlab("Time (days)") +
      geom_line(size = 2) +
      geom_text_repel(
        data = subset(out, time == max(time)),
        aes(label = keyright),
        size = 6,
        segment.size  = 0.2,
        segment.color = "grey50",
        nudge_x = 0,
        hjust = 1,
        direction = "y"
      ) +
      geom_text_repel(
        data = subset(out, time == min(time)),
        aes(label = keyleft),
        size = 6,
        segment.size  = 0.2,
        segment.color = "grey50",
        nudge_x = 0,
        hjust = 0,
        direction = "y"
      ) +
      theme(legend.position = "none") +
      scale_colour_manual(values = c("red", "green4", "black", "blue")) +
      scale_y_continuous(labels = scales::percent, limits = c(0, 1)) +
      theme(
        rect=element_rect(size=0),
        legend.position="none",
        panel.background=element_rect(fill="transparent", colour=NA),
        plot.background=element_rect(fill="transparent", colour=NA),
        legend.key = element_rect(fill = "transparent", colour = "transparent")
      )
    
  })
  
  output$progressBox <- renderValueBox({
    valueBox(
      dataInput() %>% filter(time == max(time)) %>% select(R) %>% mutate(R = round(100 * R, 2)) %>% paste0("%"),
      "Proportion of full population that got the disease by end of time frame",
      icon = icon("thumbs-up", lib = "glyphicon"),
      color = "black"
    )
  })
  
  output$approvalBox <- renderValueBox({
    valueBox(
      paste0(round(
        100 * (dataInput() %>% filter(row_number() == n()) %>% mutate(res = (R + I) / (S + I + R)) %>% pull("res")), 2), "%"),
      "Proportion of susceptibles that will get the disease by end of time frame",
      icon = icon("thermometer-full"),
      color = "black"
    )
  })
  
  output$BRRBox <- renderValueBox({
    valueBox(
      paste0(round(input$connum *
                     (1 - input$pvac / 100 * input$vaceff / 100), 2), ""),
      "Effective R0 (for populationen at outbreak, when immunity is taken into account)",
      icon = icon("arrows-alt"),
      color = "red"
    )
  })
  
  output$HIBox <- renderValueBox({
    valueBox(
      paste0(round(100 * (1 - 1 / (input$connum)), 2), "%"),
      "Proportion of population that needs to be immune for herd immunity",
      icon = icon("medkit"),
      color = "blue"
    )
  })  
}

