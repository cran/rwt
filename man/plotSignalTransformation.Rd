\name{plotSignalTransformation}
\alias{plotSignalTransformation}
\title{plot function}
\description{
  Plots the signal \code{s} and its transform \code{x} on graphics device.
}
\usage{
plotSignalTransformation(x, s, title, col.x = 'blue', col.s = 'red')
}
\arguments{
  \item{x}{Wavelet transformed signal to be plotted}
  \item{s}{Original signal to be plotted}
  \item{title}{Overall title for the plot}
  \item{col.x}{Color to be used for plotting \code{x} values as lines}
  \item{col.s}{Color to be used for plotting \code{s} values as lines}
}
\details{
  Used by demo code to display the results of a transformation.
}
\author{P. Roebuck, \email{roebuck@mdanderson.org}}
\keyword{interface}

