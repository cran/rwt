\name{daubcoeff}
\alias{.getDaubechiesCoefficients}
\title{daubechies coefficients function}
\description{
  Returns the Daubechies coefficients for given number of coefficients.
}
\usage{
.getDaubechiesCoefficients(N)
}
\arguments{
  \item{N}{Number of coefficients desired}
}
\value{
  Returns a vector containing coefficients.
}
\details{
  Supported values of \code{N} are [4|6|8|10|12|14|16|18|20].
}
\author{P. Roebuck, \email{roebuck@mdanderson.org}}
\keyword{internal}

