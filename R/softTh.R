#
# SOFTTH.R
#

#
# Public
#
##-----------------------------------------------------------------------------
softTh <- function(y, thld) {
    x <- abs(y);
    x <- sign(y) * (x >= thld) * (x - thld); 

    return(x);
}

