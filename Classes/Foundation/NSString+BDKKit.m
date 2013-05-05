#import "NSString+BDKKit.h"

@implementation NSString (BDKKit)

- (BOOL)isEmptyOrNull {
    return self == nil || [(NSNull *)self isEqual:[NSNull null]] || [self isEqual:@""];
}

- (NSURL *)urlValue {
    return [NSURL URLWithString:self];
}

- (NSString *)stringByUrlEncoding {
    return (NSString *)CFBridgingRelease(CFURLCreateStringByAddingPercentEscapes(NULL, (CFStringRef)self, NULL, (CFStringRef)@"!*'();:@&amp;=+$,/?%#[]", kCFStringEncodingUTF8));
}

- (NSString *)stringByCapitalizingFirstLetter {
    return [self stringByReplacingCharactersInRange:NSMakeRange(0,1)
                                         withString:[[self substringToIndex:1] uppercaseString]];
}

@end
