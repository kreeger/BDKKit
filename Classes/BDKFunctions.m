#import "BDKFunctions.h"

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

#pragma mark - Math

double DEG_TO_RAD(double degrees) { return degrees * M_PI / 180.0; }
double RAD_TO_DEG(double radians) { return radians * 180.0 / M_PI; }

#pragma mark - Strings

BOOL IS_EMPTY_STRING(NSString *str) { return !str || ![str isKindOfClass:NSString.class] || [str length] == 0; }
BOOL IS_POPULATED_STRING(NSString *str) { return str && [str isKindOfClass:NSString.class] && [str length] > 0; }

#pragma mark - Colors

float RGB256_TO_COL(NSInteger rgb) { return rgb / 255.0f; }
NSInteger COL_TO_RGB256(float col) { return (NSInteger)(col * 255.0); }

RGBA RGBfromHSV(HSV value) {
    double      hh, p, q, t, ff;
    long        i;
    RGBA        out;
    out.a       = 1;

    if (value.s <= 0.0) // < is bogus, just shuts up warnings
    {
        if (isnan(value.h)) // value.h == NAN
        {
            out.r = value.v;
            out.g = value.v;
            out.b = value.v;
            return out;
        }

        // error - should never happen
        out.r = 0.0;
        out.g = 0.0;
        out.b = 0.0;
        return out;
    }

    hh = value.h;
    if(hh >= 360.0) hh = 0.0;
    hh /= 60.0;
    i = (long)hh;
    ff = hh - i;
    p = value.v * (1.0 - value.s);
    q = value.v * (1.0 - (value.s * ff));
    t = value.v * (1.0 - (value.s * (1.0 - ff)));

    switch(i)
    {
        case 0:
            out.r = value.v;
            out.g = t;
            out.b = p;
            break;
        case 1:
            out.r = q;
            out.g = value.v;
            out.b = p;
            break;
        case 2:
            out.r = p;
            out.g = value.v;
            out.b = t;
            break;

        case 3:
            out.r = p;
            out.g = q;
            out.b = value.v;
            break;
        case 4:
            out.r = t;
            out.g = p;
            out.b = value.v;
            break;
        case 5:
        default:
            out.r = value.v;
            out.g = p;
            out.b = q;
            break;
    }

    return out;
}

UIImage *TintImageWithTintColor(UIImage *image, UIColor *tintColor) {
    // Huge props to http://stackoverflow.com/questions/3514066/how-to-tint-a-transparent-png-image-in-iphone

    UIGraphicsBeginImageContext(image.size);
    CGContextRef context = UIGraphicsGetCurrentContext();

    CGContextTranslateCTM(context, 0, image.size.height);
    CGContextScaleCTM(context, 1.0, -1.0);

    CGRect rect = (CGRect){ CGPointZero, image.size };

    // image drawing code
    // draw black background to preserve color of transparent pixels
    CGContextSetBlendMode(context, kCGBlendModeNormal);
    [[UIColor blackColor] setFill];
    CGContextFillRect(context, rect);

    // draw original image
    CGContextSetBlendMode(context, kCGBlendModeNormal);
    CGContextDrawImage(context, rect, image.CGImage);

    // tint image (loosing alpha) - the luminosity of the original image is preserved
    CGContextSetBlendMode(context, kCGBlendModeColor);
    [tintColor setFill];
    CGContextFillRect(context, rect);

    // mask by alpha values of original image
    CGContextSetBlendMode(context, kCGBlendModeDestinationIn);
    CGContextDrawImage(context, rect, image.CGImage);

    UIImage *coloredImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();

    return coloredImage;
}
