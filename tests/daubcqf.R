#
# DAUBCQF.R
#

library(rwt)

test.daubcqf <- function(len, type, expected) {
   result <- daubcqf(len, type);
   identical(all.equal(result,
                       expected,
                       tolerance = 0.0000001),
             TRUE);
}

N <- 4;
daubcqf.expected <- list(h.0 = c( 0.4829629,
                                  0.8365163,
                                  0.2241439,
                                 -0.1294095),
                         h.1 = c( 0.1294095,
                                  0.2241439,
                                 -0.8365163,
                                  0.4829629));

test.daubcqf(N, PHASE.MINIMUM, daubcqf.expected);

