library(rpart)
library(rpart.plot)
pruned_tree <- prune(tree_model, cp =0.01)

rpart.plot(pruned_tree, extra = 4, cex = 0.45)