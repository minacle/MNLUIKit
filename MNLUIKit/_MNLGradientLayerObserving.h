#import "_MNLLayerObserving.h"
#import "_MNLLayerObservingPropertyName+Gradient.h"


@protocol _MNLGradientLayerObserving <_MNLLayerObserving>

- (void)_colorsDidChange:(id)sender;
- (void)_locationsDidChange:(id)sender;
- (void)_endPointDidChange:(id)sender;
- (void)_startPointDidChange:(id)sender;
- (void)_typeDidChange:(id)sender;

@end
