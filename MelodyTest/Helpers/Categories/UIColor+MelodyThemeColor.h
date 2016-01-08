//
//  UIColor+E180ThemeColor.h
//  MelodyTest
//
//  Created by Philippe Blondin on 2014-11-27.
//  Copyright (c) 2016 Philippe Blondin. All rights reserved.
//

#import <UIKit/UIKit.h>

#define RGB(r, g, b) [UIColor colorWithRed:r / 255.0f green:g / 255.0f blue:b / 255.0f alpha:1.0f]
#define GreyColor RGB(148, 144, 141)
#define GreenColor RGB(158, 198, 107)

@interface UIColor (MelodyThemeColor)

// Primary color
+ (UIColor *)primaryColor;
+ (UIColor *)secondaryColor;

// Background color
+ (UIColor *)primaryBackgroundColor;

// Button color
+ (UIColor *)mainButtonColor;
+ (UIColor *)barButtonColor;
+ (UIColor *)greenButtonColor;
+ (UIColor *)redButtonColor;
+ (UIColor *)yellowButtonColor;

@end
