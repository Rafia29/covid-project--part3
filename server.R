bangladesh

my.server <- function(input, output) {
  combined.bangladesh <- reactive({
    invalidateLater(1000 * 60 * 60 * 24)
    get.data()
  })
  output$plot1 <-
    renderPlot({
      ggplot(data = combined.bangladesh(), aes(x = Date, y = People_fully_vaccinated)) +
        geom_line(color = "#339999", size = 1.25) + xlab("") + ylab('People fully vaccinated\n') +
        scale_x_date(date_breaks = "1 week", date_labels = "%d %b %Y") +
        theme(axis.text.x = element_text(
          angle = 45,
          vjust = 0.5,
          hjust = 1
        )) +
        scale_y_continuous(labels = comma) +
        theme(text = element_text(size = rel(4)))
    })
  output$plot3 <-
    renderPlot({
      ggplot(data = combined.bangladesh(), aes(x = Date, y = Daily.Cases)) +
        geom_line(color = "#FF9999", size = 1.25) + xlab("") + ylab('Daily cases\n') +
        scale_x_date(date_breaks = "1 week", date_labels = "%d %b %Y") +
        theme(axis.text.x = element_text(
          angle = 45,
          vjust = 0.5,
          hjust = 1
        )) +
        scale_y_continuous(labels = comma) +
        theme(text = element_text(size = rel(4)))
    })
  output$plot2 <-
    renderPlot({
      ggplot(data = combined.bangladesh(), aes(x = Date, y = People_partially_vaccinated)) +
        geom_line(color = "#FF9933", size = 1.25) + xlab("") + ylab('People partially vaccinated \n') +
        scale_x_date(date_breaks = "1 week", date_labels = "%d %b %Y") +
        theme(axis.text.x = element_text(
          angle = 45,
          vjust = 0.5,
          hjust = 1
        )) +
        scale_y_continuous(labels = comma) +
        theme(text = element_text(size = rel(4)))
    })
  output$plot4 <-
    renderPlot({
      ggplot(data = combined.bangladesh(), aes(x = Date, y = Daily.Deaths)) +
        geom_line(color = "#CC0000", size = 1.25) + xlab("") + ylab('Daily Deaths \n') +
        scale_x_date(date_breaks = "1 week", date_labels = "%d %b %Y") +
        theme(axis.text.x = element_text(
          angle = 45,
          vjust = 0.5,
          hjust = 1
        )) +
        scale_y_continuous(labels = comma) +
        theme(text = element_text(size = rel(4)))
    })
}
