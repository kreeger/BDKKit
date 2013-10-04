#import <UIKit/UIKit.h>

/**
 A convenience wrapper for some UIAlertView stuff.
 */
@interface UIAlertView (BDKKit)

/**
 If you don't need a delegate, this creates and shows a UIAlertView all in one.
 
 @param title The alert view title.
 @param message The body message of the alert.
 @param closeText The message that will show up in the only button to dismiss the alert.
 */
+ (void)showSimpleAlertWithTitle:(NSString *)title message:(NSString *)message closeText:(NSString *)closeText;

/**
 In place of a delegate, this calls show on an alert view and passes delegate methods to this block instead.
 
 @param completion A block to be called when a user taps on a button.
 */
- (void)showWithCompletion:(void(^)(UIAlertView *alertView, NSInteger buttonIndex))completion;

@end
