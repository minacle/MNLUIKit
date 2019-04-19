@import UIKit;


@protocol _MNLViewLayerProjection <NSObject>

@property (nonatomic) CGFloat cornerRadius;
@property (nonatomic, nullable) UIColor *borderColor NS_AVAILABLE_IOS(2.0);
@property (nonatomic) CGFloat borderWidth;
@property (nonatomic) float shadowOpacity;
@property (nonatomic) CGFloat shadowRadius;
@property (nonatomic) CGSize shadowOffset;
@property (nonatomic, nullable) UIColor *shadowColor NS_AVAILABLE_IOS(2.0);
@property (nonatomic, nullable) UIBezierPath *shadowPath NS_AVAILABLE_IOS(3.2);

@end
