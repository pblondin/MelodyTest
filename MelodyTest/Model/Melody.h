//
//  Melody.h
//  MelodyTest
//
//  Created by Philippe Blondin on 2016-01-12.
//  Copyright © 2016 Philippe Blondin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Melody : NSObject

@property(nonatomic, strong) NSString *name;
@property(nonatomic, strong) NSString *imageFilename;
@property(nonatomic, strong) NSString *imageSelectedFilename;
@property(nonatomic, strong) NSString *soundName;

#pragma mark - Lifecycle

- (instancetype)initWithName:(NSString *)name;

- (instancetype)initWithName:(NSString *)name
               imageFilename:(NSString *)imgFilname
       imageSelectedFilename:(NSString *)imgSelFilename
                   soundName:(NSString *)soundName;

@end
