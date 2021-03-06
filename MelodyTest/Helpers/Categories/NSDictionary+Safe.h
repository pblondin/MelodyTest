//
//  NSDictionary+Safe.h
//  MelodyTest
//
//  Created by Philippe Blondin on 2015-10-02.
//  Copyright © 2016 Philippe Blondin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDictionary (Safe)

- (id)safeObjectForKey:(id)key;
- (NSString *)safeStringForKey:(id)key;
- (BOOL)safeBoolForKey:(id)key;
- (BOOL)isObjectNull:(id)key;

@end
