#import "UIButton+BDKKit.h"
#import "BDKFunctions.h"

#import <BDKGeometry/BDKGeometry.h>

@implementation UIButton (BDKKit)

+ (id)buttonWithCustomView:(UIView *)customView {
    return [self buttonWithCustomView:customView size:CGSizeMake(34.0f, 30.0f)];
}

+ (id)buttonWithCustomView:(UIView *)customView size:(CGSize)size {
    UIButton *button = [self buttonWithType:UIButtonTypeCustom];
    button.frame = (CGRect){ CGPointZero, size };
    [button addSubview:customView];
    customView.userInteractionEnabled = NO;
    [customView centerInView:button direction:BDKGeometryCenterBoth];
    return button;
}

+ (id)buttonWithBarStyleAndTintColor:(UIColor *)tintColor customView:(UIView *)customView {
    UIImage *back = [TintImageWithTintColor([UIImage imageNamed:@"UINavigationBarDefaultButton.png"], tintColor)
                     stretchableImageWithLeftCapWidth:5
                     topCapHeight:0];
    UIImage *pressed = [TintImageWithTintColor([UIImage imageNamed:@"UINavigationBarDefaultButtonPressed.png"], tintColor)
                        stretchableImageWithLeftCapWidth:5
                        topCapHeight:0];
    return [self buttonWithImages:@[back, pressed] andCustomView:customView];
}

+ (id)buttonWithTranslucentBarStyleAndCustomView:(UIView *)customView {
    UIImage *back = [[UIImage imageNamed:@"UINavigationBarBlackTranslucentButton.png"]
                     stretchableImageWithLeftCapWidth:5
                     topCapHeight:0];
    UIImage *pressed = [[UIImage imageNamed:@"UINavigationBarBlackTranslucentButtonPressed.png"]
                        stretchableImageWithLeftCapWidth:5
                        topCapHeight:0];
    return [self buttonWithImages:@[back, pressed] andCustomView:customView];
}

+ (id)buttonWithDefaultBarStyleAndCustomView:(UIView *)customView {
    UIImage *back = [[UIImage imageNamed:@"UINavigationBarDefaultButton.png"]
                     stretchableImageWithLeftCapWidth:5
                     topCapHeight:0];
    UIImage *pressed = [[UIImage imageNamed:@"UINavigationBarDefaultButtonPressed.png"]
                        stretchableImageWithLeftCapWidth:5
                        topCapHeight:0];
    return [self buttonWithImages:@[back, pressed] andCustomView:customView];
}

+ (id)buttonWithImages:(NSArray *)images andCustomView:(UIView *)customView {
    UIButton *button = [self buttonWithCustomView:customView];
    [button setBackgroundImage:images[0] forState:UIControlStateNormal];
    [button setBackgroundImage:images[1] forState:UIControlStateSelected];
    [button setBackgroundImage:images[1] forState:UIControlStateHighlighted];
    return button;
}

@end
