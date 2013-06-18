#import "NSString+BDKKit.h"
#import "NSObject+BDKKit.h"

@implementation NSString (BDKKit)

- (BOOL)isEmptyOrNull {
    return self == nil || [self isNull] || [self isEqual:@""];
}

- (NSURL *)urlValue {
    return [NSURL URLWithString:self];
}

- (NSString *)stringByUrlEncoding {
    return (NSString *)CFBridgingRelease(CFURLCreateStringByAddingPercentEscapes(NULL, (CFStringRef)self, NULL, (CFStringRef)@"!*'();:@&amp;=+$,/?%#[]", kCFStringEncodingUTF8));
}

- (NSString *)stringByUrlDecoding {
    NSString *result = [self stringByReplacingOccurrencesOfString:@"+" withString:@" "];
    return [result stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
}

- (NSString *)stringByCapitalizingFirstLetter {
    return [self stringByReplacingCharactersInRange:NSMakeRange(0,1)
                                         withString:[[self substringToIndex:1] uppercaseString]];
}

@end
