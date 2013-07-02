#import <Foundation/Foundation.h>

/** Handy helpers on top of NSNotification.
 */
@interface NSNotification (BDKKit)

/** Returns the keyboard animation duration stored in the notification's user info dictionary.
 */
- (NSTimeInterval)keyboardAnimationDuration;

/** Returns a rect of the ending frame of the keyboard (after the animation).
 */
- (CGRect)keyboardEndFrame;

/** Returns a rect of the beginning frame of the keyboard (after the animation).
 */
- (CGRect)keyboardBeginFrame;

@end