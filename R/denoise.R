#
# DENOISE.R
#

# Enumerated Values
DWT.TRANSFORM.TYPE <- as.integer(0);
UDWT.TRANSFORM.TYPE <- as.integer(1);

MAD.VARIANCE.ESTIMATOR <- as.integer(0);	# mean absolute deviation
STD.VARIANCE.ESTIMATOR <- as.integer(1);	# classical numerical std estimate

SOFT.THRESHOLD.TYPE <- as.integer(0);
HARD.THRESHOLD.TYPE <- as.integer(1);

# Sentinel Values
MAX.DECOMPOSITION <- 0;
CALC.THRESHOLD.TO.USE <- 0;

# Constants
DEFAULT.DWT.THRESHOLD.MULTIPLIER <- 3.0;
DEFAULT.UDWT.THRESHOLD.MULTIPLIER <- 3.6;

default.dwt.option <-
    list(threshold.low.pass.part  = FALSE,
         threshold.multiplier     = DEFAULT.DWT.THRESHOLD.MULTIPLIER,
         variance.estimator       = MAD.VARIANCE.ESTIMATOR,
         threshold.type           = SOFT.THRESHOLD.TYPE,
         num.decompression.levels = MAX.DECOMPOSITION,
         threshold                = CALC.THRESHOLD.TO.USE);

default.udwt.option <-
    list(threshold.low.pass.part  = FALSE,
         threshold.multiplier     = DEFAULT.UDWT.THRESHOLD.MULTIPLIER,
         variance.estimator       = MAD.VARIANCE.ESTIMATOR,
         threshold.type           = HARD.THRESHOLD.TYPE,
         num.decompression.levels = MAX.DECOMPOSITION,
         threshold                = CALC.THRESHOLD.TO.USE);

#
# Public
#
##------------------------------------------------------------------------------
denoise <- function(x, h, type, option) {
    cat("start denoising via wavelet transform", "\n")
    .validate.denoise.args(x, h, type, option);

    res <- if (type == DWT.TRANSFORM.TYPE) {
               .dwt(x, h, option);
           } else {
               .udwt(x, h, option);
           }

    option <- c(option, type = type);
    option$threshold <- res$thld;

    cat("end denoising via wavelet transform", "\n")
    return(list(xd     = res$xd,
                xn     = x - res$xd,
                option = option));
}


##------------------------------------------------------------------------------
denoise.dwt <- function(x, h, option = default.dwt.option) {
    cat("start decimated wavelet transform", "\n")
    return(denoise(x, h, DWT.TRANSFORM.TYPE, option));
}


##------------------------------------------------------------------------------
denoise.udwt <- function(x, h, option = default.udwt.option) {
    cat("start undecimated wavelet transform", "\n")
    return(denoise(x, h, UDWT.TRANSFORM.TYPE, option));
}


#
# Private
#
##------------------------------------------------------------------------------
.dwt <- function(x, h, option) {
    initValues <- .init.denoise(x, option$num.decompression.levels);
    mx    <- initValues$mx;
    nx    <- initValues$nx;
    dimen <- initValues$dimen;
    n     <- initValues$n;
    L     <- initValues$L;

    ret.mdwt <- mdwt(x, h, L);
    xd <- ret.mdwt$y;
    rm(ret.mdwt);

    if (option$threshold == CALC.THRESHOLD.TO.USE) {
        tmp <- xd[(floor(mx/2)+1):mx, (floor(nx/2)+1):nx];
cat("tmp =", tmp, "\n");
        if (option$variance.estimator == MAD.VARIANCE.ESTIMATOR) {
cat("abs(tmp) =", abs(tmp), "\n");
cat("median(abs(tmp)) =", median(abs(tmp)), "\n");

            thld = option$threshold.multiplier * median(abs(tmp)) / 0.67;
        } else if (option$variance.estimator == STD.VARIANCE.ESTIMATOR) {
            thld = option$threshold.multiplier * std(tmp);
        } else {
            stop("Unknown variance estimator - use either MAD or STD");
        }
    } else {
        thld <- option$threshold;
    }
cat("thld =", thld, "\n");

    if (dimen == 1) {
        ix <- 1:n / (2^L);
        ykeep <- xd[ix];
    } else {
        ix <- 1:mx / (2^L);
        jx <- 1:nx / (2^L);
        ykeep <- xd[ix, jx];
    }

    if (option$threshold.type == SOFT.THRESHOLD.TYPE) {
        xd <- softTh(xd, thld);
    } else if (option$threshold.type == HARD.THRESHOLD.TYPE) {
        xd <- hardTh(xd, thld);
    } else {
        stop("Unknown threshold type - use either Soft or Hard");
    }

    if (option$threshold.low.pass.part == FALSE) {
        if (dimen == 1) {
            xd[ix] = ykeep;
        } else {
            xd[ix, jx] = ykeep;
        }
    }

    ret.midwt <- midwt(xd, h, L);

    return(list(xd   = ret.midwt$x,
                thld = thld));
}


##------------------------------------------------------------------------------
.udwt <- function(x, h, option) {
    initValues <- .init.denoise(x, option$num.decompression.levels);
    mx    <- initValues$mx;
    nx    <- initValues$nx;
    dimen <- initValues$dimen;
    n     <- initValues$n;
    L     <- initValues$L;

    ret.mrdwt <- mrdwt(x, h, L);
    xl <- ret.mrdwt$yl;
    xh <- ret.mrdwt$yh;
    rm(ret.mrdwt);

    c.offset <- if (dimen == 1) {
                    1;
                } else {
                    (2 * nx) + 1;
                }

    if (option$threshold == CALC.THRESHOLD.TO.USE) {
        tmp <- xh[,c.offset:(c.offset+nx-1)];
        if (option$variance.estimator == MAD.VARIANCE.ESTIMATOR) {
            thld = option$threshold.multiplier * median(abs(tmp)) / 0.67;
        } else if (option$variance.estimator == STD.VARIANCE.ESTIMATOR) {
            thld = option$threshold.multiplier * std(tmp);
        } else {
            stop("Unknown variance estimator - use either MAD or STD");
        }
    } else {
        thld <- option$threshold;
    }
cat("thld =", thld, "\n");

    if (option$threshold.type == SOFT.THRESHOLD.TYPE) {
        xh <- softTh(xh, thld);
        if (option$threshold.low.pass.part == TRUE) {
            xl <- softTh(xl, thld);
        }
    } else if (option$threshold.type == HARD.THRESHOLD.TYPE) {
        xh <- hardTh(xh, thld);
        if (option$threshold.low.pass.part == TRUE) {
            xl <- hardTh(xl, thld);
        }
    } else {
        stop("Unknown threshold type - use either Soft or Hard");
    }

    ret.mirdwt <- mirdwt(xl, xh, h, L);

    return(list(xd   = ret.mirdwt$x,
                thld = thld));
}


##------------------------------------------------------------------------------
.init.denoise <- function(x, num.levels) {
    mx <- nrow(as.matrix(x));
    nx <- ncol(as.matrix(x));
    dimen <- min(mx, nx);
    n <- if (dimen == 1) {
             max(mx, nx);
         } else {
             dimen;
         }

    L <- if (num.levels == MAX.DECOMPOSITION) {
             floor(log2(n));
         } else {
             num.levels;
         }

    return(list(mx    = mx,
                nx    = nx,
                dimen = dimen,
                n     = n,
                L     = L));
}


##------------------------------------------------------------------------------
.validate.denoise.args <- function(x, h, type, option) {
    if (!(is.vector(x) || is.matrix(x))) {
        stop("argument 'x' must be vector or matrix");
    }

    if (!(is.vector(h) &&
          length(h) > 2)) {
        stop("argument 'h' must be vector containing an even number of items");
    }

    if (!(type == DWT.TRANSFORM.TYPE ||
          type == UDWT.TRANSFORM.TYPE)) {
        stop("argument 'type' specifies unknown transformation");
    }

    if (!(is.list(option) &&
          length(option) == 6)) {
        stop("argument 'option' must be list containing six parameters");
    }

    .validate.denoise.option.args(option);
}


##------------------------------------------------------------------------------
.validate.denoise.option.args <- function(option) {
    if (!(is.logical(option$threshold.low.pass.part))) {
        stop("argument 'option[[1]]' must be logical");
    }

    if (!(is.numeric(option$threshold.multiplier))) {
        stop("argument 'option[[2]]' must be numeric");
    }

    if (!(option$variance.estimator == MAD.VARIANCE.ESTIMATOR ||
          option$variance.estimator == STD.VARIANCE.ESTIMATOR)) {
        stop("argument 'option[[3]]' must be 0 or 1");
    }

    if (!(option$threshold.type == SOFT.THRESHOLD.TYPE ||
          option$threshold.type == HARD.THRESHOLD.TYPE)) {
        stop("argument 'option[[4]]' must be 0 or 1");
    }

    if (!(as.integer(option$num.decompression.levels) >= 0)) {
        stop("argument 'option[[5]]' must be natural number");
    }

    if (!(is.numeric(option$threshold))) {
        stop("argument 'option[[6]]' must be numeric vector or 0");
    }
}

