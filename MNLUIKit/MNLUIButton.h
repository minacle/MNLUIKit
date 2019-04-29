#import <MNLUIKit/MNLUIControl.h>


@import UIKit;


IB_DESIGNABLE
@interface MNLUIButton : UIButton <MNLUIControl>

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
@property (nonatomic, readonly) CGFloat currentBorderWidth;

@property (nonatomic, readonly) float currentShadowOpacity;
@property (nonatomic, readonly) CGFloat currentShadowRadius;
@property (nonatomic, nullable, readonly) UIColor *currentShadowColor;

@property (nonatomic, nullable, copy) UIColor *backgroundColor NS_UNAVAILABLE;

- (UIColor *_Nullable)backgroundColorForState:(UIControlState)state;
- (void)setBackgroundColor:(UIColor *_Nullable)backgroundColor forState:(UIControlState)state;

@property (nonatomic, nullable, readonly) UIColor *currentBackgroundColor;

- (CGFloat)titleOpacityForState:(UIControlState)state;
- (CGFloat)imageOpacityForState:(UIControlState)state;
- (CGFloat)layerOpacityForState:(UIControlState)state;

@property (nonatomic, readonly) CGFloat currentTitleOpacity;
@property (nonatomic, readonly) CGFloat currentImageOpacity;
@property (nonatomic, readonly) CGFloat currentLayerOpacity;

+ (instancetype _Nonnull)buttonWithType:(UIButtonType)buttonType NS_UNAVAILABLE;
+ (instancetype _Nonnull)button;

@end
