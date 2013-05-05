#import <Foundation/Foundation.h>

@interface NSDate (BDKKit)

+ (NSDate *)dateFromString:(NSString *)dateString;
- (NSString *)stringFromFormatString:(NSString *)formatString;

@end
