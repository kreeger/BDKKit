#import "UIBarButtonItem+BDKKit.h"


@implementation UIBarButtonItem (BDKKit)

+ (instancetype)flexibleSpace {
    return [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
}

+ (instancetype)fixedSpace {
    return [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
}

@end
