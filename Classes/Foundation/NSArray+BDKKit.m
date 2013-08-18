#import "NSArray+BDKKit.h"

@implementation NSArray (BDKKit)

- (void)each:(void (^)(id obj))eachBlock {
    [self enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        eachBlock(obj);
    }];
}
- (NSArray *)map:(id (^)(id obj))mapBlock {
    NSMutableArray *objs = [NSMutableArray arrayWithCapacity:[self count]];
    [self each:^(id obj) {
        [objs addObject:mapBlock(obj)];
    }];
    return [objs copy];
}

@end
