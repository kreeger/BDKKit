#import <Foundation/Foundation.h>

@interface NSDate (BDKKit)

+ (NSDate *)dateWithYear:(NSInteger)year month:(NSInteger)month day:(NSInteger)day;
+ (NSDate *)dateFromString:(NSString *)dateString;
- (NSString *)stringFromFormatString:(NSString *)formatString;

@end
