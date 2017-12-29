library(shiny)
library(DiagrammeR)


ui <- fluidPage(
    DiagrammeROutput('plot')
    #grVizOutput('plot') 
    #plotOutput('plot')
)

server = function(input, output,session) {

    
    nodes1 <- create_node_df(nrow(t1), type="a", label=t1$nombre, id=t1$id, shape="circle")
    nodes2 <- create_node_df(nrow(t2), type="b", label=t2$nombre, id=t2$id, shape="box")
    edges <- read.csv("data/edges.csv")

    graph <- create_graph()
    #graph <- set_global_graph_attrs(graph, "layout", "top", "graph")
    #graph <- add_node_df(graph, nodes1)
    #graph <- add_node_df(graph, nodes2)
    #graph <- add_edge_df(graph, edges1)

    output$plot <- renderDiagrammeR(graph)
    #output$plot <- renderGrViz({
    #    grViz({
    #        graph$dot_code
    #    })
    #})
    
}

shinyApp(ui = ui, server = server)