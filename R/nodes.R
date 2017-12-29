library(DiagrammeR)
nodos <- function() {
    n <- read.csv("data/nodos.csv")
    
    nodes <-
        create_nodes(
            nodes = n$id,
            label = FALSE,
            type = "lower",
            style = "filled",
            color = "aqua",
            shape = rep("circle", nrow(n)),
            data = n$nombre)
    graph <-
        create_graph(
            nodes_df = nodes,
            # edges_df = edges,
            graph_attrs = "layout = neato",
            node_attrs = "fontname = Helvetica",
            edge_attrs = "color = gray20")
    
    render_graph(graph)
    
}