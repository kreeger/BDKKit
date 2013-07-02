#import "UICollectionView+BDKKit.h"

@implementation UICollectionView (BDKKit)

- (NSIndexPath *)minimumIndexPath {
    return [NSIndexPath indexPathForItem:0 inSection:0];
}

- (NSIndexPath *)maximumIndexPath {
    NSInteger lastSection = self.numberOfSections - 1;
    NSInteger lastitem = [self numberOfItemsInSection:lastSection] - 1;
    return [NSIndexPath indexPathForItem:lastitem inSection:lastSection];
}

- (NSIndexPath *)incrementIndexPath:(NSIndexPath *)indexPath {
    return [self incrementIndexPath:indexPath wrap:YES];
}

- (NSIndexPath *)incrementIndexPath:(NSIndexPath *)indexPath wrap:(BOOL)wrap {
    if ([indexPath compare:self.maximumIndexPath] == NSOrderedSame) return wrap ? self.minimumIndexPath : nil;
    if (indexPath.item == [self numberOfItemsInSection:indexPath.section] - 1) {
        return [NSIndexPath indexPathForItem:0 inSection:(indexPath.section + 1)];
    } else return [NSIndexPath indexPathForItem:(indexPath.item + 1) inSection:indexPath.section];
}

- (NSIndexPath *)decrementIndexPath:(NSIndexPath *)indexPath {
    return [self decrementIndexPath:indexPath wrap:YES];
}

- (NSIndexPath *)decrementIndexPath:(NSIndexPath *)indexPath wrap:(BOOL)wrap {
    if ([indexPath compare:self.minimumIndexPath] == NSOrderedSame) return wrap ? self.maximumIndexPath : nil;
    if (indexPath.item == 0) {
        NSInteger lastItem = [self numberOfItemsInSection:(indexPath.section - 1)] - 1;
        return [NSIndexPath indexPathForItem:lastItem inSection:(indexPath.section - 1)];
    } else return [NSIndexPath indexPathForItem:(indexPath.item - 1) inSection:indexPath.section];
}

@end
