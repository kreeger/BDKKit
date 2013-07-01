#import <UIKit/UIKit.h>

@interface UITableView (BDKKit)

- (NSIndexPath *)minimumIndexPath;
- (NSIndexPath *)maximumIndexPath;
- (NSIndexPath *)incrementIndexPath:(NSIndexPath *)indexPath;
- (NSIndexPath *)decrementIndexPath:(NSIndexPath *)indexPath;

@end

