shinyServer(function(input, output) {
  
  df <- read.csv("../data/parrafos.csv")
  
  p <- highchart() %>%  
    hc_add_series(name = "parrafo", data = df$lineas, type = "column") %>% 
    hc_xAxis(categories = df$parrafo) %>%
    hc_plotOptions(
      series = list(
        showInLegend = FALSE,
        pointFormat = "{point.y}%"
      ),
      column = list(
        colorByPoint = TRUE
      )
    )
  output$plot <- renderHighchart(p)
  
})
