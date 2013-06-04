#import <UIKit/UIKit.h>

@interface UIButton (BDKKit)

+ (id)buttonWithCustomView:(UIView *)customView;
+ (id)buttonWithCustomView:(UIView *)customView size:(CGSize)size;
+ (id)buttonWithBarStyleAndTintColor:(UIColor *)tintColor customView:(UIView *)customView;
+ (id)buttonWithTranslucentBarStyleAndCustomView:(UIView *)customView;
+ (id)buttonWithDefaultBarStyleAndCustomView:(UIView *)customView;

@end
