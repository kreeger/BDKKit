#import "NSNotification+BDKKit.h"

@implementation NSNotification (BDKKit)

- (NSTimeInterval)keyboardAnimationDuration {
    return [[self userInfo][UIKeyboardAnimationDurationUserInfoKey] doubleValue];
}

- (CGRect)keyboardEndFrame {
    return [[self userInfo][UIKeyboardFrameEndUserInfoKey] CGRectValue];
}

- (CGRect)keyboardBeginFrame {
    return [[self userInfo][UIKeyboardFrameBeginUserInfoKey] CGRectValue];
}

@end