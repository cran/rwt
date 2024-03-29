###
### $Id: softTh.R 35 2022-05-31 05:53:13Z proebuck $
###

options(warn=1)
library(rwt)


##-----------------------------------------------------------------------------
test.softTh <- function(input, expected) {
   result <- rwt::softTh(input$signal, input$thld)
   identical(all.equal(as.vector(result),
                       expected,
                       tolerance=0.000001),
             TRUE)
}


sig <- rwt::makesig(SIGNAL.DOPPLER, 8)
softTh.expected <- c( 0.0,
                      0.0,
                      0.0,
                     -0.07032041,
                      0.0,
                      0.2000516,
                      0.04826153,
                      0.0)

test.softTh(list(signal = sig$x, thld = 0.2), softTh.expected)

