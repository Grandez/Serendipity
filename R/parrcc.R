# df <- read.csv("./data/parrafos.csv")

parrcc = function(id, rng) {
    n = id %%  3
    
    df = read.csv(paste("data/parrafos", n, ".csv", sep=""))
    max = 5
    p <- highchart() %>%  
        #         hc_add_theme(hc_theme_null()) %>%
        hc_legend(enabled=FALSE) %>%
        hc_add_series(data = df$cc, colorByPoint="true") %>%
        hc_chart( type = "column", showAxes = TRUE) %>%
        hc_xAxis(categories=df$nombre) %>%
        hc_yAxis(lineColor="red", lineWidth="5px", label="Lineas",
                 plotLines = list(
                     list( value = max, color =  'red',   dashStyle =  'shortdash',   width= 2)
                 )
        )

}