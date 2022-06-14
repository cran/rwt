###
### $Id: mirdwt.R 35 2022-05-31 05:53:13Z proebuck $
### Computes the inverse redundant discrete wavelet 
###            transform x for a 1D or 2D input signal.
###

##-----------------------------------------------------------------------------
mirdwt <- function(yl, yh, h, L) {
    .Call("do_mirdwt",
          as.matrix(yl),
          as.matrix(yh),
          as.vector(h),
          as.integer(L),
          PACKAGE="rwt")
}

