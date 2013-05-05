#import <UIKit/UIKit.h>

/** A convenience wrapper for some UIAlertView stuff.
 */
@interface UIAlertView (BDKKit)

+ (void)showSimpleAlertWithTitle:(NSString *)title message:(NSString *)message closeText:(NSString *)closeText;

@end
