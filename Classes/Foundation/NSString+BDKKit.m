#import "NSString+BDKKit.h"

@implementation NSString (BDKKit)

- (NSString *)stringByCapitalizingFirstLetter {
    return [self stringByReplacingCharactersInRange:NSMakeRange(0,1)
                                         withString:[[self substringToIndex:1] uppercaseString]];
}

@end
