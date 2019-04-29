#import "MNLUIButton.h"
#import "_MNLViewLayerProjection.h"
#import "_MNLLayer.h"
#import "_MNLLayerObserver.h"
#import "NSNumber+CGFloat.h"


static UIControlState UIControlStateMakeNeat(UIControlState controlState) {
    if (!(controlState & UIControlStateDisabled)) {
        if (controlState & UIControlStateSelected) {
            if (controlState & UIControlStateHighlighted)
                return UIControlStateSelected | UIControlStateHighlighted;
            return UIControlStateSelected;
        }
        else if (controlState & UIControlStateHighlighted)
            return UIControlStateHighlighted;
        return UIControlStateNormal;
    }
    else if (controlState & UIControlStateSelected)
        return UIControlStateDisabled & UIControlStateSelected;
    return UIControlStateDisabled;
}


@interface MNLUIButton () <_MNLViewLayerProjection, _MNLLayerObservationDelegate>

// MARK: (Properties)

- (void)_setCornerRadiusAutomatically;

// MARK: (Methods)

- (void)_raiseButtonTypeUnavailableException;

@end


@implementation MNLUIButton

{
    NSMutableDictionary *_borderColorDictionary;
    NSMutableDictionary *_borderWidthDictionary;
    NSMutableDictionary *_shadowOpacityDictionary;
    NSMutableDictionary *_shadowRadiusDictionary;
    NSMutableDictionary *_shadowColorDictionary;
    NSMutableDictionary *_backgroundColorDictionary;
}

// MARK: (Properties)

+ (Class)layerClass {
    return [_MNLLayer class];
}

- (void)_setCornerRadiusAutomatically {
    id observer = [_MNLLayerObserver sharedObserver];
    id keyPath = _MNLLayerObservingCornerRadiusPropertyName;
    CALayer *layer = [self layer];
    CGSize size = [self bounds].size;
    CGFloat cornerRadius = MIN(size.width, size.height) / 2;
    [layer removeObserver:observer forKeyPath:keyPath];
    [layer setCornerRadius:cornerRadius];
    [layer addObserver:observer forKeyPath:keyPath options:kNilOptions context:NULL];
}

- (UIColor *)borderColor {
    return [UIColor colorWithCGColor:[[self layer] borderColor]];
}

- (void)setBorderColor:(UIColor *)borderColor {
    [[self layer] setBorderColor:[borderColor CGColor]];
}

- (CGFloat)borderWidth {
    return [[self layer] borderWidth];
}

- (void)setBorderWidth:(CGFloat)borderWidth {
    [[self layer] setBorderWidth:borderWidth];
}

- (float)shadowOpacity {
    return [[self layer] shadowOpacity];
}

- (void)setShadowOpacity:(float)shadowOpacity {
    [[self layer] setShadowOpacity:shadowOpacity];
}

- (CGFloat)shadowRadius {
    return [[self layer] shadowRadius];
}

- (void)setShadowRadius:(CGFloat)shadowRadius {
    [[self layer] setShadowRadius:shadowRadius];
}

- (UIColor *)shadowColor {
    return [UIColor colorWithCGColor:[[self layer] shadowColor]];
}

- (void)setShadowColor:(UIColor *)shadowColor {
    [[self layer] setShadowColor:[shadowColor CGColor]];
}

- (UIColor *)borderColorForState:(UIControlState)state {
    state = UIControlStateMakeNeat(state);
    UIColor *borderColor = [_borderColorDictionary objectForKey:@(state)];
    if (borderColor)
        return borderColor;
    borderColor = [_borderColorDictionary objectForKey:[NSNull null]];
    return borderColor;
}

- (void)setBorderColor:(UIColor *)borderColor forState:(UIControlState)state {
    state = UIControlStateMakeNeat(state);
    [_borderColorDictionary setObject:borderColor forKey:@(state)];
    [self setNeedsDisplay];
}

- (CGFloat)borderWidthForState:(UIControlState)state {
    state = UIControlStateMakeNeat(state);
    NSNumber *borderWidth = [_borderWidthDictionary objectForKey:@(state)];
    if (borderWidth)
        return [borderWidth _MNLUIKit_CGFloatValue];
    borderWidth = [_borderWidthDictionary objectForKey:[NSNull null]];
    return [borderWidth _MNLUIKit_CGFloatValue];
}

- (void)setBorderWidth:(CGFloat)borderWidth forState:(UIControlState)state {
    state = UIControlStateMakeNeat(state);
    [_borderWidthDictionary setObject:@(borderWidth) forKey:@(state)];
    [self setNeedsDisplay];
}

- (float)shadowOpacityForState:(UIControlState)state {
    state = UIControlStateMakeNeat(state);
    NSNumber *shadowOpacity = [_shadowOpacityDictionary objectForKey:@(state)];
    if (shadowOpacity)
        return [shadowOpacity floatValue];
    shadowOpacity = [_shadowOpacityDictionary objectForKey:[NSNull null]];
    return [shadowOpacity floatValue];
}

- (void)setShadowOpacity:(float)shadowOpacity forState:(UIControlState)state {
    state = UIControlStateMakeNeat(state);
    [_shadowOpacityDictionary setObject:@(shadowOpacity) forKey:@(state)];
    [self setNeedsDisplay];
}

- (CGFloat)shadowRadiusForState:(UIControlState)state {
    state = UIControlStateMakeNeat(state);
    NSNumber *shadowRadius = [_shadowRadiusDictionary objectForKey:@(state)];
    if (shadowRadius)
        return [shadowRadius _MNLUIKit_CGFloatValue];
    shadowRadius = [_shadowRadiusDictionary objectForKey:[NSNull null]];
    return [shadowRadius _MNLUIKit_CGFloatValue];
}

- (void)setShadowRadius:(CGFloat)shadowRadius forState:(UIControlState)state {
    state = UIControlStateMakeNeat(state);
    [_shadowRadiusDictionary setObject:@(shadowRadius) forKey:@(state)];
    [self setNeedsDisplay];
}

- (UIColor *)shadowColorForState:(UIControlState)state {
    state = UIControlStateMakeNeat(state);
    UIColor *shadowColor = [_shadowColorDictionary objectForKey:@(state)];
    if (shadowColor)
        return shadowColor;
    shadowColor = [_shadowColorDictionary objectForKey:[NSNull null]];
    return shadowColor;
}

- (void)setShadowColor:(UIColor *)shadowColor forState:(UIControlState)state {
    state = UIControlStateMakeNeat(state);
    [_shadowColorDictionary setObject:shadowColor forKey:@(state)];
    [self setNeedsDisplay];
}

- (UIColor *)currentBorderColor {
    return [self borderColorForState:[self state]];
}

- (CGFloat)currentBorderWidth {
    return [self borderWidthForState:[self state]];
}

- (float)currentShadowOpacity {
    return [self shadowOpacityForState:[self state]];
}

- (CGFloat)currentShadowRadius {
    return [self shadowRadiusForState:[self state]];
}

- (UIColor *)currentShadowColor {
    return [self shadowColorForState:[self state]];
}

- (UIColor *)backgroundColor {
    return [UIColor colorWithCGColor:[[self layer] backgroundColor]];
}

- (void)setBackgroundColor:(UIColor *)backgroundColor {
    [[self layer] setBackgroundColor:[backgroundColor CGColor]];
}

- (UIColor *)backgroundColorForState:(UIControlState)state {
    state = UIControlStateMakeNeat(state);
    UIColor *backgroundColor = [_backgroundColorDictionary objectForKey:@(state)];
    if (backgroundColor)
        return backgroundColor;
    backgroundColor = [_backgroundColorDictionary objectForKey:[NSNull null]];
    return backgroundColor;
}

- (void)setBackgroundColor:(UIColor *)backgroundColor forState:(UIControlState)state {
    state = UIControlStateMakeNeat(state);
    [_backgroundColorDictionary setObject:backgroundColor forKey:@(state)];
    [self setNeedsDisplay];
}

- (UIColor *)currentBackgroundColor {
    return [self backgroundColorForState:[self state]];
}

- (CGFloat)titleOpacityForState:(UIControlState)state {
    state = UIControlStateMakeNeat(state);
    if (state & UIControlStateDisabled)
        return pow(.2, 1 / 2);
    return 1;
}

- (CGFloat)imageOpacityForState:(UIControlState)state {
    state = UIControlStateMakeNeat(state);
    if (state & UIControlStateDisabled)
        return pow(.2, 1 / 2);
    return 1;
}

- (CGFloat)layerOpacityForState:(UIControlState)state {
    state = UIControlStateMakeNeat(state);
    if (state & UIControlStateDisabled)
        return pow(.2, 1 / 2);
    return 1;
}

// MARK: (Methods)

+ (instancetype)allocWithZone:(struct _NSZone *)zone {
    id object = [super allocWithZone:zone];
    if (object) {
        [object setCornerRadius:kMNLUIViewCornerRadiusAutomatic];
        id observer = [_MNLLayerObserver sharedObserver];
        [object addObserver:observer forKeyPath:_MNLLayerObservingCornerRadiusPropertyName options:kNilOptions context:NULL];
        [object addObserver:observer forKeyPath:_MNLLayerObservingFramePropertyName options:kNilOptions context:NULL];
        [object addObserver:observer forKeyPath:_MNLLayerObservingShadowOffsetPropertyName options:kNilOptions context:NULL];
        [object addObserver:observer forKeyPath:_MNLLayerObservingShadowPathPropertyName options:kNilOptions context:NULL];
    }
    return object;
}

+ (instancetype)button {
    return [self new];
}

- (instancetype)initWithCoder:(NSCoder *)decoder {
    if (self = [super initWithCoder:decoder]) {
        if ([(UIButton *)self buttonType] != UIButtonTypeCustom) {
            [self _raiseButtonTypeUnavailableException];
            return nil;
        }
        [(_MNLLayer *)[self layer] _setLayerObservationDelegate:self];
        [self setBorderColor:[(id<_MNLViewLayerProjection>)self borderColor] forState:[self state]];
        [self setBorderWidth:[(id<_MNLViewLayerProjection>)self borderWidth] forState:[self state]];
        [self setShadowOpacity:[(id<_MNLViewLayerProjection>)self shadowOpacity] forState:[self state]];
        [self setShadowRadius:[(id<_MNLViewLayerProjection>)self shadowRadius] forState:[self state]];
        [self setShadowColor:[(id<_MNLViewLayerProjection>)self shadowColor] forState:[self state]];
        [self setBackgroundColor:[(UIButton *)self backgroundColor] forState:[self state]];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame])
        [(_MNLLayer *)[self layer] _setLayerObservationDelegate:self];
    return self;
}

- (void)dealloc {
    id observer = [_MNLLayerObserver sharedObserver];
    [self removeObserver:observer forKeyPath:_MNLLayerObservingCornerRadiusPropertyName];
    [self removeObserver:observer forKeyPath:_MNLLayerObservingFramePropertyName];
    [self removeObserver:observer forKeyPath:_MNLLayerObservingShadowOffsetPropertyName];
    [self removeObserver:observer forKeyPath:_MNLLayerObservingShadowPathPropertyName];
}

- (void)displayLayer:(CALayer *)layer {
    [super displayLayer:layer];
    if (layer != [self layer])
        return;
    UIControlState state = UIControlStateMakeNeat([self state]);
    [layer setBorderColor:[[self borderColorForState:state] CGColor]];
    [layer setBorderWidth:[self borderWidthForState:state]];
    [layer setShadowOpacity:[self shadowOpacityForState:state]];
    [layer setShadowRadius:[self shadowRadiusForState:state]];
    [layer setShadowColor:[[self shadowColorForState:state] CGColor]];
    [layer setBackgroundColor:[[self backgroundColorForState:state] CGColor]];
}

- (void)prepareForInterfaceBuilder {
    [super prepareForInterfaceBuilder];
    [self setNeedsDisplay];
}

- (void)_raiseButtonTypeUnavailableException {
    [NSException raise:NSInternalInconsistencyException format:@"A value of property 'buttonType' for class '%@' must be 0(UIButtonTypeCustom).", NSStringFromClass([self class])];
}

// MARK: _MNLLayerObservationDelegate

- (void)_frameDidChange:(id)sender {
    if (sender == self)
        if ([self cornerRadius] == kMNLUIViewCornerRadiusAutomatic)
            [self _setCornerRadiusAutomatically];
}

- (void)_shadowOffsetDidChange:(id)sender {
    CALayer *layer;
    id observer = [_MNLLayerObserver sharedObserver];
    id keyPath = _MNLLayerObservingShadowOffsetPropertyName;
    if (sender == self) {
        layer = [self layer];
        [self removeObserver:observer forKeyPath:keyPath];
        [layer setShadowOffset:[self shadowOffset]];
        [self addObserver:observer forKeyPath:keyPath options:kNilOptions context:NULL];
    }
    else {
        layer = sender;
        [layer removeObserver:observer forKeyPath:keyPath];
        [self setShadowOffset:[layer shadowOffset]];
        [layer addObserver:observer forKeyPath:keyPath options:kNilOptions context:NULL];
    }
}

- (void)_shadowPathDidChange:(id)sender {
    CALayer *layer;
    id observer = [_MNLLayerObserver sharedObserver];
    id keyPath = _MNLLayerObservingShadowPathPropertyName;
    if (sender == self) {
        layer = [self layer];
        [self removeObserver:observer forKeyPath:keyPath];
        [layer setShadowPath:[[self shadowPath] CGPath]];
        [self addObserver:observer forKeyPath:keyPath options:kNilOptions context:NULL];
    }
    else {
        layer = sender;
        [layer removeObserver:observer forKeyPath:keyPath];
        [self setShadowPath:[UIBezierPath bezierPathWithCGPath:[layer shadowPath]]];
        [layer addObserver:observer forKeyPath:keyPath options:kNilOptions context:NULL];
    }
}

@end
