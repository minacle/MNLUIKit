@import UIKit;


@protocol MNLUIView

@property (nonatomic) CGFloat cornerRadius;

@property (nonatomic, nullable) UIColor *borderColor;
@property (nonatomic) CGFloat borderWidth;

@property (nonatomic) float shadowOpacity;
@property (nonatomic) CGFloat shadowRadius;
@property (nonatomic) CGSize shadowOffset;
@property (nonatomic, nullable) UIColor *shadowColor;
@property (nonatomic, nullable) UIBezierPath *shadowPath;

@end


IB_DESIGNABLE
@interface MNLUIView : UIView <MNLUIView>

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
