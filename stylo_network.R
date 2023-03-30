### -------------------------------- ###
###         Stylo Scripts            ###
### -------------------------------- ###

# For stylo documentation. After loading package, type in console: ?stylo

# For more documentation see the resources page at:<https://computationalstylistics.github.io/resources/>

# install.packages("stylo")
library(stylo)

# File names must follow the pattern "author_work.txt".
# Some resulting files will be created in the parent folder.

# Set working directory to the folder with the corpus
# setwd("~/your_path")

results = stylo(gui = F, 
                corpus.dir = "corpus", 
                mfw.min = 500, 
                mfw.max = 500,
                mfw.incr = 500, 
                analysis.type = "CA",
                #analysis.type = "BCT",
                corpus.lang = "Spanish",
                # corpus.format = "xml",
                # distance.measure="wurzburg",
                distance.measure="delta",
                display.on.screen = T,
                dendrogram.layout.horizontal = T,
                # network = T, # edgelist. True by default
                network.tables = "both" # edgelist/nodelist. To viz on the table already the clustering
)
# For Source/Target with nodes labels (network.tables = "edges")
# Attention! The file name is modified according to the chosen parameters.

nodelist = read.csv("RISE_stylo_CA_500_MFWs_Culled_0__Classic Delta_NODES.csv")
edgelist = read.csv("RISE_stylo_CA_500_MFWs_Culled_0__Classic Delta_EDGES.csv")

# Bootstrap consensus networks: stylo.network()----

# To use the stylo.network() function you need to have the networkD3 package installed
# install.packages('networkD3')

# Default values for stylo.network() 100-1000 MFW

network = stylo.network(gui = F,
              corpus.dir = "corpus",
              mfw.min = 100, 
              mfw.max = 1000,
              mfw.incr = 100, # # minimum 3 iterations for a consensus tree
              # distance.measure="wurzburg",
              distance.measure="delta"
              )

network # to console

# # stylo.network() calls the forceNetwork() function. Here you can modify some parameters

library(networkD3)
forceNetwork(Links = network$x$links, 
             Nodes = network$x$nodes,
             Source = "source", 
             Target = "target",
             Value = "value", # weight
             NodeID = "name",
             Group = "group",
             opacity = 0.9,
             zoom = T,
             bounded = F, # browser margins
             charge = -100) # more charge for bigger networks

# See an example of stylometry on Drama https://editio.github.io/grafos/teatro/
