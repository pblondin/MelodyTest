//
//  UIApplication+AppVersion.h
//  
//
//  Created by Philippe Blondin on 2015-11-05.
//
//

#import <UIKit/UIKit.h>

@interface UIApplication (AppVersion)

+ (NSString *)appVersion;
+ (NSString *)build;
+ (NSString *)versionBuild;

@end
