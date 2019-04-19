#import "_MNLLayerObserver.h"
#import "_MNLLayer.h"


static id _sharedObserver;


static SEL _didChangeSelectorFromKeyPath(NSString *keyPath) {
    return NSSelectorFromString([NSString stringWithFormat:@"_%@DidChange:", keyPath]);
}


@implementation _MNLLayerObserver

+ (instancetype)sharedObserver {
    if (!_sharedObserver)
        _sharedObserver = [self new];
    return _sharedObserver;
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(id)change context:(void *)context {
    SEL selector = NULL;
    if ([keyPath isEqualToString:_MNLLayerObservingBackgroundColorPropertyName] && [object respondsToSelector:(selector = _didChangeSelectorFromKeyPath(keyPath))])
        [object performSelectorOnMainThread:selector withObject:object waitUntilDone:YES];
    else if ([keyPath isEqualToString:_MNLLayerObservingBorderColorPropertyName] && [object respondsToSelector:(selector = _didChangeSelectorFromKeyPath(keyPath))])
        [object performSelectorOnMainThread:selector withObject:object waitUntilDone:YES];
    else if ([keyPath isEqualToString:_MNLLayerObservingBorderWidthPropertyName] && [object respondsToSelector:(selector = _didChangeSelectorFromKeyPath(keyPath))])
        [object performSelectorOnMainThread:selector withObject:object waitUntilDone:YES];
    else if ([keyPath isEqualToString:_MNLLayerObservingCornerRadiusPropertyName] && [object respondsToSelector:(selector = _didChangeSelectorFromKeyPath(keyPath))])
        [object performSelectorOnMainThread:selector withObject:object waitUntilDone:YES];
    else if ([keyPath isEqualToString:_MNLLayerObservingFramePropertyName] && [object respondsToSelector:(selector = _didChangeSelectorFromKeyPath(keyPath))])
        [object performSelectorOnMainThread:selector withObject:object waitUntilDone:YES];
    else if ([keyPath isEqualToString:_MNLLayerObservingShadowColorPropertyName] && [object respondsToSelector:(selector = _didChangeSelectorFromKeyPath(keyPath))])
        [object performSelectorOnMainThread:selector withObject:object waitUntilDone:YES];
    else if ([keyPath isEqualToString:_MNLLayerObservingShadowOffsetPropertyName] && [object respondsToSelector:(selector = _didChangeSelectorFromKeyPath(keyPath))])
        [object performSelectorOnMainThread:selector withObject:object waitUntilDone:YES];
    else if ([keyPath isEqualToString:_MNLLayerObservingShadowOpacityPropertyName] && [object respondsToSelector:(selector = _didChangeSelectorFromKeyPath(keyPath))])
        [object performSelectorOnMainThread:selector withObject:object waitUntilDone:YES];
    else if ([keyPath isEqualToString:_MNLLayerObservingShadowPathPropertyName] && [object respondsToSelector:(selector = _didChangeSelectorFromKeyPath(keyPath))])
        [object performSelectorOnMainThread:selector withObject:object waitUntilDone:YES];
    else if ([keyPath isEqualToString:_MNLLayerObservingShadowRadiusPropertyName] && [object respondsToSelector:(selector = _didChangeSelectorFromKeyPath(keyPath))])
        [object performSelectorOnMainThread:selector withObject:object waitUntilDone:YES];
    else
        [super observeValueForKeyPath:keyPath ofObject:object change:change context:context];
}

@end
