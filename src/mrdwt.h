/*
 * $Id: mrdwt.h 35 2022-05-31 05:53:13Z proebuck $
 *
 * Public include for redundant discrete wavelet transform method
 *
 * Copyright (c) 2004 MD Anderson Cancer Center. All rights reserved.
 * Created by Paul Roebuck, Department of Bioinformatics, MDACC.
 */

#ifndef MRDWT_H
#define MRDWT_H	1


/*
 * Function Declarations
 */
extern void MRDWT(
  double *  /* x  */,
  int       /* m  */,
  int       /* n  */,
  double *  /* h  */,
  int       /* lh */,
  int       /* L  */,
  double *  /* yl */,
  double *  /* yh */
);

#endif /* MRDWT_H */

