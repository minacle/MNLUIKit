#include "CGColor.h"


CGColorRef CGColorCreateSRGB(CGFloat red, CGFloat green, CGFloat blue, CGFloat alpha) {
    CGColorSpaceRef colorSpace = CGColorSpaceCreateWithName(kCGColorSpaceSRGB);
    CGFloat components[] = {red, green, blue, alpha};
    CGColorRef color = CGColorCreate(colorSpace, components);
    CGColorSpaceRelease(colorSpace);
    return color;
}

CGColorRef CGColorCreateDisplayP3(CGFloat red, CGFloat green, CGFloat blue, CGFloat alpha) {
    CGColorSpaceRef colorSpace = CGColorSpaceCreateWithName(kCGColorSpaceDisplayP3);
    CGFloat components[] = {red, green, blue, alpha};
    CGColorRef color = CGColorCreate(colorSpace, components);
    CGColorSpaceRelease(colorSpace);
    return color;
}

CGColorRef CGColorCreateGrayGamma2_2(CGFloat gray, CGFloat alpha) {
    CGColorSpaceRef colorSpace = CGColorSpaceCreateWithName(kCGColorSpaceGenericGrayGamma2_2);
    CGFloat components[] = {gray, alpha};
    CGColorRef color = CGColorCreate(colorSpace, components);
    CGColorSpaceRelease(colorSpace);
    return color;
}
