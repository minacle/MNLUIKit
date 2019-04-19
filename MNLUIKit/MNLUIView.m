#import "MNLUIView.h"
#import "_MNLViewLayerProjection.h"
#import "_MNLLayer.h"
#import "_MNLLayerObserver.h"


const CGFloat kMNLUIViewCornerRadiusAutomatic = -1;


@interface MNLUIView () <_MNLViewLayerProjection, _MNLLayerObservationDelegate>

// MARK: (Properties)

- (void)_setCornerRadiusAutomatically;

@end


@implementation MNLUIView

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

// MARK: (Methods)

+ (instancetype)allocWithZone:(struct _NSZone *)zone {
    id object = [super allocWithZone:zone];
    if (object) {
        [object setCornerRadius:kMNLUIViewCornerRadiusAutomatic];
        id observer = [_MNLLayerObserver sharedObserver];
        [object addObserver:observer forKeyPath:_MNLLayerObservingBackgroundColorPropertyName options:kNilOptions context:NULL];
        [object addObserver:observer forKeyPath:_MNLLayerObservingBorderColorPropertyName options:kNilOptions context:NULL];
        [object addObserver:observer forKeyPath:_MNLLayerObservingBorderWidthPropertyName options:kNilOptions context:NULL];
        [object addObserver:observer forKeyPath:_MNLLayerObservingCornerRadiusPropertyName options:kNilOptions context:NULL];
        [object addObserver:observer forKeyPath:_MNLLayerObservingFramePropertyName options:kNilOptions context:NULL];
        [object addObserver:observer forKeyPath:_MNLLayerObservingShadowColorPropertyName options:kNilOptions context:NULL];
        [object addObserver:observer forKeyPath:_MNLLayerObservingShadowOffsetPropertyName options:kNilOptions context:NULL];
        [object addObserver:observer forKeyPath:_MNLLayerObservingShadowOpacityPropertyName options:kNilOptions context:NULL];
        [object addObserver:observer forKeyPath:_MNLLayerObservingShadowPathPropertyName options:kNilOptions context:NULL];
        [object addObserver:observer forKeyPath:_MNLLayerObservingShadowRadiusPropertyName options:kNilOptions context:NULL];
    }
    return object;
}

- (instancetype)initWithCoder:(NSCoder *)decoder {
    if (self = [super initWithCoder:decoder])
        [(_MNLLayer *)[self layer] _setLayerObservationDelegate:self];
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame])
        [(_MNLLayer *)[self layer] _setLayerObservationDelegate:self];
    return self;
}

- (void)prepareForInterfaceBuilder {
    [super prepareForInterfaceBuilder];
    [[self layer] setNeedsDisplay];
}

- (void)dealloc {
    id observer = [_MNLLayerObserver sharedObserver];
    [self removeObserver:observer forKeyPath:_MNLLayerObservingBackgroundColorPropertyName];
    [self removeObserver:observer forKeyPath:_MNLLayerObservingBorderColorPropertyName];
    [self removeObserver:observer forKeyPath:_MNLLayerObservingBorderWidthPropertyName];
    [self removeObserver:observer forKeyPath:_MNLLayerObservingCornerRadiusPropertyName];
    [self removeObserver:observer forKeyPath:_MNLLayerObservingFramePropertyName];
    [self removeObserver:observer forKeyPath:_MNLLayerObservingShadowColorPropertyName];
    [self removeObserver:observer forKeyPath:_MNLLayerObservingShadowOffsetPropertyName];
    [self removeObserver:observer forKeyPath:_MNLLayerObservingShadowOpacityPropertyName];
    [self removeObserver:observer forKeyPath:_MNLLayerObservingShadowPathPropertyName];
    [self removeObserver:observer forKeyPath:_MNLLayerObservingShadowRadiusPropertyName];
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

@end
