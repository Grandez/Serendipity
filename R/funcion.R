library(shiny)
library(highcharter)

ui <- fixedPage(
    fixedRow(column(12,highchartOutput('plot')))
)


server <- function(input, output) {

    df <- read.csv("./data/funcion.csv")
    
    p <- highchart() %>%  
        hc_chart(type = "line", polar = T) %>%
        hc_xAxis(categories = df$attr,  tickmarkPlacement =  'on',   lineWidth = 0) %>%
        hc_yAxis(gridLineInterpolation = 'polygon', lineWidth = 0,    min =  0) %>%
        hc_add_series(name = "Maximos", data = df$max, pointPlacement = 'on') %>%
        hc_add_series(name = "Actual", data = df$act, pointPlacement = 'on') 
    
    output$plot <- renderHighchart(p)

}

shinyApp(ui = ui, server = server)

