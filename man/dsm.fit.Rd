\name{dsm.fit}
\alias{dsm.fit}
\title{Fits a GAM to segment-specific estimates of abundance
resulting from object-specific detection probabilities}
\usage{
  dsm.fit(ddfobject, phat = NULL, response, formula,
    model.defn = list(fn = "gam", family = "quasipoisson"),
    obsdata, segdata, wghts = NULL, link = "log",
    convert.units = 1, ...)
}
\arguments{
  \item{ddfobject}{result from call to \code{ddf}; might be
  usurpt by the \code{phat} argument below.  If
  \code{ddfobject} is set to \code{NULL} when strip
  transects are analyzed}

  \item{phat}{if present, represents estimated detection
  probabilities for each object present in the project
  database. This breaks the obligation that detection
  functions for use in \code{dsm} need come from
  \code{mrds}.}

  \item{response}{response to be modelled; choices are:
  \tabular{ll}{\code{group} \tab \cr \code{indiv} \tab \cr
  \code{group.est} \tab \cr \code{indiv.est} \tab \cr
  \code{group.den} \tab \cr \code{indiv.den} \tab \cr}}

  \item{formula}{formula for the surface. This should be a
  valid \code{glm} or \code{gam} formula. In the GAM case,
  the \code{s} term should include basis definition
  (\code{bs} and \code{k} terms). If the soap film smoother
  is to be used (\code{bs="so"}), it must include
  \code{xt=list(bnd=bnd)} for the boundary, in this case
  the \code{k} parameter gives the complexity of the
  boundary smoother. See
  \code{\link{smooth.construct.so.smooth.spec}} for further
  details.}

  \item{model.defn}{a list comprised of
  \tabular{ll}{\code{function} \tab "gam" or "glm" \cr
  \code{family} \tab a \code{\link{family}} name (in
  quotes) for the response (link function definition
  follows) \cr \code{family.pars} \tab a list of named
  parameters for the family specified, can be
  \code{NULL}\cr \code{bnd} \tab Only required for soap
  film smoothers.  A list with two elements, x and y which
  are the vertices of the boundary polygon see
  \code{\link{smooth.construct.so.smooth.spec}}\cr
  \code{knots} \tab Only required for soap film smoothers.
  Internal knots for the soap film smoother.}}

  \item{obsdata}{observation data, see
  \code{\link{dsm-data}}.}

  \item{segdata}{segment data, see \code{\link{dsm-data}}.}

  \item{wghts}{weights, directly passed to \code{gam} or
  \code{glm}.}

  \item{link}{link function, merged with \code{family} via
  \code{eval(paste())}.}

  \item{convert.units}{value to alter length to width for
  calculation of the offset.}
}
\value{
  fit a list, consisting of: \tabular{ll}{\code{result}
  \tab object produced by the \code{gam} or \code{glm}
  call.\cr \code{call.dsm} \tab the call to this function.}
}
\description{
  Function constructs and then invokes a call to
  \code{gam()} and returns the result of the fitting of the
  density surface model.
}
\note{
  Note that the gamma parameter to \code{gam()} is
  hardwired here; set to a value of 1.4 (from advice in
  Wood (2006)) such that the \code{gam()} is inclined to
  not 'overfit.'
}
\author{
  Eric Rexstad, David L. Miller
}
\references{
  Hedley, S. and S. T. Buckland. 2004. Spatial models for
  line transect sampling. JABES 9:181-199.

  Wood, S.N. 2006. Generalized Additive Models: An
  Introduction with R. CRC/Chapman & Hall.
}
