#
# ZZZ.R
#

##
## Package/Namespace Hooks
##

##-----------------------------------------------------------------------------
.onAttach <- function(libname, pkgname) {
    verbose <- getOption("verbose")
    if (verbose) {
        local({
            libraryPkgName <- function(pkgname, sep = "_") {
                unlist(strsplit(pkgname, sep, fixed = TRUE))[1]
            }
            packageDescription <- function(pkgname) {
                fieldnames <- c("Title", "Version")
                descfile <- file.path(libname, pkgname, "DESCRIPTION")
                desc <- as.list(read.dcf(descfile, fieldnames))
                names(desc) <- fieldnames
                return(desc)
            }

            desc <- packageDescription(pkgname)
            cat(paste(desc$Title, ", version ", desc$Version, sep = ""), "\n")
            cat(paste("Type library(help=",
                      sQuote(libraryPkgName(pkgname)),
                      ") to see package documentation.", sep = ""), "\n")
        })
    }
}

