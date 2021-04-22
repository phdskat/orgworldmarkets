# Installing libraries

install.packages("igraph")
install.packages("ggraph")

# Load libraries

library(igraph)
library(ggraph)

# Load Data

data <- read.csv("https://raw.githubusercontent.com/phdskat/orgworldmarkets/master/mljnet.csv",sep=";",
                 header=T,
                 row.names=1)

# View Data

data

# Adjacency matrix: Identifying overlaps with matrix multiplication - for the network of individuals

adjacency <- as.matrix(data) %*% t(as.matrix(data))

# Adjacency matrix: Identifying overlaps with the flipped matrix multiplication - for the network of organisations

adjacency <- t(as.matrix(data)) %*% as.matrix(data)

adjacency

## Note you can do the same exact exercise for the organisations by flipping the matrix multiplication

# Create a simple network

network <- graph_from_adjacency_matrix(adjacency, 
                                       diag = FALSE, 
                                       mode = "undirected",
                                       weighted = T)

# Plot the network

ggraph(network) +
  geom_node_point() +
  geom_edge_link() +
  geom_node_label(aes(label=name), repel = T)

# Calculate and add degree centrality

degree <- degree(network)

ggraph(network) +
  geom_node_point(aes(size=degree)) +
  geom_edge_link() +
  geom_node_label(aes(label=name), repel = T)

# Calculate and visualize betweenness centrality

betweenness <- betweenness(network)

ggraph(network) +
  geom_node_point(aes(size=betweenness)) +
  geom_edge_link() +
  geom_node_label(aes(label=name), repel = T)

# Calculate and visualize relationship (tie) strength

ggraph(network) +
  geom_node_point() +
  geom_edge_link(aes(edge_width=weight)) +
  geom_node_label(aes(label=name), repel = T)
