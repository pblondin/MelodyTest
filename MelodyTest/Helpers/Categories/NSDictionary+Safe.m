//
//  NSDictionary+Safe.m
//  MelodyTest
//
//  Created by Philippe Blondin on 2015-10-02.
//  Copyright © 2016 Philippe Blondin. All rights reserved.
//

#import "NSDictionary+Safe.h"

@implementation NSDictionary (Safe)

- (id)safeObjectForKey:(id)key {
    NSObject *object = self[key];
    if (!object || object == [NSNull null]) {
        return nil;
    }
    return object;
}

- (NSString *)safeStringForKey:(id)key {
    id object = self[key];
    if ([object isKindOfClass:[NSString class]]) {
        return object;
    } else if ([object isKindOfClass:[NSNumber class]]) {
        return [NSString stringWithFormat:@"%d", [object intValue]];
    } else if ([object isKindOfClass:[NSNull class]]) {
        return @"";
    }
    return @"";
}

- (BOOL)safeBoolForKey:(id)key {
    id object = self[key];
    if ([object isKindOfClass:[NSNumber class]]) {
        return [object boolValue];
    }
    return nil;
}

// Check if an object is null
- (BOOL)isObjectNull:(id)key {
    NSObject *object = self[key];
    return (object == (id)[NSNull null] || object == nil);
}

@end
