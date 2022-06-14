###
### $Id: daubcqf.R 35 2022-05-31 05:53:13Z proebuck $
###

options(warn=1)
library(rwt)


##-----------------------------------------------------------------------------
test.daubcqf <- function(input, expected) {
   result <- daubcqf(input$N, input$type)
   identical(all.equal(result,
                       expected,
                       tolerance=0.0000001),
             TRUE)
}


daubcqf.expected <- list(h.0 = c( 0.4829629,
                                  0.8365163,
                                  0.2241439,
                                 -0.1294095),
                         h.1 = c( 0.1294095,
                                  0.2241439,
                                 -0.8365163,
                                  0.4829629))

test.daubcqf(list(N = 4, type = PHASE.MINIMUM), daubcqf.expected)

