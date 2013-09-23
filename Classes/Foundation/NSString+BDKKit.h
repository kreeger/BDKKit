#import <Foundation/Foundation.h>

/** These are handy wrappers around various messages that interact with strings.
 */
@interface NSString (BDKKit)

/** Checks for nil, NSNull, or blank.
 *  @return `YES` if string is falsy.
 */
- (BOOL)isEmptyOrNull;

/** Shorthand for NSURL's `URLWithString:`.
 *  @return a URL with self.
 */
- (NSURL *)urlValue;

/** URL-encodes a string.
 *  @return a URL-encoded version of self.
 */
- (NSString *)stringByUrlEncoding;

/** URL-decodes a string.
 *  @return a URL-decoded version of self.
 */
- (NSString *)stringByUrlDecoding;

/** Returns a string modified by capitalizing the first letter.
 *  @return A new string with a capitalized first letter.
 */
- (NSString *)stringByCapitalizingFirstLetter;

@end
