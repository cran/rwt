#
# MAKESIG.R - Creates artificial test signal
#

SIGNAL.ALL            <- "AllSig";
SIGNAL.HEAVI.SINE     <- "HeaviSine";
SIGNAL.BUMPS          <- "Bumps";
SIGNAL.BLOCKS         <- "Blocks";
SIGNAL.DOPPLER        <- "Doppler";
SIGNAL.RAMP           <- "Ramp";
SIGNAL.CUSP           <- "Cusp";
SIGNAL.SING           <- "Sing";
SIGNAL.HI.SINE        <- "HiSine";
SIGNAL.LO.SINE        <- "LoSine";
SIGNAL.LIN.CHIRP      <- "LinChirp";
SIGNAL.TWO.CHIRP      <- "TwoChirp";
SIGNAL.QUAD.CHIRP     <- "QuadChirp";
SIGNAL.MISH.MASH      <- "MishMash";
SIGNAL.WERNER.SORROWS <- "Werner Sorrows";  #(Heisenberg)
SIGNAL.LEOPOLD        <- "Leopold";         #(Kronecker)


#
# Public
#
##------------------------------------------------------------------------------
makesig <- function(sigName = SIGNAL.ALL, N = 512) {
    if (!(.isValidSignal(sigName))) {
        stop("argument 'sigName' specifies unknown signal.");
    }

    tN <- (1:N) / N;
    x <- NULL;

    if ((sigName == SIGNAL.HEAVI.SINE) | (sigName == SIGNAL.ALL)) {
        y <- .makesig.heavi.sine(N, tN);
        x <- rbind(x, y);
    }
  
    if ((sigName == SIGNAL.BUMPS) | (sigName == SIGNAL.ALL)) {
        y <- .makesig.bumps(N, tN);
        x <- rbind(x, t(y));
    }
  
    if ((sigName == SIGNAL.BLOCKS) | (sigName == SIGNAL.ALL)) {
        y <- .makesig.blocks(N, tN);
        x <- rbind(x, t(y));
    }
  
    if ((sigName == SIGNAL.DOPPLER) | (sigName == SIGNAL.ALL)) {
        y <- .makesig.doppler(N, tN);
        x <- rbind(x, t(y));
    }

    if ((sigName == SIGNAL.RAMP) | (sigName == SIGNAL.ALL)) {
        y <- .makesig.ramp(N, tN);
        x <- rbind(x, t(y));
    }

    if ((sigName == SIGNAL.CUSP) | (sigName == SIGNAL.ALL)) {
        y <- .makesig.cusp(N, tN);
        x <- rbind(x, t(y));
    }

    if ((sigName == SIGNAL.SING) | (sigName == SIGNAL.ALL)) {
        y <- .makesig.sing(N, tN);
        x <- rbind(x, t(y));
    }

    if ((sigName == SIGNAL.HI.SINE) | (sigName == SIGNAL.ALL)) {
        y <- .makesig.hi.sine(N, tN);
        x <- rbind(x, t(y));
    }

    if ((sigName == SIGNAL.LO.SINE) | (sigName == SIGNAL.ALL)) {
        y <- .makesig.lo.sine(N, tN);
        x <- rbind(x, t(y));
    }

    if ((sigName == SIGNAL.LIN.CHIRP) | (sigName == SIGNAL.ALL)) {
        y <- .makesig.lin.chirp(N, tN);
        x <- rbind(x, t(y));
    }

    if ((sigName == SIGNAL.TWO.CHIRP) | (sigName == SIGNAL.ALL)) {
        y <- .makesig.two.chirp(N, tN);
        x <- rbind(x, t(y));
    }

    if ((sigName == SIGNAL.QUAD.CHIRP) | (sigName == SIGNAL.ALL)) {
        y <- .makesig.quad.chirp(N, tN);
        x <- rbind(x, t(y));
    }

    if ((sigName == SIGNAL.MISH.MASH) | (sigName == SIGNAL.ALL)) {
        y <- .makesig.mish.mash(N, tN);
        x <- rbind(x, t(y));
    }

    if ((sigName == SIGNAL.WERNER.SORROWS) | (sigName == SIGNAL.ALL)) {
        y <- .makesig.werner.sorrows(N, tN);
        x <- rbind(x, t(y));
    }

    if ((sigName == SIGNAL.LEOPOLD) | (sigName == SIGNAL.ALL)) {
        y <- .makesig.leopold(N, tN);
        x <- rbind(x, t(y));
    }

    return(list(x = x,
                N = N));
}


#
# Private
#
##------------------------------------------------------------------------------
.makesig.heavi.sine <- function(N, t) {
    y <- 4 * sin((4 * pi) * t);
    y <- y - sign(t - 0.3) - sign(0.72 - t);

    #cat("HeaviSine: y = [", y, "]\n");
    return(y);
}


##------------------------------------------------------------------------------
.makesig.bumps <- function(N, t) {
    pos <- c(0.1, 0.13, 0.15, 0.23, 0.25, 0.40, 0.44, 0.65, 0.76, 0.78, 0.81);
    hgt <- c(4, 5, 3, 4, 5, 4.2, 2.1, 4.3, 3.1, 5.1, 4.2);
    wth <- c(0.005, 0.005, 0.006, 0.01, 0.01, 0.03, 0.01, 0.01, 0.005, 0.008, 0.005);
    y <- matlab::zeros(size(t));
    for (j in 1:length(pos)) {
        y <- y + hgt[j] / (1 + abs((t - pos[j]) / wth[j])) ^ 4;
    }

    #cat("Bumps: y = [", y, "]\n");
    return(y);
}


##------------------------------------------------------------------------------
.makesig.blocks <- function(N, t) {
    pos <- c(0.1, 0.13, 0.15, 0.23, 0.25, 0.40, 0.44, 0.65, 0.76, 0.78, 0.81);
    hgt <- c(4, -5, 3, -4, 5, -4.2, 2.1, 4.3, -3.1, 2.1, -4.2);
    y <- matlab::zeros(size(t));
    for (j in 1:length(pos)) {
        y <- y + (1 + sign(t - pos[j])) * (hgt[j] / 2);
    }
  
    #cat("Blocks: y = [", y, "]\n");
    return(y);
}


##------------------------------------------------------------------------------
.makesig.doppler <- function(N, t) {
    y <- sqrt(t * (1 - t)) * sin((2 * pi * 1.05) / (t + 0.05));

    #cat("Doppler: y = [", y, "]\n");
    return(y);
}


##------------------------------------------------------------------------------
.makesig.ramp <- function(N, t) {
    y <- t - (t >= 0.37);

    #cat("Ramp: y = [", y, "]\n");
    return(y);
}


##------------------------------------------------------------------------------
.makesig.cusp <- function(N, t) {
    y <- sqrt(abs(t - 0.37));

    #cat("Cusp: y = [", y, "]\n");
    return(y);
}


##------------------------------------------------------------------------------
.makesig.sing <- function(N, t) {
    k <- floor(N * 0.37);
    y <- 1 / abs(t - (k + 0.5) / N);

    #cat("Sing: y = [", y, "]\n");
    return(y);
}


##------------------------------------------------------------------------------
.makesig.hi.sine <- function(N, t) {
    y <- sin(pi * (N * 0.6902) * t);

    #cat("HiSine: y = [", y, "]\n");
    return(y);
}


##------------------------------------------------------------------------------
.makesig.lo.sine <- function(N, t) {
    y <- sin(pi * (N * 0.3333) * t);

    #cat("LoSine: y = [", y, "]\n");
    return(y);
}


##------------------------------------------------------------------------------
.makesig.lin.chirp <- function(N, t) {
    y <- sin(pi * t * ((N * 0.125) * t));

    #cat("LinChirp: y = [", y, "]\n");
    return(y);
}


##------------------------------------------------------------------------------
.makesig.two.chirp <- function(N, t) {
    y <- sin(pi * t * (N * t)) + sin((pi / 3) * t * (N * t));

    #cat("TwoChirp: y = [", y, "]\n");
    return(y);
}


##------------------------------------------------------------------------------
.makesig.quad.chirp <- function(N, t) {
    y <- sin((pi / 3) * t * (N * t ^ 2));

    #cat("QuadChirp: y = [", y, "]\n");
    return(y);
}


##------------------------------------------------------------------------------
.makesig.mish.mash <- function(N, t) {
    # QuadChirp + LinChirp + HiSine
    y <- sin((pi / 3) * t * (N * t ^ 2));
    y <- y + sin(pi * (N * 0.6902) * t);
    y <- y + sin(pi * t * (N * 0.125 * t));

    #cat("MishMash: y = [", y, "]\n");
    return(y);
}


##------------------------------------------------------------------------------
.makesig.werner.sorrows <- function(N, t) {
    pos <- c(0.1, 0.13, 0.15, 0.23, 0.25, 0.40, 0.44, 0.65, 0.76, 0.78, 0.81);
    hgt <- c(4, 5, 3, 4, 5, 4.2, 2.1, 4.3, 3.1, 5.1, 4.2);
    wth <- c(0.005, 0.005, 0.006, 0.01, 0.01, 0.03, 0.01, 0.01, 0.005, 0.008, 0.005);
    y <- sin(pi * t * (N / 2 * t ^ 2));
    y <- y + sin(pi * (N * 0.6902) * t);
    y <- y + sin(pi * t * (N * t));
    for (j in 1:length(pos)) {
        y <- y + hgt[j] / (1 + abs((t - pos[j]) / wth[j])) ^ 4;
    }

    #cat("WernerSorrows: y = [", y, "]\n");
    return(y);
}


##------------------------------------------------------------------------------
.makesig.leopold <- function(N, t) {
    y <- (t == floor(0.37 * N) / N); 		# Kronecker

    #cat("Leopold: y = [", y, "]\n");
    return(y);
}


##------------------------------------------------------------------------------
.isValidSignal <- function(sigName) {
    .signals <- c(SIGNAL.ALL,
                  SIGNAL.HEAVI.SINE,
                  SIGNAL.BUMPS,
                  SIGNAL.BLOCKS,
                  SIGNAL.DOPPLER,
                  SIGNAL.RAMP,
                  SIGNAL.CUSP,
                  SIGNAL.SING,
                  SIGNAL.HI.SINE,
                  SIGNAL.LO.SINE,
                  SIGNAL.LIN.CHIRP,
                  SIGNAL.TWO.CHIRP,
                  SIGNAL.QUAD.CHIRP,
                  SIGNAL.MISH.MASH,
                  SIGNAL.WERNER.SORROWS,
                  SIGNAL.LEOPOLD);

    return(!is.na(pmatch(sigName, .signals)));
}

