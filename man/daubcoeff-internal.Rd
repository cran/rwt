% $Id: daubcoeff-internal.Rd 24 2014-06-20 21:02:03Z plroebuck $

\name{daubcoeff}
\alias{.getDaubechiesCoefficients}
\title{Daubechies Coefficients}
\description{
  Returns the Daubechies coefficients for given number of coefficients.
}
\usage{
.getDaubechiesCoefficients(N)
}
\arguments{
  \item{N}{numeric scalar specifying number of coefficients desired}
}
\value{
  Returns a vector containing coefficients.
}
\details{
  Supported values of \code{N} are [4|6|8|10|12|14|16|18|20].
}
\references{
  \url{http://cas.ensmp.fr/~chaplais/Wavetour_presentation/Tables/Daubechies/}
}
\author{
  P. Roebuck \email{proebuck@mdanderson.org}
}
\keyword{internal}

