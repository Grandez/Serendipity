library("shiny")
library("highcharter")

ui <- fixedPage(
    fixedRow(column(12,highchartOutput('plot')))
)

server = function(input, output) {
    # df <- read.csv("./data/parrafos.csv")

    data <- 100
    
    p <- highchart() %>%  
            hc_add_theme(hc_theme_null()) %>%
            hc_add_series(name="prueba" , data = data) %>%
            hc_chart( type = "solidgauge") %>%
            hc_yAxis(min=0, max=100
                     #, stops=list(list(10, "blue"),list(60,"yellow"),list(30,"green"))
                     ,minColor="#FF0000", maxColor="#00FF00"
                     ) %>%
            hc_plotOptions(solidgauge = list(
                                        dataLabels = list(y= 5, borderWidth= 0, useHTML= "true")
                                        )
                           ) 
    output$plot <- renderHighchart(p)
}

shinyApp(ui = ui, server = server)