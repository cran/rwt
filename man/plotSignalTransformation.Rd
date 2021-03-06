% $Id: plotSignalTransformation.Rd 24 2014-06-20 21:02:03Z plroebuck $

\name{plotSignalTransformation}
\alias{plotSignalTransformation}
\title{Plot Signal and its Transform}
\description{
  Plots the signal \code{s} and its transform \code{x} on graphics device.
}
\usage{
plotSignalTransformation(x, s, title, col.x = 'blue', col.s = 'red')
}
\arguments{
  \item{x}{wavelet transformed signal to be plotted}
  \item{s}{original signal to be plotted}
  \item{title}{overall title for the plot}
  \item{col.x}{color to be used for plotting \code{x} values as lines}
  \item{col.s}{color to be used for plotting \code{s} values as lines}
}
\details{
  Used by demo code to display the results of a transformation.
}
\author{
  P. Roebuck \email{proebuck@mdanderson.org}
}
\keyword{hplot}

