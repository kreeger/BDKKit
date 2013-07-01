#import <UIKit/UIKit.h>

@interface UICollectionView (BDKKit)

- (NSIndexPath *)minimumIndexPath;
- (NSIndexPath *)maximumIndexPath;
- (NSIndexPath *)incrementIndexPath:(NSIndexPath *)indexPath;
- (NSIndexPath *)decrementIndexPath:(NSIndexPath *)indexPath;

@end
