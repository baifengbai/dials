#' Parameter objects related to tree- and rule-based models.
#' 
#' These are objects that can be used for modeling, especially in conjunction
#'  with the \pkg{parsnip} package.  
#' 
#' @details 
#' These objects are pre-made parameter sets that are useful when the model is
#'  based on trees or rules. 
#' 
#' * `mtry` and `mtry_long`: The number of predictors that will be randomly 
#'   sampled at each split when creating the tree models. The latter uses a
#'   log transformation and is helpful when the data set has a large number of
#'   columns. `mtry` is used by \pkg{parsnip}'s `parsnip::rand_forest()` function. 
#' * `trees`: The number of trees contained in a random forest or boosted 
#'   ensemble. In the latter case, this is equal to the number of boosting 
#'   iterations. (see `parsnip::rand_forest()` and `parsnip::boost_tree()`)
#'   functions. 
#' * `min_n`: The minimum number of data points in a node that are required 
#'   for the node to be split further. (`parsnip::rand_forest()` and 
#'   `parsnip::boost_tree()`) 
#' * `sample_size`: the size of the data set used for modeling within an 
#'   iteration of the modeling algorithm, such as stochastic gradient boosting.
#'   (`parsnip::boost_tree()`) 
#' * `learn_rate`: the rate at which the boosting algorithm adapts from 
#'   iteration-to-iteration. (`parsnip::boost_tree()`) 
#' * `loss_reduction`:  The reduction in the loss function required to split 
#'   further. (`parsnip::boost_tree()`) 
#' * `tree_depth`: The maximum depth of the tree (i.e. number of splits).
#'   (`parsnip::boost_tree()`) 
#' * `prune`: a logical for whether a tree or set of rules should be pruned. 
#' * `Cp`: The cost-complexity parameter in classical CART models. 
#'
#' @return Each object is generated by either `new_quant_param` or 
#' `new_qual_param`. 
#' 
#' @aliases tree_parameters
#' @export
#' @rdname tree_parameters
mtry <-
  new_quant_param(
    type = "integer",
    range = c(1L, unknown()),
    inclusive = c(TRUE, TRUE),
    trans = NULL,
    label = c(mtry = "# Randomly Selected Predictors")
  )

#' @export
#' @rdname tree_parameters
mtry_long <-
  new_quant_param(
    type = "integer",
    range = c(0L, unknown()),
    inclusive = c(TRUE, TRUE),
    trans = log10_trans(),
    label = c(mtry_long = "# Randomly Selected Predictors")
  )

#' @rdname tree_parameters
#' @export
trees <-
  new_quant_param(
    type = "integer",
    range = c(1L, 2000L),
    inclusive = c(TRUE, TRUE),
    trans = NULL,
    label = c(trees = "# Trees")
  )

#' @rdname tree_parameters
#' @export
min_n <-
  new_quant_param(
    type = "integer",
    range = c(2L, unknown()),
    inclusive = c(TRUE, TRUE),
    trans = NULL,
    label = c(min_n = "Minimal Node Size")
  )

#' @rdname tree_parameters
#' @export
sample_size <-
  new_quant_param(
    type = "integer",
    range = c(unknown(), unknown()),
    inclusive = c(TRUE, TRUE),
    trans = NULL,
    label = c(sample_size = "# Observations Sampled")
  )

#' @rdname tree_parameters
#' @export
learn_rate <-
  new_quant_param(
    type = "double",
    range = c(unknown(), unknown()),
    inclusive = c(TRUE, TRUE),
    trans = NULL,
    label = c(learn_rate = "Learning Rate")
  )


#' @rdname tree_parameters
#' @export
loss_reduction <-
  new_quant_param(
    type = "double",
    range = c(unknown(), unknown()),
    inclusive = c(TRUE, TRUE),
    trans = NULL,
    label = c(loss_reduction = "Minimum Loss Reduction")
  )

#' @rdname tree_parameters
#' @export
tree_depth <-
  new_quant_param(
    type = "integer",
    range = c(2L, 15L),
    inclusive = c(TRUE, TRUE),
    trans = NULL,
    label = c(tree_depth = "Tree Depth")
  )

#' @export
#' @rdname tree_parameters
prune <-
  new_qual_param(
    type = "logical",
    values = c(TRUE, FALSE),
    label = c(prune = "Pruning")
  )

#' @export
#' @rdname tree_parameters
Cp <-
  new_quant_param(
    type = "double",
    range = c(-10, -1),
    inclusive = c(TRUE, TRUE),
    trans = log10_trans(),
    label = c(Cp = "Cost-Complexity Parameter")
  )

###################################################################

#' Parameter objects related to parametric models.
#' 
#' These are objects that can be used for modeling, especially in conjunction
#'  with the \pkg{parsnip} package.  
#' 
#' @details 
#' These objects are pre-made parameter sets that are useful when the model is
#'  based on some type of slope/intercept model. 
#' 
#' * `penalty`: The total amount of regularization used. This is used by 
#'   `parsnip::linear_reg()` and `parsnip::logistic_reg()` with glmnet models. 
#' * `mixture`: the proportion of L1 regularization in the model. 
#'   (`parsnip::linear_reg()` and `parsnip::logistic_reg()`)
#' * `dropout`: the parameter dropout rate. (`parsnip:::mlp()`)
#' * `epochs`: the number of iterations of training. (`parsnip:::mlp()`)
#' * `activation`: the type of activation function between network layers. 
#'    (`parsnip:::mlp()`)
#' * `hidden_units`: the number of hidden units in a network layer. 
#'    (`parsnip:::mlp()`)
#' * `rbf_sigma`: the sigma parameters of a radial basis function. 
#' * `cost`: a cost value for SVM models. 
#' * `degree`: the polynomial degree. 
#' * `prod_degree`: the number of terms to combine into interactions. A value of
#'    1 implies an additive model. Useful for MARS models. 
#' * `num_terms`: a nonspecific parameter for the number of terms in a model. 
#'   This can be used with models that include feature selection, such as MARS. 
#' * `num_comp`: the number of components in a model (e.g. PCA or PLS components).
#' * `deg_free`: a parameter for the degrees of freedom. 
#' @return Each object is generated by either `new_quant_param` or 
#' `new_qual_param`. 
#' @aliases para_parameters
#' @rdname para_parameters
#' @export
#' @export
dropout <-
  new_quant_param(
    type = "double",
    range = c(0, 1),
    inclusive = c(TRUE, FALSE),
    trans = NULL,
    label = c(dropout = "Dropout Rate")
  )

#' @rdname para_parameters
#' @export
epochs <-
  new_quant_param(
    type = "integer",
    range = c(1L, 1000L),
    inclusive = c(TRUE, TRUE),
    trans = NULL,
    label = c(epochs = "# Epochs")
  )

#' @rdname para_parameters
#' @export
activation <-
  new_qual_param(
    type = "character",
    values = c("linear", "softmax", "relu", "elu"),
    label = c(activation = "Activation Function")
  )

#' @rdname para_parameters
#' @export
mixture <- 
  new_quant_param(
    type = "double",
    range = 0:1,
    inclusive = c(TRUE, TRUE),
    trans = NULL,
    label = c(mixture = "% lasso Penalty")
  )

#' @rdname para_parameters
#' @export
penalty <- 
  new_quant_param(
    type = "double",
    range = c(-10, 0),
    inclusive = c(TRUE, TRUE),
    trans = log10_trans(),
    label = c(penalty = "Amount of Regularization")
  )

#' @export
#' @rdname para_parameters
rbf_sigma <-
  new_quant_param(
    type = "double",
    range = c(-10, 0),
    inclusive = c(TRUE, TRUE),
    trans = log10_trans(),
    label = c(rbf_sigma = "Radial Basis Function sigma")
  )

#' @export
#' @rdname para_parameters
prod_degree <-
  new_quant_param(
    type = "integer",
    range = 1:2,
    inclusive = c(TRUE, TRUE),
    trans = NULL,
    label = c(prod_degree = "Degree of Interaction")
  )

#' @export
#' @rdname para_parameters
num_terms <-
  new_quant_param(
    type = "integer",
    range = c(1L, unknown()),
    inclusive = c(TRUE, TRUE),
    trans = NULL,
    label = c(num_terms = "# Model Terms")
  )

#' @export
#' @rdname para_parameters
num_comp <-
  new_quant_param(
    type = "integer",
    range = c(1L, unknown()),
    inclusive = c(TRUE, TRUE),
    trans = NULL,
    label = c(num_comp = "# Components")
  )

#' @export
#' @rdname para_parameters
cost <-
  new_quant_param(
    type = "double",
    range = c(-10, -1),
    inclusive = c(TRUE, TRUE),
    trans = log2_trans(),
    label = c(cost = "Cost")
  )

#' @export
#' @rdname para_parameters
degree <-
  new_quant_param(
    type = "double",
    range = c(1, 3),
    inclusive = c(TRUE, TRUE),
    trans = NULL,
    label = c(degree = "Polynomial Degree")
  )

#' @export
#' @rdname para_parameters
deg_free <-
  new_quant_param(
    type = "double",
    range = c(1, 5),
    inclusive = c(TRUE, TRUE),
    trans = NULL,
    label = c(deg_free = "Degrees of Freedom")
  )

#' @export
#' @rdname para_parameters
hidden_units <-
  new_quant_param(
    type = "integer",
    range = c(1L, 10),
    inclusive = c(TRUE, TRUE),
    trans = NULL,
    label = c(hidden_units = "# Hidden Units")
  )

###################################################################

#' Parameter objects related to miscellaneous models.
#' 
#' These are objects that can be used for modeling, especially in conjunction
#'  with the \pkg{parsnip} package.  
#' 
#' @details 
#' These objects are pre-made parameter sets that are useful in a variety of 
#' models. 
#' 
#' * `weight_func`: The type of kernel function that weights the distances
#'    between samples (e.g. in a K-near neighbors model). 
#' * `surv_dist`: the statistical distribution of the data in a survival 
#'   analysis model (e.g. `parsnip::surv_reg()`) .
#' * `Laplace`: the Laplace correction used to smooth low-frequency counts. 
#' * `neighbors`: a parameter for the number of neighbors used in a prototype 
#'   model. 
#' @return Each object is generated by either `new_quant_param` or 
#' `new_qual_param`. 
#' @aliases misc_parameters
#' @rdname misc_parameters
#' @export
weight_func <-
  new_qual_param(
    type = "character",
    values = c("rectangular", "triangular", "epanechnikov", "biweight", 
               "triweight", "cos", "inv", "gaussian", "rank", "optimal"),
    label = c(weight_func = "Distance Weighting Function")
  )

# in reference to survival::survreg
#' @rdname misc_parameters
#' @export
surv_dist <-
  new_qual_param(
    type = "character",
    values = c("weibull", "exponential", "gaussian", "logistic", 
               "lognormal", "loglogistic"),
    label = c(surv_dist = "Distribution")
  )



#' @export
#' @rdname misc_parameters
Laplace <-
  new_quant_param(
    type = "double",
    range = c(0, 3),
    inclusive = c(TRUE, TRUE),
    trans = NULL,
    default = 0,
    label = c(Laplace = "Laplace Correction")
  )


#' @export
#' @rdname misc_parameters
neighbors <-
  new_quant_param(
    type = "integer",
    range = c(1L, unknown()),
    inclusive = c(TRUE, TRUE),
    trans = NULL,
    label = c(neighbors = "# Nearest Neighbors")
  )
