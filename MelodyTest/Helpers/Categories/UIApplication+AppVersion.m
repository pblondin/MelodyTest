//
//  UIApplication+AppVersion.m
//
//
//  Created by Philippe Blondin on 2015-11-05.
//
//

#import "UIApplication+AppVersion.h"

@implementation UIApplication (AppVersion)

+ (NSString *)appVersion {
    return [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleShortVersionString"];
}

+ (NSString *)build {
    return [[NSBundle mainBundle] objectForInfoDictionaryKey:(NSString *)kCFBundleVersionKey];
}

+ (NSString *)versionBuild {
    NSString *version = [self appVersion];
    NSString *build = [self build];

    NSString *versionBuild = [NSString stringWithFormat:@"v%@", version];

    if (![version isEqualToString:build]) {
        versionBuild = [NSString stringWithFormat:@"%@(%@)", versionBuild, build];
    }

    return versionBuild;
}

@end