#import "UIControl+BDKKit.h"

#import <objc/runtime.h>

@interface BDKControlHandler : NSObject

@property (copy, nonatomic) void (^valueChangedBlock)(UIControl *sender);

- (void)fireValueChangedBlock:(UIControl *)sender;

@end

@implementation BDKControlHandler

- (void)fireValueChangedBlock:(UIControl *)sender {
    if (self.valueChangedBlock) self.valueChangedBlock(sender);
}

@end

static const char BDKValueChangedHandlerKey;

@implementation UIControl (BDKKit)

- (void)fireBlockOnValueChange:(void(^)(UIControl *sender))valueChangedBlock {
    BDKControlHandler *handler = [BDKControlHandler new];
    handler.valueChangedBlock = valueChangedBlock;
    [self addTarget:handler action:@selector(fireValueChangedBlock:) forControlEvents:UIControlEventValueChanged];
    objc_setAssociatedObject(self, &BDKValueChangedHandlerKey, handler, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

@end