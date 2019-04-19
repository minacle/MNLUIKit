#import "_MNLGradientLayer.h"
#import "_MNLGradientLayerObserver.h"
#import "_MNLGradientLayerObservationDelegate.h"
#import "_MNLLayerObserver.h"


@import UIKit.UIGeometry;


@interface _MNLGradientLayer () <_MNLGradientLayerObserving>

@end


@implementation _MNLGradientLayer

@synthesize _layerObservationDelegate = _layerObservationDelegate;
@synthesize _gradientLayerObservationDelegate = _gradientLayerObservationDelegate;

- (id<_MNLLayerObservationDelegate>)_layerObservationDelegate {
    return _layerObservationDelegate;
}

- (void)_setLayerObservationDelegate:(id<_MNLLayerObservationDelegate>)layerObservationDelegate {
    _layerObservationDelegate = layerObservationDelegate;
}

- (id<_MNLGradientLayerObservationDelegate>)_gradientLayerObservationDelegate {
    return _gradientLayerObservationDelegate;
}

- (void)_setGradientLayerObservationDelegate:(id<_MNLGradientLayerObservationDelegate>)gradientLayerObservationDelegate {
    _gradientLayerObservationDelegate = gradientLayerObservationDelegate;
}

+ (id)defaultValueForKey:(NSString *)key {
    if ([key isEqualToString:_MNLLayerObservingShadowOffsetPropertyName])
        return [NSValue valueWithCGSize:CGSizeZero];
    return [super defaultValueForKey:key];
}

+ (instancetype)allocWithZone:(struct _NSZone *)zone {
    id object = [super allocWithZone:zone];
    if (object) {
        id observer;
        observer = [_MNLLayerObserver sharedObserver];
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
        observer = [_MNLGradientLayerObserver sharedObserver];
        [object addObserver:observer forKeyPath:_MNLGradientLayerObservingColorsPropertyName options:kNilOptions context:NULL];
        [object addObserver:observer forKeyPath:_MNLGradientLayerObservingLocationsPropertyName options:kNilOptions context:NULL];
        [object addObserver:observer forKeyPath:_MNLGradientLayerObservingEndPointPropertyName options:kNilOptions context:NULL];
        [object addObserver:observer forKeyPath:_MNLGradientLayerObservingStartPointPropertyName options:kNilOptions context:NULL];
        [object addObserver:observer forKeyPath:_MNLGradientLayerObservingTypePropertyName options:kNilOptions context:NULL];
    }
    return object;
}

- (void)dealloc {
    id observer;
    observer = [_MNLLayerObserver sharedObserver];
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
    observer = [_MNLGradientLayerObserver sharedObserver];
    [self removeObserver:observer forKeyPath:_MNLGradientLayerObservingColorsPropertyName];
    [self removeObserver:observer forKeyPath:_MNLGradientLayerObservingLocationsPropertyName];
    [self removeObserver:observer forKeyPath:_MNLGradientLayerObservingEndPointPropertyName];
    [self removeObserver:observer forKeyPath:_MNLGradientLayerObservingStartPointPropertyName];
    [self removeObserver:observer forKeyPath:_MNLGradientLayerObservingTypePropertyName];

}

- (void)_backgroundColorDidChange:(id)sender {
    [[self _layerObservationDelegate] _backgroundColorDidChange:self];
}

- (void)_borderWidthDidChange:(id)sender {
    [[self _layerObservationDelegate] _borderWidthDidChange:self];
}

- (void)_borderColorDidChange:(id)sender {
    [[self _layerObservationDelegate] _borderColorDidChange:self];
}

- (void)_cornerRadiusDidChange:(id)sender {
    [[self _layerObservationDelegate] _cornerRadiusDidChange:self];
}

- (void)_frameDidChange:(id)sender {
    [[self _layerObservationDelegate] _frameDidChange:self];
}

- (void)_shadowOpacityDidChange:(id)sender {
    [[self _layerObservationDelegate] _shadowOpacityDidChange:self];
}

- (void)_shadowRadiusDidChange:(id)sender {
    [[self _layerObservationDelegate] _shadowRadiusDidChange:self];
}

- (void)_shadowOffsetDidChange:(id)sender {
    [[self _layerObservationDelegate] _shadowOffsetDidChange:self];
}

- (void)_shadowColorDidChange:(id)sender {
    [[self _layerObservationDelegate] _shadowColorDidChange:self];
}

- (void)_shadowPathDidChange:(id)sender {
    [[self _layerObservationDelegate] _shadowPathDidChange:self];
}

- (void)_colorsDidChange:(id)sender {
    [[self _gradientLayerObservationDelegate] _colorsDidChange:self];
}

- (void)_locationsDidChange:(id)sender {
    [[self _gradientLayerObservationDelegate] _locationsDidChange:self];
}

- (void)_endPointDidChange:(id)sender {
    [[self _gradientLayerObservationDelegate] _endPointDidChange:self];
}

- (void)_startPointDidChange:(id)sender {
    [[self _gradientLayerObservationDelegate] _startPointDidChange:self];
}

- (void)_typeDidChange:(id)sender {
    [[self _gradientLayerObservationDelegate] _typeDidChange:self];
}

@end
