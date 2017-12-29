library(igraph)
ids=c(1,2,3,4,5)
names=c("node 1", "node 2", "node 3", "node 4", "node 5")
edges = data.frame(from=c(1,1,2,3,4), to=c(2,3,4,4,5))
nodes = data.frame(id=ids,name=name)

g <- graph_from_data_frame(edges, directed=TRUE, vertices=nodes)
g$layout <- layout.reingold.tilford
plot.igraph(g, vertex.shape="rectangle", vertex.size=50)

> plot(g)
> g <- graph_from_data_frame(edges, directed=TRUE, vertices=nodes, 
Error in graph_from_data_frame(edges, directed = TRUE, vertices = nodes,  : 
                                   unused argument (vertex.shapes("rectangle"))
                               > g <- graph_from_data_frame(edges, directed=TRUE, vertices=nodes)
                               > g$layout <- layout.reingold.tilford
                               > plot.igraph(g, vertex.shape="rectangle", vertex.size=50)name=c("node 1", "node 2", "node 3", "node 4", "node 5")
