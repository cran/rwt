/*
 * RWT_MIRDWT.H
 *
 * Public include for .Call interface to MIRDWT 
 *
 * Copyright (c) 2004 MD Anderson Cancer Center. All rights reserved.
 * Created by Paul Roebuck, Department of Bioinformatics, MDACC.
 */

#ifndef RWT_MIRDWT_H
#define RWT_MIRDWT_H	1

#include <Rdefines.h>
#include "mirdwt.h"


/*
 * Function Declarations
 */
extern SEXP rwt_mirdwt(
  SEXP vntYl,
  SEXP vntYh,
  SEXP vntH,
  SEXP vntL);

#endif /* RWT_MIRDWT_H */

