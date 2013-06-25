#import <UIKit/UIKit.h>

/** Adds a block-based interface to UIGestureRecognizer.
 */
@interface UIGestureRecognizer (BDKKit)

/** Stores a block to be fired when the tap event is handled.
 */
@property (copy, nonatomic) void (^actionBlock)(UIGestureRecognizer *sender);

- (void)callStoredBlockForSender:(UIGestureRecognizer *)sender;

@end