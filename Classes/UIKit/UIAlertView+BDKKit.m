#import "UIAlertView+BDKKit.h"

#import <objc/runtime.h>

@interface BDKAlertViewBlockHandler : NSObject

@property (copy, nonatomic) void (^completionBlock)(UIAlertView *alertView, NSInteger buttonIndex);

@end

@implementation BDKAlertViewBlockHandler

#pragma mark - UIAlertViewDelegate

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    if (self.completionBlock) self.completionBlock(alertView, buttonIndex);
}

- (void)alertViewCancel:(UIAlertView *)alertView {
    if (self.completionBlock) self.completionBlock(alertView, alertView.cancelButtonIndex);
}

@end

static const char BDKAlertViewBlockHandlerKey;

@implementation UIAlertView (BDKKit)

+ (void)showSimpleAlertWithTitle:(NSString *)title message:(NSString *)message closeText:(NSString *)closeText {
    [[[self alloc] initWithTitle:title
                         message:message
                        delegate:nil
               cancelButtonTitle:closeText
               otherButtonTitles:nil] show];
}

- (void)showWithCompletion:(void (^)(UIAlertView *, NSInteger))completion {
    BDKAlertViewBlockHandler *handler = [BDKAlertViewBlockHandler new];
    handler.completionBlock = completion;
    self.delegate = handler;
    objc_setAssociatedObject(self, &BDKAlertViewBlockHandlerKey, handler, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    [self show];
}

@end
