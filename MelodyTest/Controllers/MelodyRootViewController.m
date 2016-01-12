//
//  ViewController.m
//  MelodyTest
//
//  Created by Philippe Blondin on 2016-01-08.
//  Copyright © 2016 Philippe Blondin. All rights reserved.
//

#import "MelodiesManager.h"
#import "MelodyRootViewController.h"
#import "SoundPlayButton.h"

@interface MelodyRootViewController ()

// images
@property(weak, nonatomic) IBOutlet UIImageView *bgImage;

// buttons
@property(weak, nonatomic) IBOutlet SoundPlayButton *playButton;
@property(weak, nonatomic) IBOutlet UIButton *clearButton;

@end

@interface MelodyRootViewController ()
@end

@implementation MelodyRootViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    // setup
    [self registerNotifications];
    [self setupUI];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc {
    [self unregisterNotifications];
}

#pragma mark - Observers

- (void)registerNotifications {
    NSNotificationCenter *center = [NSNotificationCenter defaultCenter];
    @weakify(self);
    [center addObserverForName:MelodiesManagerDidStartPlaying
                        object:nil
                         queue:[NSOperationQueue mainQueue]
                    usingBlock:^(NSNotification *_Nonnull note) {
                      @strongify(self);
                      // we make sure to update Play button
                      [self.playButton setPlayButtonState:SoundPlayButtonStatePause];
                    }];

    [center addObserverForName:MelodiesManagerDidStopPlaying
                        object:nil
                         queue:[NSOperationQueue mainQueue]
                    usingBlock:^(NSNotification *_Nonnull note) {
                      @strongify(self);
                      // we make sure to update Play button
                      [self.playButton setPlayButtonState:SoundPlayButtonStatePlay];
                    }];
}

- (void)unregisterNotifications {
    NSNotificationCenter *center = [NSNotificationCenter defaultCenter];
    [center removeObserver:self name:MelodiesManagerDidStartPlaying object:nil];
    [center removeObserver:self name:MelodiesManagerDidStopPlaying object:nil];
    [center removeObserver:self];
}

#pragma mark - Setup

- (void)setupUI {
    // bg color
    [self.view setBackgroundColor:[UIColor whiteColor]];
}

#pragma mark - IB Actions

- (IBAction)playMelodyButton:(id)sender {
    DDLogDebug(@"press play/pause melody button");

    // toogle play/pause
    self.playButton.selected = !self.playButton.selected;

    // toggle button
    if (self.playButton.playButtonState == SoundPlayButtonStatePlay) {
        [[MelodiesManager sharedInstance] playMelodies];
    } else {
        [[MelodiesManager sharedInstance] pauseMelodies];
    }
}

- (IBAction)clearMelodyButton:(id)sender {
    DDLogDebug(@"press clear melody button");
    [[MelodiesManager sharedInstance] clearMelodies];
}

@end
