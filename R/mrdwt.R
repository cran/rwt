###
### $Id: mrdwt.R 35 2022-05-31 05:53:13Z proebuck $
### Computes the redundant discrete wavelet transform y
###           for a 1D or 2D input signal.
###

##-----------------------------------------------------------------------------
mrdwt <- function(x, h, L) {
    .Call("do_mrdwt",
          as.matrix(x),
          as.vector(h),
          as.integer(L),
          PACKAGE="rwt")
}

