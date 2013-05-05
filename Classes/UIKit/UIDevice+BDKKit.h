#import <UIKit/UIKit.h>

@interface UIDevice (BDKKit)

- (BOOL)isRetina;
- (BOOL)is4Inch;
- (BOOL)isPhone;
- (BOOL)isPad;
- (BOOL)isOffline;
- (BOOL)isOld;
- (NSString *)platform;
- (NSString *)platformString;

@end
