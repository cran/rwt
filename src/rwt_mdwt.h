/*
 * RWT_MDWT.H
 *
 * Public include for .Call interface to MDWT
 *
 * Copyright (c) 2004 MD Anderson Cancer Center. All rights reserved.
 * Created by Paul Roebuck, Department of Bioinformatics, MDACC.
 */

#ifndef RWT_MDWT_H
#define RWT_MDWT_H	1

#include <Rdefines.h>
#include "mdwt.h"


/*
 * Function Declarations
 */
extern SEXP rwt_mdwt(
  SEXP vntX,
  SEXP vntH,
  SEXP vntL);

#endif /* RWT_MDWT_H */

