#import "NSNotification+BDKKit.h"

@implementation NSNotification (BDKKit)

- (NSTimeInterval)keyboardAnimationDuration {
    return [[self userInfo][UIKeyboardAnimationDurationUserInfoKey] doubleValue];
}

- (CGRect)endingKeyboardFrame {
    return [[self userInfo][UIKeyboardFrameEndUserInfoKey] CGRectValue];
}

- (CGRect)beginningKeyboardFrame {
    return [[self userInfo][UIKeyboardFrameBeginUserInfoKey] CGRectValue];
}

@end