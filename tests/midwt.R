#
# MIDWT.R
#

library(rwt)

test.midwt <- function(signal, filter, nlevels, expected) {
   ret.mdwt <- mdwt(signal, filter, nlevels);
   y <- ret.mdwt$y
   L <- ret.mdwt$L
   result <- midwt(y, filter, L);
   identical(all.equal(result,
                       expected,
                       tolerance = 0.000001),
             TRUE);
}

sig <- makesig(SIGNAL.LIN.CHIRP, 8);
h <- daubcqf(4, PHASE.MINIMUM);
L <- 1;

midwt.expected <- list(x = matrix(data = c( 0.04906767,
                                            0.1950903,
                                            0.4275551,
                                            0.7071068,
                                            0.941544,
                                            0.9807853,
                                            0.671559,
                                            0.0000),
                                 nrow = 1),
                      L = 1);

test.midwt(sig$x, h$h.0, L, midwt.expected);

