#import "_MNLViewLayerProjection.h"


@protocol _MNLGradientViewLayerProjection <NSObject>

@property (nonatomic, nullable) NSArray<UIColor *> *colors;
@property (nonatomic, nullable) NSArray<NSNumber *> *locations;
@property (nonatomic) CGPoint endPoint;
@property (nonatomic) CGPoint startPoint;
@property (nonatomic, nonnull) CAGradientLayerType type;

@end
