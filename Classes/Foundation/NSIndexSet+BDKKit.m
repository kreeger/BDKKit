#import "NSIndexSet+BDKKit.h"

@implementation NSIndexSet (BDKKit)

- (NSInteger)indexAtIndex:(NSInteger)index {
    if (index >= [self count]) return NSNotFound;
    NSUInteger theIndex = [self firstIndex];
    for (NSUInteger i = 0; i < index; i++) theIndex = [self indexGreaterThanIndex:theIndex];
    return theIndex;
}

- (NSInteger)indexOfIndex:(NSInteger)index {
    __block NSInteger counter = -1;
    NSInteger foundIndex = [self indexPassingTest:^BOOL(NSUInteger idx, BOOL *stop) {
        counter++;
        return idx == index;
    }];

    return foundIndex ? counter : NSNotFound;
}

@end