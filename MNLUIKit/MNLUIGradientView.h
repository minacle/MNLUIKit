#import <MNLUIKit/MNLUIView.h>


@protocol MNLUIGradientView <MNLUIView>

@property (nonatomic, nullable) UIColor *startColor;
@property (nonatomic) CGPoint startPoint;

@property (nonatomic, nullable) UIColor *endColor;
@property (nonatomic) CGPoint endPoint;

@property (nonatomic, nullable) NSArray<UIColor *> *colors;
@property (nonatomic, nullable) NSArray<NSNumber *> *locations;

@property (nonatomic, nonnull) CAGradientLayerType type;

@end


IB_DESIGNABLE
@interface MNLUIGradientView : MNLUIView <MNLUIGradientView>

@property (nonatomic, nullable) IBInspectable UIColor *startColor;
@property (nonatomic) IBInspectable CGPoint startPoint;

@property (nonatomic, nullable) IBInspectable UIColor *endColor;
@property (nonatomic) IBInspectable CGPoint endPoint;

@property (nonatomic, nullable) NSArray<UIColor *> *colors;
@property (nonatomic, nullable) NSArray<NSNumber *> *locations;

@property (nonatomic, nonnull) CAGradientLayerType type;

@end
