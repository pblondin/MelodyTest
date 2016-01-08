//
//  UIColor+E180ThemeColor.m
//  MelodyTest
//
//  Created by Philippe Blondin on 2014-11-27.
//  Copyright (c) 2016 Philippe Blondin. All rights reserved.
//

#import "UIColor+MelodyThemeColor.h"

@implementation UIColor (MelodyThemeColor)

#pragma mark - Black

// Primary color
+ (UIColor *)primaryColor {
    return [UIColor colorFromHexString:@"#E84667"];
}
+ (UIColor *)secondaryColor {
    return [UIColor colorFromHexString:@"#00897B"];
}
+ (UIColor *)secondaryHueColor {
    return [UIColor colorFromHexString:@"#0D6F65"];
}

#pragma mark - Main

// Background color
+ (UIColor *)primaryBackgroundColor {
    return [UIColor colorFromHexString:@"#3B8176"];
}

// Button color
+ (UIColor *)mainButtonColor {
    return [UIColor colorFromHexString:@"#98BA6E"];
}
+ (UIColor *)barButtonColor {
    return [UIColor colorFromHexString:@"#FFF8AE"];
}
+ (UIColor *)greenButtonColor {
    return [UIColor colorFromHexString:@"#97BA6A"];
}
+ (UIColor *)redButtonColor {
    return [UIColor colorFromHexString:@"#BE2332"];
}
+ (UIColor *)yellowButtonColor {
    return [UIColor colorFromHexString:@"#D6B718"];
}

#pragma mark - Utilities

// Assumes input like "#00FF00" (#RRGGBB).
// http://stackoverflow.com/questions/1560081/how-can-i-create-a-uicolor-from-a-hex-string
+ (UIColor *)colorFromHexString:(NSString *)hexString {
    unsigned rgbValue = 0;
    NSScanner *scanner = [NSScanner scannerWithString:hexString];
    [scanner setScanLocation:1]; // bypass '#' character
    [scanner scanHexInt:&rgbValue];
    return [UIColor colorWithRed:((rgbValue & 0xFF0000) >> 16) / 255.0 green:((rgbValue & 0xFF00) >> 8) / 255.0 blue:(rgbValue & 0xFF) / 255.0 alpha:1.0];
}

@end
