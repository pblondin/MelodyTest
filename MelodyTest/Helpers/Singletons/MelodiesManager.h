//
//  MelodiesManager.h
//  MelodyTest
//
//  Created by Philippe Blondin on 2016-01-12.
//  Copyright © 2016 Philippe Blondin. All rights reserved.
//

#import <Foundation/Foundation.h>

#pragma mark Notifications center

#define MelodiesManagerDidStartPlaying @"MelodiesManagerDidStartPlaying"
#define MelodiesManagerDidStopPlaying @"MelodiesManagerDidStopPlaying"

@class Melody;

@interface MelodiesManager : NSObject

/**
 * gets singleton object.
 * @return singleton
 */
+ (MelodiesManager *)sharedInstance;

#pragma mark - Melodies methods

- (BOOL)melodiesArePlaying;
- (void)playMelody:(Melody *)melody;
- (void)stopMelody:(Melody *)melody;
- (void)playMelodies;
- (void)pauseMelodies;
- (void)clearMelodies;

#pragma mark - DataSource

@property(strong, nonatomic, readonly) NSArray *melodiesDataSource; // 2 dimensions array, holds pages of melodies

- (NSArray *)getMelodiesForPage:(NSUInteger)pageIndex;

@end
