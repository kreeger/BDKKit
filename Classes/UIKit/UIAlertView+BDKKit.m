#import "UIAlertView+BDKKit.h"

@implementation UIAlertView (BDKKit)

+ (void)showSimpleAlertWithTitle:(NSString *)title message:(NSString *)message closeText:(NSString *)closeText {
    [[[self alloc] initWithTitle:title
                         message:message
                        delegate:nil
               cancelButtonTitle:closeText
               otherButtonTitles:nil] show];
}

@end
