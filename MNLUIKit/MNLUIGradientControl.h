#import <MNLUIKit/MNLUIControl.h>
#import <MNLUIKit/MNLUIGradientView.h>


@protocol MNLUIGradientControl <MNLUIControl, MNLUIGradientView>

@property (nonatomic, nullable) UIColor *startColor NS_UNAVAILABLE;

@property (nonatomic, nullable) UIColor *endColor NS_UNAVAILABLE;

@property (nonatomic, nullable) NSArray<UIColor *> *colors NS_UNAVAILABLE;
@property (nonatomic, nullable) NSArray<NSNumber *> *locations NS_UNAVAILABLE;

- (NSArray<UIColor *> *_Nullable)colorsForState:(UIControlState)state;
- (void)setColors:(NSArray<UIColor *> *_Nullable)colors forState:(UIControlState)state;
- (NSArray<NSNumber *> *_Nullable)locationsForState:(UIControlState)state;
- (void)setLocations:(NSArray<NSNumber *> *_Nullable)locations forState:(UIControlState)state;

@property (nonatomic, nullable, readonly) NSArray<UIColor *> *currentColors;
@property (nonatomic, nullable, readonly) NSArray<NSNumber *> *currentLocations;

@end
