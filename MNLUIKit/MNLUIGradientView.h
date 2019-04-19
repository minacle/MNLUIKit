#import "MNLUIView.h"


IB_DESIGNABLE
@interface MNLUIGradientView : MNLUIView

@property (nonatomic, nullable) IBInspectable UIColor *startColor;
@property (nonatomic) IBInspectable CGPoint startPoint;

@property (nonatomic, nullable) IBInspectable UIColor *endColor;
@property (nonatomic) IBInspectable CGPoint endPoint;

@property (nonatomic, nullable) NSArray<UIColor *> *colors;
@property (nonatomic, nullable) NSArray<NSNumber *> *locations;

@property (nonatomic, nonnull) CAGradientLayerType type;

@end
