library("shiny")
library("highcharter")

ui <- fluidPage(
    highchartOutput('plot', height="140px")
)

server = function(input, output,session) {

    # Parse the GET query string
    query <- isolate({parseQueryString(session$clientData$url_search, nested=FALSE)})
    cat(file=stderr(), "Entra en la funcion server con query\n")
    cat(file=stderr(), "la query",query[["src"]] , "\n")
    cat(file=stderr(), "el id ",query$id , "\n")
    #src = "XXX"
    #q <- observe({parseQueryString(session$clientData$url_search)})
    #query <- observe({
    #         query <- parseQueryString(session$clientData$url_search, nested=FALSE)
    #    if (is.null(query[["src"]])) {
    #        cat(file=stderr(), "Es nulo\n")
    #    }
    #    else {
    #        cat(file=stderr(), "src1", query[["src"]], "\n")
    #        src = query[["src"]]
    #    }
    #         parseQueryString(session$clientData$url_search, nested=FALSE)
    #},autoDestroy=FALSE)
    # x <- query$src
    # a <- reactive({a <- session$clientData$url_search})
    #cat(file=stderr(), "Entra en la funcion server\n")
    #cat(file=stderr(), "src", query[["src"]], "\n")
    #cat(file=stderr(), "src", x , "\n")
#    cat(file=stderr(), "url", session$clientData$url_protocol, "\n")
#    cat(file=stderr(), "url", session$clientData$url_pathname, "\n")
#    cat(file=stderr(), "url", paste(names(query), query, sep = "=", collapse=", "), "\n")
    source(paste("../", query$src, ".R", sep=""))
    output$plot <- renderHighchart(do.call(query$src, args=list(id=query$id, rng=query$rng)))
    
}

shinyApp(ui = ui, server = server)