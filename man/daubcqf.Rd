% $Id: daubcqf.Rd 48 2022-06-06 21:15:30Z proebuck $

\name{daubcqf}
\alias{daubcqf}
\alias{PHASE.MINIMUM}
\alias{PHASE.MID}
\alias{PHASE.MAXIMUM}
\title{Daubechies Filter Creation}
\description{
  Computes the Daubechies' scaling and wavelet filters (normalized to \eqn{sqrt(2)}).
}
\usage{
daubcqf(N, type = PHASE.MINIMUM)
}
\arguments{
  \item{N}{numeric scalar specifying length of filter (must be even)}
  \item{type}{Distinguishes the minimum phase, maximum phase and mid-phase
solutions. Valid values are:
    \tabular{l}{
      \code{PHASE.MINIMUM}\cr
      \code{PHASE.MID}\cr
      \code{PHASE.MAXIMUM}
    }
  }
}
\value{
  Returns a list with components:
    \item{h.0}{minimal phase Daubechies' scaling filter}
    \item{h.1}{minimal phase Daubechies' wavelet filter}
}
\references{
  Ingrid Daubechies\cr
  \emph{Orthonormal Bases of Compactly Supported Wavelets}\cr
  CPAM (Oct. 1988), 7(41), 909-996\cr
  \doi{10.1002/cpa.3160410705}
}
\author{
  P. Roebuck \email{proebuck1701@gmail.com}
}
\examples{
h <- daubcqf(6)
}
\keyword{interface}

