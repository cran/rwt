#
# ZZZ.R
#

##-----------------------------------------------------------------------------
.First.lib <- function(libname, pkgname) {
    if (version$major == 1 && version$minor < 7.1) {
        stop("Requires R 1.7.1 or later")
    }
    verbose <- getOption("verbose")
    if (verbose) {
        cat("Rice Wavelet Toolbox package by Paul Roebuck",
            "Type library(help='rwt') to see package documentation.",
            sep="\n");

    }
    library.dynam("rwt", pkgname, libname)
}

