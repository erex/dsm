\name{dsm.check}
\alias{dsm.check}
\title{Do some rudimentary checks for a \code{dsm} model.}
\usage{
  dsm.check(dsm.obj,
    type = c("deviance", "pearson", "response"), rep = 0,
    level = 0.9, rl.col = 2, rep.col = "gray80",
    loess = TRUE, x.name = "x", y.name = "y", gam.k = 30,
    vario.max = 100, ...)
}
\arguments{
  \item{dsm.obj}{object resulting from a call to
  \code{\link{dsm.fit}}.}

  \item{type}{the type of residuals to use for all of the
  plots.}

  \item{rep}{argument to be passed to \code{\link{qq.gam}}
  (default 0).}

  \item{level}{argument to be passed to
  \code{\link{qq.gam}} (default 0.9).}

  \item{rl.col}{argument to be passed to
  \code{\link{qq.gam}} (default 2).}

  \item{rep.col}{argument to be passed to
  \code{\link{qq.gam}} (default "gray80").}

  \item{loess}{should the LOESS smooth through the
  scale-location plot be shown? (default \code{TRUE}).}

  \item{x.name}{name of the \code{x} coordinate in the data
  (default "x").}

  \item{y.name}{name of the \code{y} coordinate in the data
  (default "y").}

  \item{gam.k}{complexity of the \code{\link{gam}} to be
  fitted to the residuals, see \code{\link{choose.k}} for
  more information (default 30).}

  \item{vario.max}{maximum distance for the variogram;
  points further than this distance apart will be ignored,
  see \code{\link{variog}} (default 100).}

  \item{...){}{}
}
\value{
  a plot!
}
\description{
  Produces four plots: quantile-quantile plot,
  scale-location plot (optionally with LOESS line), fit to
  the residuals and empirical variogram.
}
\author{
  David L. Miller
}
