###
### $Id: zzz.R 35 2022-05-31 05:53:13Z proebuck $
###

##
## Package/Namespace Hooks
##

##-----------------------------------------------------------------------------
.onAttach <- function(libname, pkgname) {
    verbose <- getOption("verbose")
    if (verbose) {
        local({
            libraryPkgName <- function(pkgname, sep="_") {
                unlist(strsplit(pkgname, sep, fixed=TRUE))[1]
            }
            packageDescription <- function(pkgname) {
                fieldnames <- c("Title", "Version")
                metafile <- file.path(libname, pkgname, "DESCRIPTION")
                meta <- as.list(read.dcf(metafile, fieldnames))
                names(meta) <- fieldnames
                meta
            }

            meta <- packageDescription(pkgname)
            msg <- sprintf("%s, version %s",
                           meta$Title, meta$Version)
            packageStartupMessage(msg)
            msg <- sprintf("Type library(help=%s) to see package documentation",
                           libraryPkgName(pkgname))
            packageStartupMessage(msg)
        })
    }
}

