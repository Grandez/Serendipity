server = function(input, output,session) {
    nodes1 <- create_node_df(nrow(t1), type="a", label=t1$nombre, id=t1$id, shape="circle")
    nodes2 <- create_node_df(nrow(t2), type="b", label=t2$nombre, id=t2$id, shape="box")
    edges <- read.csv("data/edges.csv")
    
    graph <- create_graph()
    graph <- set_global_graph_attrs(graph, "layout", "top", "graph")
    graph <- add_node_df(graph, nodes1)
    graph <- add_node_df(graph, nodes2)
    graph <- add_edge_df(graph, edges1)
    
    #renderDiagrammeR({
    #    if (v$time <= start(sim)) {
    #        return()
    #    } else {
    #        objectDiagram(sim)
    #    }
    #})

    src = generate_dot(graph)
    source <- "
digraph boxes_and_circles {


  graph [overlap = true, fontsize = 10]


  node [shape = box,
        fontname = Helvetica]
  A; B; C; D; E; F

  node [shape = circle,
        fixedsize = true,
        width = 0.9] // sets as circles
  1; 2; 3; 4; 5; 6; 7; 8


  A->1 B->2 B->3 B->4 C->A
  1->D E->A 2->4 1->5 1->F
  E->6 4->6 5->7 6->7 3->8
}
"
        
        
    
    #    output$diagram <- renderDiagrammeR({
    #        d <- paste(
    #            paste0("graph ", input$orientation),
    #            "A[A]-->B[B]",
    #            "B-->C[C]",
    #            "C-->D[D]",
    #            "A-->D",
    #            "B-->E[E]",
    #            sep = "\n")
    #        mermaid(d)
    #    })
    output$diagram = renderGrViz({grViz({src})})
}


# ui.R

ui <- fluidPage(
    titlePanel("DiagrammeR + shiny"),
    
    sidebarLayout(
        sidebarPanel(
            helpText("Example showing DiagrammeR output in a shiny app."),
            
            selectInput("orientation",
                        label = "Select diagram orientation",
                        choices = c("BT", "TB", "LR", "RL"),
                        selected = "TB")
        ),
        
        mainPanel(grVizOutput("diagram"))
    )
)

shinyApp(ui = ui, server = server)