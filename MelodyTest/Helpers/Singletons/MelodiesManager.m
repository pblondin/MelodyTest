//
//  MelodiesManager.m
//  MelodyTest
//
//  Created by Philippe Blondin on 2016-01-12.
//  Copyright © 2016 Philippe Blondin. All rights reserved.
//

#import "MelodiesManager.h"
#import "Melody.h"

#import <AVFoundation/AVFoundation.h>

@interface MelodiesManager ()

@property(strong, nonatomic, readwrite) NSArray *melodiesDataSource; // 2 dimensions array, contains page of melodies
@property(strong, nonatomic) NSMutableArray *melodiesPlayer;         // Hold AVPlayer for each melodies currently playing

@end

@implementation MelodiesManager

#pragma mark - Singleton methods

+ (MelodiesManager *)sharedInstance {
    static MelodiesManager *melodiesManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
      melodiesManager = [[self alloc] init];
    });
    return melodiesManager;
}

#pragma mark - Lifecycle

- (instancetype)init {
    self = [super init];
    if (self) {
        // init datastructure
        self.melodiesPlayer = [NSMutableArray new];
        [self loadMelodies];
    }
    return self;
}

#pragma mark - Static DataSource

- (void)loadMelodies {
    NSArray *firstMelodiesPage = @[
        [[Melody alloc] initWithName:@"Ocean"],      // 2
        [[Melody alloc] initWithName:@"Flute"],      // 3
        [[Melody alloc] initWithName:@"Rain"],       // 4
        [[Melody alloc] initWithName:@"Winds"],      // 5
        [[Melody alloc] initWithName:@"Music Box"],  // 6
        [[Melody alloc] initWithName:@"Lounge"],     // 7
        [[Melody alloc] initWithName:@"Birds"],      // 8
        [[Melody alloc] initWithName:@"Piano"],      // 9
        [[Melody alloc] initWithName:@"Orchestral"], // 10
    ];

    int i = 2; // First item 2..10
    for (Melody *melody in firstMelodiesPage) {
        melody.imageFilename = [NSString stringWithFormat:@"ButtonSound%i", i];
        melody.imageSelectedFilename = [NSString stringWithFormat:@"ButtonSelSound%i", i];
        melody.soundName = [NSString stringWithFormat:@"sound%i", i];
        i++;
    }

    self.melodiesDataSource = @[ firstMelodiesPage ]; // 2 dimensions array, contains page of melodies
}

- (NSArray *)getMelodiesForPage:(NSUInteger)pageIndex {
    //@TODO add safety
    return [self.melodiesDataSource objectAtIndex:pageIndex];
}

#pragma mark - Melodies methods

- (AVAudioPlayer *)playerForMelody:(Melody *)melody {
    for (AVAudioPlayer *player in self.melodiesPlayer) {
        NSString *soundPath = [[NSBundle mainBundle] pathForResource:melody.soundName ofType:@"caf"];
        NSURL *soundURL = [NSURL fileURLWithPath:soundPath];

        // check if sound path matches
        if ([player.url isEqual:soundURL]) {
            return player;
        }
    }
    return nil;
}

- (BOOL)melodiesArePlaying {
    return [self.melodiesPlayer count];
}

- (void)playMelody:(Melody *)melody {
    NSString *soundPath = [[NSBundle mainBundle] pathForResource:melody.soundName ofType:@"caf"];
    NSURL *soundURL = [NSURL fileURLWithPath:soundPath];

    NSError *error = nil;
    AVAudioPlayer *player = [[AVAudioPlayer alloc] initWithContentsOfURL:soundURL error:&error];

    if (error) {
        DDLogError(@"%@", [error localizedDescription]);
    } else {
        // start playing on main thread
        dispatch_async(dispatch_get_main_queue(), ^{
          [player setNumberOfLoops:-1]; // Infinite
          [player play];
        });
    }

    [self.melodiesPlayer addObject:player];

    // send NSNotification that melodies start
    [[NSNotificationCenter defaultCenter] postNotificationName:MelodiesManagerDidStartPlaying object:melody];
}

- (void)stopMelody:(Melody *)melody {
    AVAudioPlayer *player = [self playerForMelody:melody];

    if (player) {
        [player stop];
        [self.melodiesPlayer removeObject:player];
    }

    if (![self melodiesArePlaying]) {
        // send NSNotification that melodies stop
        [[NSNotificationCenter defaultCenter] postNotificationName:MelodiesManagerDidStopPlaying object:melody];
    }
}

- (void)playMelodies {
    for (AVAudioPlayer *player in self.melodiesPlayer) {
        [player play];
    }
}

- (void)pauseMelodies {
    for (AVAudioPlayer *player in self.melodiesPlayer) {
        [player pause];
    }
}

- (void)clearMelodies {
    for (AVAudioPlayer *player in self.melodiesPlayer) {
        [player stop];
    }
    [self.melodiesPlayer removeAllObjects];
}

@end
