#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

/* Some of these are pulled from ZaBlanc's InnerBand framework. https://github.com/ZaBlanc/InnerBand */

#define SuppressPerformSelectorLeakWarning(Stuff) \
do { \
_Pragma("clang diagnostic push") \
_Pragma("clang diagnostic ignored \"-Warc-performSelector-leaks\"") \
Stuff; \
_Pragma("clang diagnostic pop") \
} while (0)

// MATH

double DEG_TO_RAD(double degrees);
double RAD_TO_DEG(double radians);

// STRINGS

BOOL IS_EMPTY_STRING(NSString *str);
BOOL IS_POPULATED_STRING(NSString *str);

// COLORS

float RGB256_TO_COL(NSInteger rgb);
NSInteger COL_TO_RGB256(float col);

typedef struct
{
    double r;       // percent [0 - 1]
    double g;       // percent [0 - 1]
    double b;       // percent [0 - 1]
    double a;       // percent [0 - 1]
} RGBA;

typedef struct
{
    double h;       // angle in degrees [0 - 360]
    double s;       // percent [0 - 1]
    double v;       // percent [0 - 1]
} HSV;

RGBA RGBfromHSV(HSV value);

UIImage *TintImageWithTintColor(UIImage *image, UIColor *tintColor);