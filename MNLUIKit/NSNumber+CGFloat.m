//
//  NSNumber+CGFloat.m
//  MNLUIKit
//
//  Created by Mayu Laierlence on 24/04/2019.
//  Copyright © 2019 Mayu Laierlence. All rights reserved.
//

#import "NSNumber+CGFloat.h"

@implementation NSNumber (_MNLUIKit_CGFloat)

- (CGFloat)_MNLUIKit_CGFloatValue {
#if CGFLOAT_IS_DOUBLE
    return [self doubleValue];
#else
    return [self floatValue];
#endif
}

@end
