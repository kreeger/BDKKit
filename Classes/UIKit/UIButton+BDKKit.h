#import <UIKit/UIKit.h>

@interface UIButton (BDKKit)

+ (instancetype)buttonWithCustomView:(UIView *)customView;
+ (instancetype)buttonWithCustomView:(UIView *)customView size:(CGSize)size;
+ (instancetype)buttonWithBarStyleAndTintColor:(UIColor *)tintColor customView:(UIView *)customView;
+ (instancetype)buttonWithTranslucentBarStyleAndCustomView:(UIView *)customView;
+ (instancetype)buttonWithDefaultBarStyleAndCustomView:(UIView *)customView;

- (void)setTouchUpInsideBlock:(void (^)(UIButton *sender))touchUpInsideBlock;

@end
