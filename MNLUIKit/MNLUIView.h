@import UIKit;


IB_DESIGNABLE
@interface MNLUIView : UIView

@property (nonatomic) IBInspectable CGFloat cornerRadius;

@property (nonatomic, nullable) IBInspectable UIColor *borderColor;
@property (nonatomic) IBInspectable CGFloat borderWidth;

@property (nonatomic) IBInspectable float shadowOpacity;
@property (nonatomic) IBInspectable CGFloat shadowRadius;
@property (nonatomic) IBInspectable CGSize shadowOffset;
@property (nonatomic, nullable) IBInspectable UIColor *shadowColor;
@property (nonatomic, nullable) UIBezierPath *shadowPath;

@end


FOUNDATION_EXTERN const CGFloat kMNLUIViewCornerRadiusAutomatic NS_SWIFT_NAME(MNLUIView.automaticCornerRadius);
