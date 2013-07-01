#import "UITableView+BDKKit.h"

@implementation UITableView (BDKKit)

- (NSIndexPath *)minimumIndexPath {
    return [NSIndexPath indexPathForRow:0 inSection:0];
}

- (NSIndexPath *)maximumIndexPath {
    NSInteger lastSection = self.numberOfSections - 1;
    NSInteger lastRow = [self numberOfRowsInSection:lastSection] - 1;
    return [NSIndexPath indexPathForRow:lastRow inSection:lastSection];
}

- (NSIndexPath *)incrementIndexPath:(NSIndexPath *)indexPath {
    if ([indexPath compare:self.maximumIndexPath] == NSOrderedSame) return self.minimumIndexPath;
    if (indexPath.row == [self numberOfRowsInSection:indexPath.section] - 1) {
        return [NSIndexPath indexPathForRow:0 inSection:(indexPath.section + 1)];
    } else return [NSIndexPath indexPathForRow:(indexPath.row + 1) inSection:indexPath.section];
}

- (NSIndexPath *)decrementIndexPath:(NSIndexPath *)indexPath {
    if ([indexPath compare:self.minimumIndexPath] == NSOrderedSame) return self.maximumIndexPath;
    if (indexPath.row == 0) {
        NSInteger lastRow = [self numberOfRowsInSection:(indexPath.section - 1)] - 1;
        return [NSIndexPath indexPathForRow:lastRow inSection:(indexPath.section - 1)];
    } else return [NSIndexPath indexPathForRow:(indexPath.row - 1) inSection:indexPath.section];
}

@end
