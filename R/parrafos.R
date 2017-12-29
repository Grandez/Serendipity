library(shiny)

ui <- fluidPage(
    highchartOutput('plot')
)


server <- function(input, output) {
    df = read.csv("data/parrafos1.csv")
    
    p <- highchart() %>%  
#         hc_add_theme(hc_theme_null()) %>%
         hc_legend(enabled=FALSE) %>%
         hc_add_series(data = df$sentencias, colorByPoint="true") %>%
         hc_chart( type = "column", showAxes = TRUE) %>%
         hc_xAxis(categories=df$nombre) %>%
         hc_yAxis(lineColor="red", lineWidth="5px", label="Lineas",
                  plotLines = list(
                              list( value = 25, color =  'red',   dashStyle =  'shortdash',   width= 2)
                              )
                 )
    #        hc_yAxis(min=0, max=100
                     #, stops=list(list(10, "blue"),list(60,"yellow"),list(30,"green"))
    #                 ,minColor="#FF0000", maxColor="#00FF00"
    #        ) %>%
    #        hc_plotOptions(solidgauge = list(
    #            dataLabels = list(y= 5, borderWidth= 0, useHTML= "true")
    #        )
    #        ) 
    
    output$plot <- renderHighchart(p)
}

shinyApp(ui = ui, server = server)

