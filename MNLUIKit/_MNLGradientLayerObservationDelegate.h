#import "_MNLLayerObservationDelegate.h"
#import "_MNLLayerObserving.h"


@protocol _MNLGradientLayerObservationDelegate <_MNLLayerObservationDelegate>

@optional
- (void)_colorsDidChange:(id)sender;
- (void)_locationsDidChange:(id)sender;
- (void)_endPointDidChange:(id)sender;
- (void)_startPointDidChange:(id)sender;
- (void)_typeDidChange:(id)sender;

@end
