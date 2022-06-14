###
### $Id: softTh.R 35 2022-05-31 05:53:13Z proebuck $
###

##
## Public
##

##-----------------------------------------------------------------------------
softTh <- function(y, thld) {
    x <- abs(y)
    x <- sign(y) * (x >= thld) * (x - thld)

    x
}

