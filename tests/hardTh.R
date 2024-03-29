###
### $Id: hardTh.R 35 2022-05-31 05:53:13Z proebuck $
###

options(warn=1)
library(rwt)


##-----------------------------------------------------------------------------
test.hardTh <- function(input, expected) {
   result <- rwt::hardTh(input$signal, input$thld)
   identical(all.equal(as.vector(result),
                       expected,
                       tolerance=0.000001),
             TRUE)
}


sig <- rwt::makesig(SIGNAL.WERNER.SORROWS, 8)
hardTh.expected <- c( 1.554523,
                      5.317538,
                      0.0,
                      1.695586,
                     -1.267779,
                      0.0,
                      1.733160,
                      0.0)

test.hardTh(list(signal = sig$x, thld = 1), hardTh.expected)

