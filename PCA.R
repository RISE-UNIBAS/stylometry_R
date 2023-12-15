# Scrips to perform, visualize and play around with PCA in R

library(stylo)

result <- stylo(gui = F,
                corpus.dir = "corpus/",
                corpus.lang = "Spanish",
                mfw.min = 100, 
                mfw.max = 100,
                #analysis.type = "PCV", # covariance matrix.
                analysis.type = "PCR", # correlation matrix == covariance matrix scaled.
                # pca.visual.flavour = "loadings", # plots also the features.
                pca.visual.flavour = "classic"
                )