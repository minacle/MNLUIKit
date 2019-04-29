#import "MNLUIGradientButton.h"
#import "_MNLGradientViewLayerProjection.h"
#import "_MNLGradientLayer.h"
#import "_MNLGradientLayerObserver.h"


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


@interface MNLUIGradientButton () <_MNLGradientViewLayerProjection, _MNLGradientLayerObservationDelegate>

// MARK: (Properties)

- (void)_setCornerRadiusAutomatically;

@end


@implementation MNLUIGradientButton

{
    NSMutableDictionary *_colorsDictionary;
    NSMutableDictionary *_locationsDictionary;
}

// MARK: (Properties)

+ (Class)layerClass {
    return [_MNLGradientLayer class];
}

- (UIColor *)startColor {
    return [[(CAGradientLayer *)[self layer] colors] firstObject];
}

- (void)setStartColor:(UIColor *)startColor {
    CAGradientLayer *layer = (CAGradientLayer *)[self layer];
    @autoreleasepool {
        if (![layer colors] || [[layer colors] count] == 0)
            [layer setColors:@[(id)[startColor CGColor]]];
        else {
            NSMutableArray *colors = [[layer colors] mutableCopy];
            [colors setObject:(id)[startColor CGColor] atIndexedSubscript:0];
            [layer setColors:[colors copy]];
            colors = nil;
        }
    }
}

- (UIColor *)endColor {
    return [[(CAGradientLayer *)[self layer] colors] lastObject];
}

- (void)setEndColor:(UIColor *)endColor {
    CAGradientLayer *layer = (CAGradientLayer *)[self layer];
    @autoreleasepool {
        if (![layer colors] || [[layer colors] count] == 0)
            [layer setColors:@[(id)[[UIColor new] CGColor], (id)[endColor CGColor]]];
        else if ([[layer colors] count] == 1)
            [layer setColors:[[layer colors] arrayByAddingObject:(id)[endColor CGColor]]];
        else {
            NSMutableArray *colors = [[layer colors] mutableCopy];
            [colors setObject:(id)[endColor CGColor] atIndexedSubscript:([colors count] - 1)];
            [layer setColors:[colors copy]];
            colors = nil;
        }
    }
}

- (NSArray *)colors {
    CAGradientLayer *layer = (CAGradientLayer *)[self layer];
    id result = nil;
    @autoreleasepool {
        NSMutableArray *colors = [NSMutableArray arrayWithCapacity:[[layer colors] count]];
        for (id color in [layer colors])
            [colors addObject:[UIColor colorWithCGColor:(__bridge void *)(color)]];
        result = [colors copy];
        colors = nil;
    }
    return result;
}

- (void)setColors:(NSArray *)colors {
    @autoreleasepool {
        NSMutableArray *cgColors = [NSMutableArray arrayWithCapacity:[colors count]];
        for (UIColor *color in colors)
            [cgColors addObject:(id)[color CGColor]];
        [(CAGradientLayer *)[self layer] setColors:[cgColors copy]];
        cgColors = nil;
    }
}

- (NSArray *)locations {
    return [(CAGradientLayer *)[self layer] locations];
}

- (void)setLocations:(NSArray *)locations {
    [(CAGradientLayer *)[self layer] setLocations:locations];
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

- (NSArray *)colorsForState:(UIControlState)state {
    state = UIControlStateMakeNeat(state);
    NSArray *colors = [_colorsDictionary objectForKey:@(state)];
    if (colors)
        return colors;
    colors = [_colorsDictionary objectForKey:[NSNull null]];
    return colors;
}

- (void)setColors:(NSArray *)colors forState:(UIControlState)state {
    state = UIControlStateMakeNeat(state);
    [_colorsDictionary setObject:colors forKey:@(state)];
    [self setNeedsDisplay];
}

- (NSArray *)locationsForState:(UIControlState)state {
    state = UIControlStateMakeNeat(state);
    NSArray *locations = [_locationsDictionary objectForKey:@(state)];
    if (locations)
        return locations;
    locations = [_locationsDictionary objectForKey:[NSNull null]];
    return locations;
}

- (void)setLocations:(NSArray *)locations forState:(UIControlState)state {
    state = UIControlStateMakeNeat(state);
    [_locationsDictionary setObject:locations forKey:@(state)];
    [self setNeedsDisplay];
}

- (NSArray *)currentColors {
    return [self colorsForState:[self state]];
}

- (NSArray *)currentLocations {
    return [self locationsForState:[self state]];
}

// MARK: (Methods)

+ (instancetype)allocWithZone:(struct _NSZone *)zone {
    id object = [super allocWithZone:zone];
    if (object) {
        id observer = [_MNLGradientLayerObserver sharedObserver];
        [object addObserver:observer forKeyPath:_MNLGradientLayerObservingEndPointPropertyName options:kNilOptions context:NULL];
        [object addObserver:observer forKeyPath:_MNLGradientLayerObservingStartPointPropertyName options:kNilOptions context:NULL];
        [object addObserver:observer forKeyPath:_MNLGradientLayerObservingTypePropertyName options:kNilOptions context:NULL];
    }
    return object;
}

+ (instancetype)button {
    return [self new];
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

- (void)dealloc {
    id observer = [_MNLGradientLayerObserver sharedObserver];
    [self removeObserver:observer forKeyPath:_MNLGradientLayerObservingEndPointPropertyName];
    [self removeObserver:observer forKeyPath:_MNLGradientLayerObservingStartPointPropertyName];
    [self removeObserver:observer forKeyPath:_MNLGradientLayerObservingTypePropertyName];
}

- (void)displayLayer:(CALayer *)layer {
    [super displayLayer:layer];
    if (layer != [self layer])
        return;
    UIControlState state = UIControlStateMakeNeat([self state]);
    @autoreleasepool {
        NSArray *colors = [self colorsForState:state];
        NSMutableArray *cgColors = [NSMutableArray arrayWithCapacity:[colors count]];
        for (UIColor *color in colors)
            [cgColors addObject:(id)[color CGColor]];
        [(CAGradientLayer *)layer setColors:[cgColors copy]];
        cgColors = nil;
    }
    [(CAGradientLayer *)layer setLocations:[self locationsForState:state]];
}

- (void)prepareForInterfaceBuilder {
    [super prepareForInterfaceBuilder];
    [self setNeedsDisplay];
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

// MARK: _MNLGradientLayerObservationDelegate

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
