#import <UIKit/UIKit.h>

typedef enum {
    UIViewEdgeTop = 0,
    UIViewEdgeBottom,
    UIViewEdgeLeft,
    UIViewEdgeRight,
} UIViewEdge;

/** A set of convenience methods for UIView.
 */
@interface UIView (BDKKit)

/** Render a view as an image.
 *  @return a CoreGraphics-rendered version of this view.
 */
- (UIImage *)renderAsImage;

/** Render a view as an image, and returns the result in a block.
 *  @param completion a block to handle rendering completion.
 */
- (void)renderAsImageInBackground:(void(^)(UIImage *image))completion;

/** Assigns a full-on border of a given color and width.
 *  @param color the color to use for the border.
 *  @param width the width the use.
 */
- (void)addBorderWithColor:(UIColor *)color width:(CGFloat)width;

@end
