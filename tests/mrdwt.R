#
# MRDWT.R
#

library(rwt)

test.mrdwt <- function(signal, filter, nlevels, expected) {
   result <- mrdwt(signal, filter, nlevels);
   identical(all.equal(result,
                       expected,
                       tolerance = 0.0000001),
             TRUE);
}

sig <- makesig(SIGNAL.LEOPOLD, 8);
h <- daubcqf(4, PHASE.MINIMUM);
L <- 1;

mrdwt.expected <- list(yl = matrix(data = c( 0.8365163,
                                             0.4829629,
                                             0,
                                             0,
                                             0,
                                             0,
                                            -0.1294095,
                                             0.2241439)),
                       yh = matrix(data = c(-0.2241439,
                                            -0.1294095,
                                             0,
                                             0,
                                             0,
                                             0,
                                            -0.4829629,
                                             0.8365163)),
                       L = 1);

test.mrdwt(sig$x, h$h.0, L, mrdwt.expected);

