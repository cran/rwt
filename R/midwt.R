###
### $Id: midwt.R 35 2022-05-31 05:53:13Z proebuck $
### Computes the inverse discrete wavelet transform x for a 1D or
###           2D input signal y using the scaling filter h.
###

##-----------------------------------------------------------------------------
midwt <- function(y, h, L) {
    .Call("do_midwt",
          as.matrix(y),
          as.vector(h),
          as.integer(L),
          PACKAGE="rwt")
}

