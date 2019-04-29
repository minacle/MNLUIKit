#import <MNLUIKit/MNLUIButton.h>
#import <MNLUIKit/MNLUIGradientControl.h>


IB_DESIGNABLE
@interface MNLUIGradientButton : MNLUIButton <MNLUIGradientControl>

@property (nonatomic, nullable) IBInspectable UIColor *startColor NS_UNAVAILABLE;
@property (nonatomic) IBInspectable CGPoint startPoint;

@property (nonatomic, nullable) IBInspectable UIColor *endColor NS_UNAVAILABLE;
@property (nonatomic) IBInspectable CGPoint endPoint;

@property (nonatomic, nullable) NSArray<UIColor *> *colors NS_UNAVAILABLE;
@property (nonatomic, nullable) NSArray<NSNumber *> *locations NS_UNAVAILABLE;

@property (nonatomic, nonnull) CAGradientLayerType type;

- (NSArray<UIColor *> *_Nullable)colorsForState:(UIControlState)state;
- (void)setColors:(NSArray<UIColor *> *_Nullable)colors forState:(UIControlState)state;
- (NSArray<NSNumber *> *_Nullable)locationsForState:(UIControlState)state;
- (void)setLocations:(NSArray<NSNumber *> *_Nullable)locations forState:(UIControlState)state;

@property (nonatomic, nullable, readonly) NSArray<UIColor *> *currentColors;
@property (nonatomic, nullable, readonly) NSArray<NSNumber *> *currentLocations;

@end
