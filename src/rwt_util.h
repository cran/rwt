/*
 * RWT_UTIL.H
 *
 * Public include for utility routines associated with .Call interfaces 
 *
 * Copyright (c) 2004 MD Anderson Cancer Center. All rights reserved.
 * Created by Paul Roebuck, Department of Bioinformatics, MDACC.
 */

#ifndef RWT_UTIL_H
#define RWT_UTIL_H	1

#include <Rdefines.h>


/*
 * Function Declarations
 */
extern int GetMatrixDimen(
  SEXP vntX,
  int *nrow,
  int *ncol);

#endif /* RWT_UTIL_H */

