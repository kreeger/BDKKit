#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

/**
 Handles all Core Data management.
 */
@interface BDKCoreDataStore : NSObject

/**
 The managed object context for the application.
 */
@property (nonatomic, strong, readonly) NSManagedObjectContext *mainMOC;

/**
 Initializes and returns a version of this store object with a name that matches the Core Data model you're using.
 
 @param name The name of your Core Data managed object model.
 @return An instance of this store; you may want to keep it in your AppDelegate.
 */
+ (instancetype)storeWithName:(NSString *)name;

/**
 Saves the managed object context.
 */
- (void)save;

/**
 Generates and returns a fresh private queue managed object context.
 
 @return A private NSManagedObjectContext.
 */
- (NSManagedObjectContext *)freshPrivateContext;

/**
 Returns the URL to the application's Documents directory.
 
 @return A URL to the app's Documents directory.
 */
- (NSURL *)applicationDocumentsDirectory;

@end