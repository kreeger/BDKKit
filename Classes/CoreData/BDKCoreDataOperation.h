#import <Foundation/Foundation.h>

@class BDKCoreDataStore;

/**
 Designed to work with BDKKitCoreDataStore, this easy-to-use operation fires off a background process for context saving
 (and does so with a fresh context).
 */
@interface BDKCoreDataOperation : NSOperation

/**
 Stores the block to execute in the background.
 */
@property (nonatomic, copy) void (^backgroundOperation)(NSManagedObjectContext *innerContext);

/**
 Stores a block to be executed when complete; will be passed an error, if one occurred during a Core Data save.
 Otherwise, success will be YES.
 */
@property (nonatomic, copy) void (^completion)(BOOL success, NSError *error);

/**
 The instance of BDKCoreDataStore that this operation is using.
 */
@property (readonly) BDKCoreDataStore *coreDataStore;

/**
 Returns a Boolean value indicating whether the operation is currently executing.
 */
@property (nonatomic) BOOL isExecuting;

/**
 Returns a Boolean value indicating whether the operation is done executing.
 */
@property (nonatomic) BOOL isFinished;

/**
 Creates an instance of this operation with an operation block (which is passed a fresh context), and immediately
 inserts it into a queue.
 
 @param coreDataStore The instance of a BDKCoreDataStore to work with.
 @param backgroundOperation The block in which to execute background code.
 @param completion A block to be called upon completion; will be passed an error, if one occurrend.
 @param failure A block to be called upon failure.
 */
+ (void)performInBackgroundWithCoreDataStore:(BDKCoreDataStore *)coreDataStore
                         backgroundOperation:(void (^)(NSManagedObjectContext *innerContext))backgroundOperation
                                  completion:(void (^)(BOOL success, NSError *error))completion;

/**
 Creates an instance of this operation with an operation block (which is passed a fresh context).
 
 @param coreDataStore The instance of a BDKCoreDataStore to work with.
 @param backgroundOperation The block in which to execute background code.
 @param completion A block to be called upon completion; will be passed an error, if one occurrend.
 @return An instance of this operation.
 */
- (instancetype)initWithCoreDataStore:(BDKCoreDataStore *)coreDataStore
                  backgroundOperation:(void (^)(NSManagedObjectContext *innerContext))backgroundOperation
                           completion:(void (^)(BOOL success, NSError *error))completion;

@end
