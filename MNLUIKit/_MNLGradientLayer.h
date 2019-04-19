#import "_MNLGradientLayerObservationDelegate.h"


@import QuartzCore;


@interface _MNLGradientLayer : CAGradientLayer

@property (nonatomic, weak, setter=_setLayerObservationDelegate:) id<_MNLLayerObservationDelegate> _layerObservationDelegate;

@property (nonatomic, weak, setter=_setGradientLayerObservationDelegate:) id<_MNLGradientLayerObservationDelegate> _gradientLayerObservationDelegate;

@end
