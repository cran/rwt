/*
 * RWT_MRDWT.H
 *
 * Public include for .Call interface to MRDWT 
 *
 * Copyright (c) 2004 MD Anderson Cancer Center. All rights reserved.
 * Created by Paul Roebuck, Department of Bioinformatics, MDACC.
 */

#ifndef RWT_MRDWT_H
#define RWT_MRDWT_H	1

#include <Rdefines.h>
#include "mrdwt.h"


/*
 * Function Declarations
 */
extern SEXP rwt_mrdwt(
  SEXP vntX,
  SEXP vntH,
  SEXP vntL);

#endif /* RWT_MRDWT_H */

