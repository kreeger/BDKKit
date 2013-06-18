#import <Foundation/Foundation.h>

/** Helpers on just about anything.
 */
@interface NSObject (BDKKit)

/** Casts the object against `NSNull` to determine if that's what it is.
 *  @returns `YES` if the object is equal to `NSNull`, and `NO` if it is not.
 */
- (BOOL)isNull;

/** Casts the object against `NSNull` to determine if that's what it is.
 *  @returns `NO` if the object is not equal to `NSNull`, and `YES` if it is.
 */
- (BOOL)isNotNull;

@end
