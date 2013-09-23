#import "BDKCoreDataOperation.h"

#import "BDKCoreDataStore.h"

@implementation BDKCoreDataOperation

@synthesize coreDataStore = _coreDataStore;

+ (void)performInBackgroundWithCoreDataStore:(BDKCoreDataStore *)coreDataStore
                         backgroundOperation:(void (^)(NSManagedObjectContext *))backgroundOperation
                                  completion:(void (^)(BOOL, NSError *))completion {
    BDKCoreDataOperation *op = [[self alloc] initWithCoreDataStore:coreDataStore
                                                 backgroundOperation:backgroundOperation
                                                          completion:completion];
    [[NSOperationQueue new] addOperation:op];
}

- (instancetype)initWithCoreDataStore:(BDKCoreDataStore *)coreDataStore
                  backgroundOperation:(void (^)(NSManagedObjectContext *))backgroundOperation
                           completion:(void (^)(BOOL, NSError *))completion {
    if (self = [super init]) {
        _coreDataStore = coreDataStore;
        _backgroundOperation = backgroundOperation;
        _completion = completion;
    }
    return self;
}

- (BOOL)isConcurrent {
    return NO;
}

- (void)start {
    self.isExecuting = YES;
    self.isFinished = NO;
    
    NSManagedObjectContext *innerContext = [_coreDataStore freshPrivateContext];
    self.backgroundOperation(innerContext);
    NSError *error = nil;
    NSLog(@"Saving private context %p %@ changes.", innerContext, [innerContext hasChanges] ? @"with" : @"without any");
    [innerContext save:&error];
    
    self.isExecuting = NO;
    self.isFinished = YES;
    
    if (self.completion) {
        self.completion(!!error, error);
    }
}

@end
