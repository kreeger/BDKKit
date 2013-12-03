#import "UIButton+BDKKit.h"
#import "BDKFunctions.h"

#import <BDKGeometry/BDKGeometry.h>
#import <objc/runtime.h>

@interface BDKButtonBlockHandler : NSObject

@property (copy, nonatomic) void (^touchUpInsideBlock)(UIButton *sender);

- (void)handleTouchUpInside:(UIButton *)sender;

@end

@implementation BDKButtonBlockHandler

- (void)handleTouchUpInside:(UIButton *)sender {
    if (self.touchUpInsideBlock) {
        self.touchUpInsideBlock(sender);
    }
}

@end

static const char BDKButtonBlockHandlerKey;

@implementation UIButton (BDKKit)

+ (instancetype)buttonWithCustomView:(UIView *)customView {
    return [self buttonWithCustomView:customView size:CGSizeMake(34.0f, 30.0f)];
}

+ (instancetype)buttonWithCustomView:(UIView *)customView size:(CGSize)size {
    UIButton *button = [self buttonWithType:UIButtonTypeCustom];
    button.frame = (CGRect){ CGPointZero, size };
    [button addSubview:customView];
    customView.userInteractionEnabled = NO;
    [customView centerInView:button direction:BDKGeometryCenterBoth];
    return button;
}

+ (instancetype)buttonWithBarStyleAndTintColor:(UIColor *)tintColor customView:(UIView *)customView {
    UIImage *back = [TintImageWithTintColor([UIImage imageNamed:@"UINavigationBarDefaultButton.png"], tintColor)
                     stretchableImageWithLeftCapWidth:5
                     topCapHeight:0];
    UIImage *pressed = [TintImageWithTintColor([UIImage imageNamed:@"UINavigationBarDefaultButtonPressed.png"], tintColor)
                        stretchableImageWithLeftCapWidth:5
                        topCapHeight:0];
    return [self buttonWithImages:@[back, pressed] andCustomView:customView];
}

+ (instancetype)buttonWithTranslucentBarStyleAndCustomView:(UIView *)customView {
    UIImage *back = [[UIImage imageNamed:@"UINavigationBarBlackTranslucentButton.png"]
                     stretchableImageWithLeftCapWidth:5
                     topCapHeight:0];
    UIImage *pressed = [[UIImage imageNamed:@"UINavigationBarBlackTranslucentButtonPressed.png"]
                        stretchableImageWithLeftCapWidth:5
                        topCapHeight:0];
    return [self buttonWithImages:@[back, pressed] andCustomView:customView];
}

+ (instancetype)buttonWithDefaultBarStyleAndCustomView:(UIView *)customView {
    UIImage *back = [[UIImage imageNamed:@"UINavigationBarDefaultButton.png"]
                     stretchableImageWithLeftCapWidth:5
                     topCapHeight:0];
    UIImage *pressed = [[UIImage imageNamed:@"UINavigationBarDefaultButtonPressed.png"]
                        stretchableImageWithLeftCapWidth:5
                        topCapHeight:0];
    return [self buttonWithImages:@[back, pressed] andCustomView:customView];
}

+ (instancetype)buttonWithImages:(NSArray *)images andCustomView:(UIView *)customView {
    UIButton *button = [self buttonWithCustomView:customView];
    [button setBackgroundImage:images[0] forState:UIControlStateNormal];
    [button setBackgroundImage:images[1] forState:UIControlStateSelected];
    [button setBackgroundImage:images[1] forState:UIControlStateHighlighted];
    return button;
}

- (void)setTouchUpInsideBlock:(void (^)(UIButton *sender))touchUpInsideBlock {
    BDKButtonBlockHandler *handler = [BDKButtonBlockHandler new];
    handler.touchUpInsideBlock = touchUpInsideBlock;
    [self addTarget:handler action:@selector(handleTouchUpInside:) forControlEvents:UIControlEventTouchUpInside];
    objc_setAssociatedObject(self, &BDKButtonBlockHandlerKey, handler, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

@end
