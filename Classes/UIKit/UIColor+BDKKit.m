#import "UIColor+BDKKit.h"

@implementation UIColor (BDKKit)

- (UIColor *)lighterColor {
    return [self lighterColorByAmount:0.2];
}

- (UIColor *)lighterColorByAmount:(CGFloat)amount {
    CGFloat r, g, b, a;
    if ([self getRed:&r green:&g blue:&b alpha:&a])
        return [UIColor colorWithRed:MIN(r + amount, 1.0)
                               green:MIN(g + amount, 1.0)
                                blue:MIN(b + amount, 1.0)
                               alpha:a];
    return nil;
}

- (UIColor *)darkerColor {
    return [self darkerColorByAmount:0.2];
}

- (UIColor *)darkerColorByAmount:(CGFloat)amount {
    CGFloat r, g, b, a;
    if ([self getRed:&r green:&g blue:&b alpha:&a])
        return [UIColor colorWithRed:MAX(r - amount, 0.0)
                               green:MAX(g - amount, 0.0)
                                blue:MAX(b - amount, 0.0)
                               alpha:a];
    return nil;
}

- (UIColor *)barColor {
    CGFloat r, g, b, a;
    if ([self getRed:&r green:&g blue:&b alpha:&a])
        return [UIColor colorWithRed:MAX((r - 102) / 0.6, 0.0)
                               green:MAX((g - 102) / 0.6, 0.0)
                                blue:MAX((b - 102) / 0.6, 0.0)
                               alpha:a];
    return nil;
}

@end