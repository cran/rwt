#
# SOFTTH.R
#

library(rwt)

test.softTh <- function(signal, thld, expected) {
   result <- rwt::softTh(signal, thld);
   identical(all.equal(as.vector(result),
                       expected,
                       tolerance = 0.000001),
             TRUE);
}

sig <- makesig(SIGNAL.DOPPLER, 8);
thld <- 0.2;
softTh.expected <- c( 0.0,
                      0.0,
                      0.0,
                     -0.07032041,
                      0.0,
                      0.2000516,
                      0.04826153,
                      0.0);

test.softTh(sig$x, thld, softTh.expected);

