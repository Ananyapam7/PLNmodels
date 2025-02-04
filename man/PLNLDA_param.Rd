% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/PLNLDA.R
\name{PLNLDA_param}
\alias{PLNLDA_param}
\title{Control of a PLNLDA fit}
\usage{
PLNLDA_param(
  backend = c("nlopt", "torch"),
  trace = 1,
  covariance = c("full", "diagonal", "spherical"),
  config_post = list(),
  config_optim = list(),
  inception = NULL
)
}
\arguments{
\item{backend}{optimization back used, either "nlopt" or "torch". Default is "nlopt"}

\item{trace}{a integer for verbosity.}

\item{covariance}{character setting the model for the covariance matrix. Either "full", "diagonal" or "spherical". Default is "full".}

\item{config_post}{a list for controlling the post-treatments (optional bootstrap, jackknife, R2, etc.). See details}

\item{config_optim}{a list for controlling the optimizer (either "nlopt" or "torch" backend). See details}

\item{inception}{Set up the parameters initialization: by default, the model is initialized with a multivariate linear model applied on
log-transformed data, and with the same formula as the one provided by the user. However, the user can provide a PLNfit (typically obtained from a previous fit),
which sometimes speeds up the inference.}
}
\value{
list of parameters configuring the fit.
}
\description{
Helper to define list of parameters to control the PLNLDA fit. All arguments have defaults.
}
\details{
The list of parameters \code{config_optim} controls the optimizers. When "nlopt" is chosen the following entries are relevant
\itemize{
\item "algorithm" the optimization method used by NLOPT among LD type, e.g. "CCSAQ", "MMA", "LBFGS". See NLOPT documentation for further details. Default is "CCSAQ".
\item "maxeval" stop when the number of iteration exceeds maxeval. Default is 10000
\item "ftol_rel" stop when an optimization step changes the objective function by less than ftol multiplied by the absolute value of the parameter. Default is 1e-8
\item "xtol_rel" stop when an optimization step changes every parameters by less than xtol multiplied by the absolute value of the parameter. Default is 1e-6
\item "ftol_abs" stop when an optimization step changes the objective function by less than ftol_abs. Default is 0.0 (disabled)
\item "xtol_abs" stop when an optimization step changes every parameters by less than xtol_abs. Default is 0.0 (disabled)
\item "maxtime" stop when the optimization time (in seconds) exceeds maxtime. Default is -1 (disabled)
}

When "torch" backend is used, with the following entries are relevant:
\itemize{
\item "maxeval" stop when the number of iteration exceeds maxeval. Default is 10000
\item "ftol_rel" stop when an optimization step changes the objective function by less than ftol multiplied by the absolute value of the parameter. Default is 1e-8
\item "xtol_rel" stop when an optimization step changes every parameters by less than xtol multiplied by the absolute value of the parameter. Default is 1e-6
}

The list of parameters \code{config_post} controls the post-treatment processing, with the following entries:
\itemize{
\item jackknife boolean indicating whether jackknife should be performed to evaluate bias and variance of the model parameters. Default is FALSE.
\item bootstrap integer indicating the number of bootstrap resamples generated to evaluate the variance of the model parameters. Default is 0 (inactivated).
\item variational_var boolean indicating whether variational Fisher information matrix should be computed to estimate the variance of the model parameters (highly underestimated). Default is TRUE.
\item rsquared boolean indicating whether approximation of R2 based on deviance should be computed. Default is TRUE
}
}
