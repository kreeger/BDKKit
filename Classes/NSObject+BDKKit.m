#import "NSObject+BDKKit.h"

@implementation NSObject (BDKKit)

- (BOOL)isNull {
    return [(NSNull *)self isEqual:[NSNull null]];
}

- (BOOL)isNotNull {
    return ![self isNull];
}

@end
