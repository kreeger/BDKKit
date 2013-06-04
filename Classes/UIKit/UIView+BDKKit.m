#import "UIView+BDKKit.h"

#import <QuartzCore/QuartzCore.h>

@implementation UIView (BDKKit)

- (UIImage *)renderAsImage {
    UIGraphicsBeginImageContextWithOptions(self.bounds.size, self.opaque, [[UIScreen mainScreen] scale]);
    [self.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return img;
}

- (void)renderAsImageInBackground:(void(^)(UIImage *image))completion {
    dispatch_async(dispatch_get_main_queue(), ^{
        UIImage *image = [self renderAsImage];
        completion(image);
    });
}

- (void)addBorderWithColor:(UIColor *)color {
    [self addBorderWithColor:color width:1.0f];
}

- (void)addBorderWithColor:(UIColor *)color width:(CGFloat)width {
    self.layer.borderColor = color.CGColor;
    self.layer.borderWidth = width;
}

@end
