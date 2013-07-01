#import <UIKit/UIKit.h>

/** Adds some helper methods to a UITableView to assist in traversing index paths.
 */
@interface UITableView (BDKKit)

/** The minimum possible index path; in almost every case, this is [0,0].
 */
- (NSIndexPath *)minimumIndexPath;

/** The largest possible index path; calculated as [sectionCount-1, lastIndexInLastSection].
 */
- (NSIndexPath *)maximumIndexPath;

/** Traverses the table view and gets the next-up index path in the table view's data source.
 *  @param indexPath The index path to start from; will attempt to look one higher.
 *  @returns The next up index path. If the max is reached, it will return minimumIndexPath.
 */
- (NSIndexPath *)incrementIndexPath:(NSIndexPath *)indexPath;

/** Traverses the table view and gets the next-down index path in the table view's data source.
 *  @param indexPath The index path to start from; will attempt to look one lower.
 *  @returns The previous index path. If the minimum is reached, it will return maxiumumIndexPath.
 */
- (NSIndexPath *)decrementIndexPath:(NSIndexPath *)indexPath;

@end

