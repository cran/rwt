#
# HARDTH.R
#

library(rwt)

test.hardTh <- function(signal, thld, expected) {
   result <- rwt::hardTh(signal, thld);
   identical(all.equal(as.vector(result),
                       expected,
                       tolerance = 0.000001),
             TRUE);
}

y <- makesig(SIGNAL.WERNER.SORROWS, 8);
thld <- 1;
hardTh.expected <- c( 1.554523,
                      5.317538,
                      0.0,
                      1.695586,
                     -1.267779,
                      0.0,
                      1.733160,
                      0.0);

test.hardTh(y$x, thld, hardTh.expected);

