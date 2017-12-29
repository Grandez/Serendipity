require(shiny)
require(visNetwork)

server <- function(input, output, session) {
    ids=c(1,2,3,4,5)
    names=c("node 1", "node 2", "node 3", "node 4", "node 5")
    
    edges = data.frame(from=c(1,1,2,3,4), to=c(2,3,4,4,5))
    nodes = data.frame(id=ids,label=names)
    g <-         visNetwork(nodes,edges) %>% 
        visEdges(arrows = "from") %>% 
        visNodes(shape="box") %>%
        visHierarchicalLayout() %>%
        visInteraction(hover = TRUE) %>%
        visOptions(nodesIdSelection = TRUE)
    
    output$network <- renderVisNetwork(g);
        
        # minimal example
#        nodes <- data.frame(id = 1:3)
#        edges <- data.frame(from = c(1,2), to = c(1,3))
        
#) 
#        visOptions(nodesIdSelection = TRUE)
#    })
    
    output$shiny_return <- renderPrint({
        input$current_node_id
    })
    
    observe({
        id <- input$current_node_id
        
        session$sendCustomMessage(type = "myCallbackHandler", id)
    })
}

ui <- fluidPage(
    navbarPage("My Application",
               tabPanel("Component 1"),
               tabPanel("Component 2"),
               tabPanel("Component 3")
    ),
    visNetworkOutput("network"),
    verbatimTextOutput("shiny_return"),
    tags$script('Shiny.addCustomMessageHandler("myCallbackHandler",
        function(id) {
          top.document.getElementById("mimarca").value = id;
        });
')
)

shinyApp(ui = ui, server = server)
