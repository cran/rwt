\name{threshold}
\alias{hardTh}
\alias{softTh}
\title{thresholding function}
\description{
  Thresholds the input signal \code{y} with the threshold value \code{thld}.
}
\usage{
hardTh(y, thld)
softTh(y, thld)
}
\arguments{
  \item{y}{1D or 2D signal to be thresholded}
  \item{thld}{Threshold value to be applied}
}
\value{
  \item{x}{Thresholded output}
}
\references{
  \cite{"De-noising via Soft-Thresholding" Tech. Rept. Statistics,
       Stanford, 1992. D.L. Donoho.}
}
\author{P. Roebuck, \email{roebuck@mdanderson.org}}
\examples{
sig <- makesig(SIGNAL.WERNER.SORROWS, 8);
thld <- 1;
x <- rwt:::hardTh(sig$x, thld);
}
\keyword{interface}

