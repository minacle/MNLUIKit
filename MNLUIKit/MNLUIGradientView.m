#import "MNLUIGradientView.h"
#import "_MNLGradientViewLayerProjection.h"
#import "_MNLGradientLayer.h"
#import "_MNLGradientLayerObserver.h"


@interface MNLUIGradientView () <_MNLGradientViewLayerProjection, _MNLGradientLayerObservationDelegate>

// MARK: (Properties)

- (void)_setCornerRadiusAutomatically;

@end


@implementation MNLUIGradientView

// MARK: (Properties)

+ (Class)layerClass {
    return [_MNLGradientLayer class];
}

- (UIColor *)startColor {
    return [[self colors] firstObject];
}

- (void)setStartColor:(UIColor *)startColor {
    [self willChangeValueForKey:@"startColor"];
    @autoreleasepool {
        if (![self colors] || [[self colors] count] == 0)
            [self setColors:@[startColor]];
        else {
            NSMutableArray *colors = [[self colors] mutableCopy];
            [colors setObject:startColor atIndexedSubscript:0];
            [self setColors:[colors copy]];
            colors = nil;
        }
    }
    [self didChangeValueForKey:@"startColor"];
}

- (UIColor *)endColor {
    return [[self colors] lastObject];
}

- (void)setEndColor:(UIColor *)endColor {
    [self willChangeValueForKey:@"endColor"];
    @autoreleasepool {
        if (![self colors] || [[self colors] count] == 0)
            [self setColors:@[[UIColor new], endColor]];
        else if ([[self colors] count] == 1)
            [self setColors:[[self colors] arrayByAddingObject:endColor]];
        else {
            NSMutableArray *colors = [[self colors] mutableCopy];
            [colors setObject:endColor atIndexedSubscript:([colors count] - 1)];
            [self setColors:[colors copy]];
            colors = nil;
        }
    }
    [self didChangeValueForKey:@"endColor"];
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

// MARK: (Methods)

+ (instancetype)allocWithZone:(struct _NSZone *)zone {
    id object = [super allocWithZone:zone];
    if (object) {
        id observer = [_MNLGradientLayerObserver sharedObserver];
        [object addObserver:observer forKeyPath:_MNLGradientLayerObservingColorsPropertyName options:kNilOptions context:NULL];
        [object addObserver:observer forKeyPath:_MNLGradientLayerObservingLocationsPropertyName options:kNilOptions context:NULL];
        [object addObserver:observer forKeyPath:_MNLGradientLayerObservingEndPointPropertyName options:kNilOptions context:NULL];
        [object addObserver:observer forKeyPath:_MNLGradientLayerObservingStartPointPropertyName options:kNilOptions context:NULL];
        [object addObserver:observer forKeyPath:_MNLGradientLayerObservingTypePropertyName options:kNilOptions context:NULL];
    }
    return object;
}

- (instancetype)initWithCoder:(NSCoder *)decoder {
    if (self = [super initWithCoder:decoder]) {
        _MNLGradientLayer *layer = (_MNLGradientLayer *)[self layer];
        [layer _setLayerObservationDelegate:self];
        [layer _setGradientLayerObservationDelegate:self];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        _MNLGradientLayer *layer = (_MNLGradientLayer *)[self layer];
        [layer _setLayerObservationDelegate:self];
        [layer _setGradientLayerObservationDelegate:self];
    }
    return self;
}

- (void)prepareForInterfaceBuilder {
    [super prepareForInterfaceBuilder];
    [[self layer] setNeedsDisplay];
}

- (void)dealloc {
    id observer = [_MNLGradientLayerObserver sharedObserver];
    [self removeObserver:observer forKeyPath:_MNLGradientLayerObservingColorsPropertyName];
    [self removeObserver:observer forKeyPath:_MNLGradientLayerObservingLocationsPropertyName];
    [self removeObserver:observer forKeyPath:_MNLGradientLayerObservingEndPointPropertyName];
    [self removeObserver:observer forKeyPath:_MNLGradientLayerObservingStartPointPropertyName];
    [self removeObserver:observer forKeyPath:_MNLGradientLayerObservingTypePropertyName];
}

// MARK: _MNLLayerObservationDelegate

- (void)_backgroundColorDidChange:(id)sender {
    CALayer *layer;
    id observer = [_MNLLayerObserver sharedObserver];
    id keyPath = _MNLLayerObservingBackgroundColorPropertyName;
    if (sender == self) {
        layer = [self layer];
        [self removeObserver:observer forKeyPath:keyPath];
        [layer setBackgroundColor:[[self backgroundColor] CGColor]];
        [self addObserver:observer forKeyPath:keyPath options:kNilOptions context:NULL];
    }
    else {
        layer = sender;
        [layer removeObserver:observer forKeyPath:keyPath];
        [self setBackgroundColor:[UIColor colorWithCGColor:[layer backgroundColor]]];
        [layer addObserver:observer forKeyPath:keyPath options:kNilOptions context:NULL];
    }
}

- (void)_borderWidthDidChange:(id)sender {
    CALayer *layer;
    id observer = [_MNLLayerObserver sharedObserver];
    id keyPath = _MNLLayerObservingBorderWidthPropertyName;
    if (sender == self) {
        layer = [self layer];
        [self removeObserver:observer forKeyPath:keyPath];
        [layer setBorderWidth:[self borderWidth]];
        [self addObserver:observer forKeyPath:keyPath options:kNilOptions context:NULL];
    }
    else {
        layer = sender;
        [layer removeObserver:observer forKeyPath:keyPath];
        [self setBorderWidth:[layer borderWidth]];
        [layer addObserver:observer forKeyPath:keyPath options:kNilOptions context:NULL];
    }
}

- (void)_borderColorDidChange:(id)sender {
    CALayer *layer;
    id observer = [_MNLLayerObserver sharedObserver];
    id keyPath = _MNLLayerObservingBorderColorPropertyName;
    if (sender == self) {
        layer = [self layer];
        [self removeObserver:observer forKeyPath:keyPath];
        [layer setBorderColor:[[self borderColor] CGColor]];
        [self addObserver:observer forKeyPath:keyPath options:kNilOptions context:NULL];
    }
    else {
        layer = sender;
        [layer removeObserver:observer forKeyPath:keyPath];
        [self setBorderColor:[UIColor colorWithCGColor:[layer borderColor]]];
        [layer addObserver:observer forKeyPath:keyPath options:kNilOptions context:NULL];
    }
}

- (void)_cornerRadiusDidChange:(id)sender {
    CALayer *layer;
    id observer = [_MNLLayerObserver sharedObserver];
    id keyPath = _MNLLayerObservingCornerRadiusPropertyName;
    if (sender == self) {
        layer = [self layer];
        [self removeObserver:observer forKeyPath:keyPath];
        if ([self cornerRadius] == kMNLUIViewCornerRadiusAutomatic)
            [self _setCornerRadiusAutomatically];
        else
            [layer setCornerRadius:[self cornerRadius]];
        [self addObserver:observer forKeyPath:keyPath options:kNilOptions context:NULL];
    }
    else {
        layer = sender;
        [layer removeObserver:observer forKeyPath:keyPath];
        [self setCornerRadius:[layer cornerRadius]];
        [layer addObserver:observer forKeyPath:keyPath options:kNilOptions context:NULL];
    }
}

- (void)_frameDidChange:(id)sender {
    if (sender == self)
        if ([self cornerRadius] == kMNLUIViewCornerRadiusAutomatic)
            [self _setCornerRadiusAutomatically];
}

- (void)_shadowOpacityDidChange:(id)sender {
    CALayer *layer;
    id observer = [_MNLLayerObserver sharedObserver];
    id keyPath = _MNLLayerObservingShadowOpacityPropertyName;
    if (sender == self) {
        layer = [self layer];
        [self removeObserver:observer forKeyPath:keyPath];
        [layer setShadowOpacity:[self shadowOpacity]];
        [self addObserver:observer forKeyPath:keyPath options:kNilOptions context:NULL];
    }
    else {
        layer = sender;
        [layer removeObserver:observer forKeyPath:keyPath];
        [self setShadowOpacity:[layer shadowOpacity]];
        [layer addObserver:observer forKeyPath:keyPath options:kNilOptions context:NULL];
    }
}

- (void)_shadowRadiusDidChange:(id)sender {
    CALayer *layer;
    id observer = [_MNLLayerObserver sharedObserver];
    id keyPath = _MNLLayerObservingShadowRadiusPropertyName;
    if (sender == self) {
        layer = [self layer];
        [self removeObserver:observer forKeyPath:keyPath];
        [layer setShadowRadius:[self shadowRadius]];
        [self addObserver:observer forKeyPath:keyPath options:kNilOptions context:NULL];
    }
    else {
        layer = sender;
        [layer removeObserver:observer forKeyPath:keyPath];
        [self setShadowRadius:[layer shadowRadius]];
        [layer addObserver:observer forKeyPath:keyPath options:kNilOptions context:NULL];
    }
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

- (void)_shadowColorDidChange:(id)sender {
    CALayer *layer;
    id observer = [_MNLLayerObserver sharedObserver];
    id keyPath = _MNLLayerObservingShadowColorPropertyName;
    if (sender == self) {
        layer = [self layer];
        [self removeObserver:observer forKeyPath:keyPath];
        [layer setShadowColor:[[self shadowColor] CGColor]];
        [self addObserver:observer forKeyPath:keyPath options:kNilOptions context:NULL];
    }
    else {
        layer = sender;
        [layer removeObserver:observer forKeyPath:keyPath];
        [self setShadowColor:[UIColor colorWithCGColor:[layer shadowColor]]];
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

// MARK: _MNLGradientLayerObservationDelegate

- (void)_colorsDidChange:(id)sender {
    CAGradientLayer *layer;
    id observer = [_MNLGradientLayerObserver sharedObserver];
    id keyPath = _MNLGradientLayerObservingColorsPropertyName;
    if (sender == self) {
        layer = (CAGradientLayer *)[self layer];
        [self removeObserver:observer forKeyPath:keyPath];
        if ([self colors])
            @autoreleasepool {
                NSMutableArray *colors = [NSMutableArray new];
                for (id color in [self colors])
                    [colors addObject:(id)[color CGColor]];
                [layer setColors:[colors copy]];
                colors = nil;
            }
        else
            [layer setColors:nil];
        [self addObserver:observer forKeyPath:keyPath options:kNilOptions context:NULL];
    }
    else {
        layer = sender;
        [layer removeObserver:observer forKeyPath:keyPath];
        if ([layer colors])
            @autoreleasepool {
                NSMutableArray *colors = [NSMutableArray new];
                for (id color in [layer colors])
                    [colors addObject:[UIColor colorWithCGColor:(CGColorRef)color]];
                [self setColors:[colors copy]];
                colors = nil;
            }
        else
            [self setColors:nil];
        [layer addObserver:observer forKeyPath:keyPath options:kNilOptions context:NULL];
    }
}

- (void)_locationsDidChange:(id)sender {
    CAGradientLayer *layer;
    id observer = [_MNLGradientLayerObserver sharedObserver];
    id keyPath = _MNLGradientLayerObservingLocationsPropertyName;
    if (sender == self) {
        layer = (CAGradientLayer *)[self layer];
        [self removeObserver:observer forKeyPath:keyPath];
        [layer setLocations:[self locations]];
        [self addObserver:observer forKeyPath:keyPath options:kNilOptions context:NULL];
    }
    else {
        layer = sender;
        [layer removeObserver:observer forKeyPath:keyPath];
        [self setLocations:[layer locations]];
        [layer addObserver:observer forKeyPath:keyPath options:kNilOptions context:NULL];
    }
}

- (void)_endPointDidChange:(id)sender {
    CAGradientLayer *layer;
    id observer = [_MNLGradientLayerObserver sharedObserver];
    id keyPath = _MNLGradientLayerObservingEndPointPropertyName;
    if (sender == self) {
        layer = (CAGradientLayer *)[self layer];
        [self removeObserver:observer forKeyPath:keyPath];
        [layer setEndPoint:[self endPoint]];
        [self addObserver:observer forKeyPath:keyPath options:kNilOptions context:NULL];
    }
    else {
        layer = sender;
        [layer removeObserver:observer forKeyPath:keyPath];
        [self setEndPoint:[layer endPoint]];
        [layer addObserver:observer forKeyPath:keyPath options:kNilOptions context:NULL];
    }
}

- (void)_startPointDidChange:(id)sender {
    CAGradientLayer *layer;
    id observer = [_MNLGradientLayerObserver sharedObserver];
    id keyPath = _MNLGradientLayerObservingStartPointPropertyName;
    if (sender == self) {
        layer = (CAGradientLayer *)[self layer];
        [self removeObserver:observer forKeyPath:keyPath];
        [layer setStartPoint:[self startPoint]];
        [self addObserver:observer forKeyPath:keyPath options:kNilOptions context:NULL];
    }
    else {
        layer = sender;
        [layer removeObserver:observer forKeyPath:keyPath];
        [self setStartPoint:[layer startPoint]];
        [layer addObserver:observer forKeyPath:keyPath options:kNilOptions context:NULL];
    }
}

- (void)_typeDidChange:(id)sender {
    CAGradientLayer *layer;
    id observer = [_MNLGradientLayerObserver sharedObserver];
    id keyPath = _MNLGradientLayerObservingTypePropertyName;
    if (sender == self) {
        layer = (CAGradientLayer *)[self layer];
        [self removeObserver:observer forKeyPath:keyPath];
        [layer setType:[self type]];
        [self addObserver:observer forKeyPath:keyPath options:kNilOptions context:NULL];
    }
    else {
        layer = sender;
        [layer removeObserver:observer forKeyPath:keyPath];
        [self setType:[layer type]];
        [layer addObserver:observer forKeyPath:keyPath options:kNilOptions context:NULL];
    }
}

@end
