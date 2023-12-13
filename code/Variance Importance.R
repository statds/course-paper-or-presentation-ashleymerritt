library(vip)

var_importance <- vip::vip(tree_model)
print(var_importance)