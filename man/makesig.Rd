\name{makesig}
\alias{makesig}
\alias{SIGNAL.ALL}
\alias{SIGNAL.HEAVI.SINE}
\alias{SIGNAL.BUMPS}
\alias{SIGNAL.BLOCKS}
\alias{SIGNAL.DOPPLER}
\alias{SIGNAL.RAMP}
\alias{SIGNAL.CUSP}
\alias{SIGNAL.SING}
\alias{SIGNAL.HI.SINE}
\alias{SIGNAL.LO.SINE}
\alias{SIGNAL.LIN.CHIRP}
\alias{SIGNAL.TWO.CHIRP}
\alias{SIGNAL.QUAD.CHIRP}
\alias{SIGNAL.MISH.MASH}
\alias{SIGNAL.WERNER.SORROWS}
\alias{SIGNAL.LEOPOLD}
\title{make signal function}
\description{
  Creates artificial test signal identical to the standard test signals proposed
  and used by D. Donoho and I. Johnstone in WaveLab (a MATLAB toolbox developed
  by Donoho et al. the statistics department at Stanford University).
}
\usage{
makesig(sigName, N)
}
\arguments{
  \item{sigName}{Name of desired signal. Valid values are:
  \tabular{l}{
    SIGNAL.ALL\cr
    SIGNAL.HEAVI.SINE\cr
    SIGNAL.BUMPS\cr
    SIGNAL.BLOCKS\cr
    SIGNAL.DOPPLER\cr
    SIGNAL.RAMP\cr
    SIGNAL.CUSP\cr
    SIGNAL.SING\cr
    SIGNAL.HI.SINE\cr
    SIGNAL.LO.SINE\cr
    SIGNAL.LIN.CHIRP\cr
    SIGNAL.TWO.CHIRP\cr
    SIGNAL.QUAD.CHIRP\cr
    SIGNAL.MISH.MASH\cr
    SIGNAL.WERNER.SORROWS (Heisenburg)\cr
    SIGNAL.LEOPOLD (Kronecker)
  }}
  \item{N}{Length in samples of desired signal (512 by default)}
}
\value{
  Returns a list with components:
    \item{x}{vector (or matrix) of test signals}
    \item{N}{length of signal returned}
}
\references{ ~put references to the literature/web site here ~ }
\author{P. Roebuck, \email{roebuck@mdanderson.org}}
\note{
Using the value \code{SIGNAL.ALL.SIG} for \var{sigName} returns a matrix 
containing the vectors of all the other signals.
}

\examples{
ret.sig <- makesig(SIGNAL.DOPPLER, 32)
}
\keyword{interface}
