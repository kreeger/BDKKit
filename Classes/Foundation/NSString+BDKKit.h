#import <Foundation/Foundation.h>

/** These are handy wrappers around various messages that interact with strings.
 */
@interface NSString (BDKKit)

/** Checks for nil, NSNull, or blank.
 *  @returns `YES` if string is falsy.
 */
- (BOOL)isEmptyOrNull;

/** Shorthand for NSURL's `URLWithString:`.
 *  @returns a URL with self.
 */
- (NSURL *)urlValue;

/** URL-encodes a string.
 *  @returns a URL-encoded version of self.
 */
- (NSString *)stringByUrlEncoding;

/** URL-decodes a string.
 *  @returns a URL-decoded version of self.
 */
- (NSString *)stringByUrlDecoding;

/** Returns a string modified by capitalizing the first letter.
 *  @returns A new string with a capitalized first letter.
 */
- (NSString *)stringByCapitalizingFirstLetter;

@end
