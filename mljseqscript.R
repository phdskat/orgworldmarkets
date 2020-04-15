# Installing libraries

install.packages("TraMineR")
install.packages("cluster")

# Load libraries

library(TraMineR)
library(cluster)

# Loading data

data <- read.csv("https://raw.githubusercontent.com/phdskat/orgworldmarkets/master/mljseq.csv",sep=";",
                 header=T,
                 row.names=1)

# View data (collected and coded)

data

# Defining sequences (telling TraMineR where our sequences are)

sequences <- seqdef(data)

# Viewing the alphabet

alphabet(sequences)

# Viewing the raw sequences

sequences

# Overview plot

seqIplot(sequences)

# Overwith plot with sequence labels

seqIplot(sequences, ytlab = row.names(data))

# State distribution plot

seqdplot(sequences)

# Optimal matching - cost matrix based on transition rates

trates <- seqtrate(sequences)

trates

# Optimal matching - calculating distances between sequences

distances <- seqdist(sequences, method = "OM", sm = "TRATE")

distances

# Optimal matching - generating clusters

agnestree <- agnes(distances, method = "ward")

clusters <- cutree(agnestree, k = 4)

# Optimal matching - viewing clusters

seqIplot(sequences, group = clusters)
