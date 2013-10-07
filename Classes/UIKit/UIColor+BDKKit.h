#import <UIKit/UIKit.h>

@interface UIColor (BDKKit)

- (UIColor *)lighterColor;
- (UIColor *)lighterColorByAmount:(CGFloat)amount;

- (UIColor *)darkerColor;
- (UIColor *)darkerColorByAmount:(CGFloat)amount;

- (UIColor *)barColor;

@end