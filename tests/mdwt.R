#
# MDWT.R
#

library(rwt)

test.mdwt <- function(signal, filter, nlevels, expected) {
   result <- mdwt(signal, filter, nlevels);
   identical(all.equal(result,
                       expected,
                       tolerance = 0.000001),
             TRUE);
}

sig <- makesig(SIGNAL.LIN.CHIRP, 8);
h <- daubcqf(4, PHASE.MINIMUM);
L <- 2;

mdwt.expected <- list(y = matrix(data = c( 1.109692,
                                           0.8766618,
                                           0.8203919,
                                          -0.5200741,
                                          -0.03392767,
                                           0.1001107,
                                           0.2200882,
                                          -0.1400816),
                                 nrow = 1),
                      L = 2);

test.mdwt(sig$x, h$h.0, L, mdwt.expected);

