#ifndef MNLUIKIT_CGCOLOR_H_
#define MNLUIKIT_CGCOLOR_H_


#include <CoreGraphics/CGColor.h>


CG_EXTERN CGColorRef __nullable
CGColorCreateSRGB
(CGFloat red,
 CGFloat green,
 CGFloat blue,
 CGFloat alpha)
CG_AVAILABLE_STARTING(10.5, 9.0);

CG_EXTERN CGColorRef __nullable
CGColorCreateDisplayP3
(CGFloat red,
 CGFloat green,
 CGFloat blue,
 CGFloat alpha)
CG_AVAILABLE_STARTING(10.11.2, 9.3);

CG_EXTERN CGColorRef __nullable
CGColorCreateGrayGamma2_2
(CGFloat gray,
 CGFloat alpha)
CG_AVAILABLE_STARTING(10.6, 9.0);


#endif  // #ifndef MNLUIKIT_CGCOLOR_H_
