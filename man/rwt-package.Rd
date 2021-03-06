% $Id: rwt-package.Rd 23 2014-06-20 21:01:04Z plroebuck $

\name{rwt-package}
\alias{rwt-package}
\docType{package}
\title{Rice Wavelet Toolbox wrapper}
\description{
  A package for performing digital signal processing.
}
\details{
  \tabular{ll}{
    Package: \tab rwt\cr
    Type:    \tab Package\cr
    Version: \tab \Sexpr[results=text]{packageDescription("rwt")$Version}\cr
    Date:    \tab \Sexpr[results=text]{packageDescription("rwt")$Date}\cr
    License: \tab \Sexpr[results=text]{packageDescription("rwt")$License}\cr
  }

  For a complete list of functions, use \code{library(help="rwt")}.\cr
  For a high-level summary of the changes for each revision, use
    \code{file.show(system.file("NEWS", package="rwt"))}.
}
\author{
  P. Roebuck \email{proebuck@mdanderson.org}
}
\keyword{package}

