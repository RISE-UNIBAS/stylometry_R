### -------------------------------- ###
###         Stylo Scripts            ###
### -------------------------------- ###

# For stylo documentation. After loading package, type in console: ?stylo

# For more documentation see the resources page at:<https://computationalstylistics.github.io/resources/>

# install.packages("stylo")
library(stylo)

# Stylo with GUI. Atention! Mac Users install first XQuartz <https://www.xquartz.org>

# Texts inside a folder called corpus.
# File names must follow the pattern "author_work.txt".
# Some resulting files will be created in the parent folder.

# Set working directory to the folder with the corpus
# setwd("~/your_path")

stylo()
