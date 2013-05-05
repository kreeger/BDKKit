#import "UIImageView+BDKKit.h"

@implementation UIImageView (BDKKit)

+ (id)imageViewWithImage:(UIImage *)image {
    return [[UIImageView alloc] initWithImage:image];
}

+ (id)imageViewWithImage:(UIImage *)image highlightedImage:(UIImage *)highlightedImage {
    return [[UIImageView alloc] initWithImage:image highlightedImage:highlightedImage];
}

@end
