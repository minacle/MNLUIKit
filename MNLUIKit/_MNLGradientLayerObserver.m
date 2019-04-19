#import "_MNLGradientLayerObserver.h"
#import "_MNLGradientLayer.h"


static id _sharedObserver;


static SEL _didChangeSelectorFromKeyPath(NSString *keyPath) {
    return NSSelectorFromString([NSString stringWithFormat:@"_%@DidChange:", keyPath]);
}


@implementation _MNLGradientLayerObserver

+ (instancetype)sharedObserver {
    if (!_sharedObserver)
        _sharedObserver = [self new];
    return _sharedObserver;
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(id)change context:(void *)context {
    SEL selector = NULL;
    if ([keyPath isEqualToString:_MNLGradientLayerObservingColorsPropertyName] && [object respondsToSelector:(selector = _didChangeSelectorFromKeyPath(keyPath))])
        [object performSelectorOnMainThread:selector withObject:object waitUntilDone:YES];
    else if ([keyPath isEqualToString:_MNLGradientLayerObservingLocationsPropertyName] && [object respondsToSelector:(selector = _didChangeSelectorFromKeyPath(keyPath))])
        [object performSelectorOnMainThread:selector withObject:object waitUntilDone:YES];
    else if ([keyPath isEqualToString:_MNLGradientLayerObservingEndPointPropertyName] && [object respondsToSelector:(selector = _didChangeSelectorFromKeyPath(keyPath))])
        [object performSelectorOnMainThread:selector withObject:object waitUntilDone:YES];
    else if ([keyPath isEqualToString:_MNLGradientLayerObservingStartPointPropertyName] && [object respondsToSelector:(selector = _didChangeSelectorFromKeyPath(keyPath))])
        [object performSelectorOnMainThread:selector withObject:object waitUntilDone:YES];
    else if ([keyPath isEqualToString:_MNLGradientLayerObservingTypePropertyName] && [object respondsToSelector:(selector = _didChangeSelectorFromKeyPath(keyPath))])
        [object performSelectorOnMainThread:selector withObject:object waitUntilDone:YES];
    else
        [super observeValueForKeyPath:keyPath ofObject:object change:change context:context];
}

@end
