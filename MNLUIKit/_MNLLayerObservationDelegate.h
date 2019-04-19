#import "_MNLLayerObserving.h"


@protocol _MNLLayerObservationDelegate <NSObject>

@optional
- (void)_backgroundColorDidChange:(id)sender;
- (void)_borderWidthDidChange:(id)sender;
- (void)_borderColorDidChange:(id)sender;
- (void)_cornerRadiusDidChange:(id)sender;
- (void)_frameDidChange:(id)sender;
- (void)_shadowOpacityDidChange:(id)sender;
- (void)_shadowRadiusDidChange:(id)sender;
- (void)_shadowOffsetDidChange:(id)sender;
- (void)_shadowColorDidChange:(id)sender;
- (void)_shadowPathDidChange:(id)sender;

@end
