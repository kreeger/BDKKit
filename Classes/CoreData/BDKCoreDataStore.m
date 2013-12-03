#import "BDKCoreDataStore.h"

@interface BDKCoreDataStore ()

/**
 Stores a reference to the name of the Core Data Model.
 */
@property (strong, nonatomic) NSString *storeName;

/**
 The managed object model for the application.
 */
@property (nonatomic, strong) NSManagedObjectModel *mom;

/**
 The persistent store coordinator for the application.
 */
@property (nonatomic, strong) NSPersistentStoreCoordinator *psc;

/**
 Initializes and returns a version of this store object with a name that matches the Core Data model you're using.
 
 @param name The name of your Core Data managed object model.
 @return An instance of this store; you may want to keep it in your AppDelegate.
 */
- (instancetype)initWithName:(NSString *)name;

/**
 Registers this store object with the NSManagedObjectContextDidSaveNotification.
 */
- (void)setupSaveNotification;

@end

@implementation BDKCoreDataStore

@synthesize mainMOC = _mainMOC;

+ (instancetype)storeWithName:(NSString *)name {
    return [[self alloc] initWithName:name];
}

- (instancetype)initWithName:(NSString *)name {
    if (self = [super init]) {
        _storeName = name;
        [self setupSaveNotification];
    }
    
    return self;
}

- (void)setupSaveNotification {
    [[NSNotificationCenter defaultCenter] addObserverForName:NSManagedObjectContextDidSaveNotification
                                                      object:self.mainMOC
                                                       queue:nil
                                                  usingBlock:^(NSNotification *note) {
                                                      NSManagedObjectContext *moc = self.mainMOC;
                                                      if ([note object] != moc) {
                                                          [moc performBlock:^(){
                                                              NSLog(@"Merging changes from the store.");
                                                              [moc mergeChangesFromContextDidSaveNotification:note];
                                                          }];
                                                      }
                                                  }];
}

- (void)save {
    NSError *error = nil;
    NSManagedObjectContext *moc = self.mainMOC;
    if (!moc) return;
    
    if ([moc hasChanges])
        NSLog(@"Attempting to save context %p with changes.", self);

    if ([moc hasChanges] && ![moc save:&error]) {
        // Replace this implementation with code to handle the error appropriately.
        // abort() causes the application to generate a crash log and terminate. You should not use this function in
        // a shipping application, although it may be useful during development.
        NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
        abort();
    }
}

- (NSManagedObjectContext *)mainMOC {
    if (_mainMOC) return _mainMOC;
    _mainMOC = [[NSManagedObjectContext alloc] initWithConcurrencyType:NSMainQueueConcurrencyType];
    [_mainMOC setPersistentStoreCoordinator:self.psc];
    [_mainMOC setMergePolicy:NSMergeByPropertyObjectTrumpMergePolicy];
    return _mainMOC;
}

- (NSManagedObjectModel *)mom {
    if (_mom) return _mom;
    NSURL *modelURL = [[NSBundle mainBundle] URLForResource:self.storeName withExtension:@"momd"];
    _mom = [[NSManagedObjectModel alloc] initWithContentsOfURL:modelURL];
    return _mom;
}

- (NSPersistentStoreCoordinator *)psc {
    if (_psc) return _psc;
    _psc = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:self.mom];
    NSString *storeFileName = [self.storeName stringByAppendingPathExtension:@"sqlite3"];
    NSURL *storeURL = [[self applicationDocumentsDirectory] URLByAppendingPathComponent:storeFileName];
    NSError *error = nil;
    NSDictionary *options = @{NSMigratePersistentStoresAutomaticallyOption: @YES,
                              NSInferMappingModelAutomaticallyOption: @YES};
    if (![_psc addPersistentStoreWithType:NSSQLiteStoreType
                            configuration:nil
                                      URL:storeURL
                                  options:options
                                    error:&error]) {
        // Try blasting the store out, if that doesn't work, fail hard
        // TODO: may only want to do this in development
        NSError *innerError = nil;
        NSLog(@"Deleting store at URL %@.", storeURL);
        [[NSFileManager defaultManager] removeItemAtURL:storeURL error:&innerError];
        if (innerError || ![_psc addPersistentStoreWithType:NSSQLiteStoreType
                                              configuration:nil
                                                        URL:storeURL
                                                    options:options
                                                      error:&error]) {
            NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
            abort();
        }
        
    }
    return _psc;
}

#pragma mark - Application's Documents directory

- (NSURL *)applicationDocumentsDirectory {
    return [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
}

- (NSManagedObjectContext *)freshPrivateContext {
    NSManagedObjectContext *context = [[NSManagedObjectContext alloc] initWithConcurrencyType:NSPrivateQueueConcurrencyType];
    [context setPersistentStoreCoordinator:self.psc];
    // This is default on iOS, but hey
    [context setUndoManager:nil];
    return context;
}

@end