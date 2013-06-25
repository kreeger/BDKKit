#import "UIGestureRecognizer+BDKKit.h"
#import <objc/runtime.h>

static const void *ActionBlockKey = &ActionBlockKey;

@implementation UIGestureRecognizer (BDKKit)

@dynamic actionBlock;

- (void)setActionBlock:(void (^)(UIGestureRecognizer *sender))actionBlock {
    objc_setAssociatedObject(self, ActionBlockKey, actionBlock, OBJC_ASSOCIATION_COPY_NONATOMIC);
    [self addTarget:self action:@selector(callStoredBlockForSender:)];
}

- (void (^)(UIGestureRecognizer *))actionBlock {
    return objc_getAssociatedObject(self, ActionBlockKey);
}

- (void)callStoredBlockForSender:(UIGestureRecognizer *)sender {
    self.actionBlock(sender);
}

@end