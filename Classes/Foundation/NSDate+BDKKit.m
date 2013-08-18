#import "NSDate+BDKKit.h"

@implementation NSDate (BDKKit)

+ (NSDate *)dateWithYear:(NSInteger)year month:(NSInteger)month day:(NSInteger)day {
    NSDateComponents *components = [NSDateComponents new];
    components.year = year;
    components.month = month;
    components.day = day;
    return [[NSCalendar currentCalendar] dateFromComponents:components];
}

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
