#
# MIRDWT.R
#

library(rwt)

test.mirdwt <- function(signal, filter, nlevels, expected) {
   ret.mrdwt <- mrdwt(signal, filter, nlevels);
   yl <- ret.mrdwt$yl
   yh <- ret.mrdwt$yh
   L  <- ret.mrdwt$L
   result <- mirdwt(yl, yh, filter, L);
print(result)
print(expected)
   identical(all.equal(result,
                       expected,
                       tolerance = 1e-17),
             TRUE);
}

sig <- makesig(SIGNAL.LEOPOLD, 8);
h <- daubcqf(4, PHASE.MINIMUM);
L <- 1;

mirdwt.expected <- list(x = matrix(data = c( 8.6736e-018,
                                             1.0000,
                                             8.6736e-018,
                                            -1.3878e-017,
                                             0,
                                             0,
                                             0,
                                            -1.3878e-017),
                                 nrow = 1),
                      L = 1);

test.mirdwt(sig$x, h$h.0, L, mirdwt.expected);

