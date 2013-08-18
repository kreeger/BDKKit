#import <Foundation/Foundation.h>

@interface NSArray (BDKKit)

- (void)each:(void (^)(id obj))eachBlock;
- (NSArray *)map:(id (^)(id obj))mapBlock;

@end
