#import "_MNLLayerObservationDelegate.h"


@import QuartzCore;


@interface _MNLLayer : CALayer

@property (nonatomic, weak, setter=_setLayerObservationDelegate:) id<_MNLLayerObservationDelegate> _layerObservationDelegate;

@end
