\name{daubcqf}
\alias{daubcqf}
\alias{PHASE.MINIMUM}
\alias{PHASE.MID}
\alias{PHASE.MAXIMUM}
\title{filter creation function}
\description{
  Computes the Daubechies' scaling and wavelet filters (normalized to sqrt(2)).
}
\usage{
daubcqf(N, type = PHASE.MINIMUM)
}
\arguments{
  \item{N}{Length of filter (must be even)}
  \item{type}{Distinguishes the minimum phase, maximum phase and mid-phase
solutions. Valid values are:
  \tabular{l}{
    \code{PHASE.MINIMUM}\cr
    \code{PHASE.MID}\cr
    \code{PHASE.MAXIMUM}
  }}
}
\value{
  Returns a list with components:
    \item{h.0}{Minimal phase Daubechies' scaling filter}
    \item{h.1}{Minimal phase Daubechies' wavelet filter}
}
\references{
  \cite{"Orthonormal Bases of Compactly Supported Wavelets", CPAM, Oct.89}
}
\author{P. Roebuck, \email{roebuck@mdanderson.org}}
\examples{
h <- daubcqf(6);
}
\keyword{interface}

