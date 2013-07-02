#import <Foundation/Foundation.h>

@interface NSIndexSet (BDKKit)

/** Retrieves the index at a given position in the set. Not the greatest in terms of speed, probably.
 *  @param index The index at which to retrieve an index from the set.
 *  @returns An index at a given, uh, index.
 */
- (NSInteger)indexAtIndex:(NSInteger)index;

@end