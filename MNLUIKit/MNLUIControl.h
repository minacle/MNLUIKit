#import <MNLUIKit/MNLUIView.h>


@protocol MNLUIControl <MNLUIView>

@property (nonatomic, nullable) UIColor *borderColor NS_UNAVAILABLE;
@property (nonatomic) CGFloat borderWidth NS_UNAVAILABLE;

@property (nonatomic) float shadowOpacity NS_UNAVAILABLE;
@property (nonatomic) CGFloat shadowRadius NS_UNAVAILABLE;
@property (nonatomic, nullable) UIColor *shadowColor NS_UNAVAILABLE;

- (UIColor *_Nullable)borderColorForState:(UIControlState)state;
- (void)setBorderColor:(UIColor *_Nullable)borderColor forState:(UIControlState)state;
- (CGFloat)borderWidthForState:(UIControlState)state;
- (void)setBorderWidth:(CGFloat)borderWidth forState:(UIControlState)state;

- (float)shadowOpacityForState:(UIControlState)state;
- (void)setShadowOpacity:(float)shadowOpacity forState:(UIControlState)state;
- (CGFloat)shadowRadiusForState:(UIControlState)state;
- (void)setShadowRadius:(CGFloat)shadowRadius forState:(UIControlState)state;
- (UIColor *_Nullable)shadowColorForState:(UIControlState)state;
- (void)setShadowColor:(UIColor *_Nullable)shadowColor forState:(UIControlState)state;

@property (nonatomic, nullable, readonly) UIColor *currentBorderColor;
@property (nonatomic, readonly) CGFloat currentBorderWidth;

@property (nonatomic, readonly) float currentShadowOpacity;
@property (nonatomic, readonly) CGFloat currentShadowRadius;
@property (nonatomic, nullable, readonly) UIColor *currentShadowColor;

@end


IB_DESIGNABLE
@interface MNLUIControl : UIControl <MNLUIControl>

@property (nonatomic) IBInspectable CGFloat cornerRadius;

@property (nonatomic, nullable) IBInspectable UIColor *borderColor NS_UNAVAILABLE;
@property (nonatomic) IBInspectable CGFloat borderWidth NS_UNAVAILABLE;

@property (nonatomic) IBInspectable float shadowOpacity NS_UNAVAILABLE;
@property (nonatomic) IBInspectable CGFloat shadowRadius NS_UNAVAILABLE;
@property (nonatomic) IBInspectable CGSize shadowOffset;
@property (nonatomic, nullable) IBInspectable UIColor *shadowColor NS_UNAVAILABLE;
@property (nonatomic, nullable) UIBezierPath *shadowPath;

- (UIColor *_Nullable)borderColorForState:(UIControlState)state;
- (void)setBorderColor:(UIColor *_Nullable)borderColor forState:(UIControlState)state;
- (CGFloat)borderWidthForState:(UIControlState)state;
- (void)setBorderWidth:(CGFloat)borderWidth forState:(UIControlState)state;

- (float)shadowOpacityForState:(UIControlState)state;
- (void)setShadowOpacity:(float)shadowOpacity forState:(UIControlState)state;
- (CGFloat)shadowRadiusForState:(UIControlState)state;
- (void)setShadowRadius:(CGFloat)shadowRadius forState:(UIControlState)state;
- (UIColor *_Nullable)shadowColorForState:(UIControlState)state;
- (void)setShadowColor:(UIColor *_Nullable)shadowColor forState:(UIControlState)state;

@property (nonatomic, nullable, readonly) UIColor *currentBorderColor;
@property (nonatomic) CGFloat currentBorderWidth;

@property (nonatomic) float currentShadowOpacity;
@property (nonatomic) CGFloat currentShadowRadius;
@property (nonatomic, nullable) UIColor *currentShadowColor;

@end
