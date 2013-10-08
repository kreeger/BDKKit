#import <UIKit/UIKit.h>

@interface UIControl (BDKKit)

/**
 In place of a target/action selector, this wraps the UIControlEventValueChanged action with a block call instead.

 @param completion A block to be called when the value of this control gets changed.
 */
- (void)fireBlockOnValueChange:(void(^)(UIControl *sender))valueChangedBlock;

@end