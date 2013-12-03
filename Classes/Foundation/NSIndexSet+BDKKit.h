#import <Foundation/Foundation.h>

@interface NSIndexSet (BDKKit)

/**
 Retrieves the index at a given position in the set. Not the greatest in terms of speed, probably.
 
 @param index The index at which to retrieve an index from the set.
 @return An index at a given, uh, index.
 */
- (NSInteger)indexAtIndex:(NSInteger)index;

/**
 Returns the index at which a given index resides.
 
 @param index The index to find in the set.
 @return The index at which the given resides in the index set.
 */
- (NSInteger)indexOfIndex:(NSInteger)index;

@end