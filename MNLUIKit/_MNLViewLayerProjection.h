@import UIKit;


@protocol _MNLViewLayerProjection <NSObject>

@property (nonatomic) CGFloat cornerRadius;
@property (nonatomic, nullable) UIColor *borderColor;
@property (nonatomic) CGFloat borderWidth;
@property (nonatomic) float shadowOpacity;
@property (nonatomic) CGFloat shadowRadius;
@property (nonatomic) CGSize shadowOffset;
@property (nonatomic, nullable) UIColor *shadowColor;
@property (nonatomic, nullable) UIBezierPath *shadowPath;

@end
