#
# MIDWT.R - Computes the inverse discrete wavelet transform x for a 1D or
#           2D input signal y using the scaling filter h.
#

##-----------------------------------------------------------------------------
midwt <- function(y, h, L)
    .Call("rwt_midwt",
          as.matrix(y),
          as.vector(h),
          as.integer(L),
          PACKAGE="rwt");

