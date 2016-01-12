//
//  Melody.m
//  MelodyTest
//
//  Created by Philippe Blondin on 2016-01-12.
//  Copyright © 2016 Philippe Blondin. All rights reserved.
//

#import "Melody.h"

@implementation Melody

#pragma mark - Lifecyclec

- (instancetype)initWithName:(NSString *)name {
    self = [super init];
    if (self) {
        self.name = name;
    }
    return self;
}

- (instancetype)initWithName:(NSString *)name
               imageFilename:(NSString *)imgFilname
       imageSelectedFilename:(NSString *)imgSelFilename
                   soundName:(NSString *)soundName {
    self = [super init];
    if (self) {
        self.name = name;
        self.imageFilename = imgFilname;
        self.imageSelectedFilename = imgSelFilename;
        self.soundName = soundName;
    }
    return self;
}

@end
