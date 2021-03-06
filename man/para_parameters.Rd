% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/parameters.R
\docType{data}
\name{dropout}
\alias{dropout}
\alias{para_parameters}
\alias{epochs}
\alias{activation}
\alias{mixture}
\alias{penalty}
\alias{rbf_sigma}
\alias{prod_degree}
\alias{num_terms}
\alias{num_comp}
\alias{cost}
\alias{degree}
\alias{deg_free}
\alias{hidden_units}
\title{Parameter objects related to parametric models.}
\format{An object of class \code{quant_param} (inherits from \code{param}) of length 6.}
\usage{
dropout

epochs

activation

mixture

penalty

rbf_sigma

prod_degree

num_terms

num_comp

cost

degree

deg_free

hidden_units
}
\value{
Each object is generated by either \code{new_quant_param} or
\code{new_qual_param}.
}
\description{
These are objects that can be used for modeling, especially in conjunction
with the \pkg{parsnip} package.
}
\details{
These objects are pre-made parameter sets that are useful when the model is
based on some type of slope/intercept model.
\itemize{
\item \code{penalty}: The total amount of regularization used. This is used by
\code{parsnip::linear_reg()} and \code{parsnip::logistic_reg()} with glmnet models.
\item \code{mixture}: the proportion of L1 regularization in the model.
(\code{parsnip::linear_reg()} and \code{parsnip::logistic_reg()})
\item \code{dropout}: the parameter dropout rate. (\code{parsnip:::mlp()})
\item \code{epochs}: the number of iterations of training. (\code{parsnip:::mlp()})
\item \code{activation}: the type of activation function between network layers.
(\code{parsnip:::mlp()})
\item \code{hidden_units}: the number of hidden units in a network layer.
(\code{parsnip:::mlp()})
\item \code{rbf_sigma}: the sigma parameters of a radial basis function.
\item \code{cost}: a cost value for SVM models.
\item \code{degree}: the polynomial degree.
\item \code{prod_degree}: the number of terms to combine into interactions. A value of
1 implies an additive model. Useful for MARS models.
\item \code{num_terms}: a nonspecific parameter for the number of terms in a model.
This can be used with models that include feature selection, such as MARS.
\item \code{num_comp}: the number of components in a model (e.g. PCA or PLS components).
\item \code{deg_free}: a parameter for the degrees of freedom.
}
}
\keyword{datasets}
