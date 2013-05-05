#import "NSDate+BDKKit.h"

@implementation NSDate (BDKKit)

+ (NSDate *)dateFromString:(NSString *)dateString {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.dateFormat = @"YYYY-mm-dd";
    return [dateFormatter dateFromString:dateString];
}

- (NSString *)stringFromFormatString:(NSString *)formatString {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.dateFormat = formatString;
    return [dateFormatter stringFromDate:self];
}

@end
