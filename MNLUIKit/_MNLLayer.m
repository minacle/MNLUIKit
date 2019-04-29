#import "_MNLLayer.h"
#import "_MNLLayerObserver.h"
#import "_MNLLayerObservationDelegate.h"


@import UIKit.UIGeometry;


@interface _MNLLayer () <_MNLLayerObserving>

@end


@implementation _MNLLayer

@synthesize _layerObservationDelegate = _layerObservationDelegate;

- (id<_MNLLayerObservationDelegate>)_layerObservationDelegate {
    return _layerObservationDelegate;
}

- (void)_setLayerObservationDelegate:(id<_MNLLayerObservationDelegate>)layerObservationDelegate {
    _layerObservationDelegate = layerObservationDelegate;
}

+ (id)defaultValueForKey:(NSString *)key {
    if ([key isEqualToString:_MNLLayerObservingShadowOffsetPropertyName])
        return [NSValue valueWithCGSize:CGSizeZero];
    return [super defaultValueForKey:key];
}

+ (instancetype)allocWithZone:(struct _NSZone *)zone {
    id object = [super allocWithZone:zone];
    if (object) {
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

- (void)_backgroundColorDidChange:(id)sender {
    id delegate = [self _layerObservationDelegate];
    if ([delegate respondsToSelector:_cmd])
        [delegate performSelectorOnMainThread:_cmd withObject:self waitUntilDone:YES];
}

- (void)_borderWidthDidChange:(id)sender {
    id delegate = [self _layerObservationDelegate];
    if ([delegate respondsToSelector:_cmd])
        [delegate performSelectorOnMainThread:_cmd withObject:self waitUntilDone:YES];
}

- (void)_borderColorDidChange:(id)sender {
    id delegate = [self _layerObservationDelegate];
    if ([delegate respondsToSelector:_cmd])
        [delegate performSelectorOnMainThread:_cmd withObject:self waitUntilDone:YES];
}

- (void)_cornerRadiusDidChange:(id)sender {
    id delegate = [self _layerObservationDelegate];
    if ([delegate respondsToSelector:_cmd])
        [delegate performSelectorOnMainThread:_cmd withObject:self waitUntilDone:YES];
}

- (void)_frameDidChange:(id)sender {
    id delegate = [self _layerObservationDelegate];
    if ([delegate respondsToSelector:_cmd])
        [delegate performSelectorOnMainThread:_cmd withObject:self waitUntilDone:YES];
}

- (void)_shadowOpacityDidChange:(id)sender {
    id delegate = [self _layerObservationDelegate];
    if ([delegate respondsToSelector:_cmd])
        [delegate performSelectorOnMainThread:_cmd withObject:self waitUntilDone:YES];
}

- (void)_shadowRadiusDidChange:(id)sender {
    id delegate = [self _layerObservationDelegate];
    if ([delegate respondsToSelector:_cmd])
        [delegate performSelectorOnMainThread:_cmd withObject:self waitUntilDone:YES];
}

- (void)_shadowOffsetDidChange:(id)sender {
    id delegate = [self _layerObservationDelegate];
    if ([delegate respondsToSelector:_cmd])
        [delegate performSelectorOnMainThread:_cmd withObject:self waitUntilDone:YES];
}

- (void)_shadowColorDidChange:(id)sender {
    id delegate = [self _layerObservationDelegate];
    if ([delegate respondsToSelector:_cmd])
        [delegate performSelectorOnMainThread:_cmd withObject:self waitUntilDone:YES];
}

- (void)_shadowPathDidChange:(id)sender {
    id delegate = [self _layerObservationDelegate];
    if ([delegate respondsToSelector:_cmd])
        [delegate performSelectorOnMainThread:_cmd withObject:self waitUntilDone:YES];
}

@end
