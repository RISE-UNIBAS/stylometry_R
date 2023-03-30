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

# unattributed text: add the unattributed text to the corpus folder: unknown_LosCabellosDeAbsalon_C6003_CANON.txt

# Consensus Tree: analysis.type = "BCT"

# Distance Table: other viz

# Closed-set or open-set: Conrad_Nostromo_1904

# Stylo without UI---- 
results = stylo(gui = F, 
                  corpus.dir = "corpus", # Path to texts. default "corpus"
                  mfw.min = 100, 
                  mfw.max = 100,
                  mfw.incr = 500, 
                  analysis.type = "CA",
                  # analysis.type = "BCT",  # minimum 3 iterations for a consensus tree
                  corpus.lang = "Spanish",
                  # distance.measure="wurzburg",
                  distance.measure="delta",
                  display.on.screen = T,
                  dendrogram.layout.horizontal = T
)

# Frequencies table and distance table --- 

all_freqs <- as.data.frame(t(results$table.with.all.freqs))
distances <- as.data.frame(t(results$distance.table))

# Plot the distances of one work with respect to the rest

library(tidyverse)

df = select(distances, "calderon_ElPrincipeConstante_C6010_CANON") %>%
  rownames_to_column(., var = "works")

# df = select(distances, "Conrad_Nostromo_1904") %>%
#   rownames_to_column(., var = "works")

# df = df[df[,2] != 0,]  # Remove from the table the work to be compared.

ggplot(df) +
  aes(reorder(works, df[,2]), df[,2], group = 1) +
  geom_line(colour="gray", size=1) + 
  geom_point(size=3) + 
  labs(x = "", y = "", title = "Distance Table") +
  theme(axis.text.x = element_text(angle = 80, hjust = 1), 
        legend.position="none"
  )

# df = top_n(df, 50, df[,2])