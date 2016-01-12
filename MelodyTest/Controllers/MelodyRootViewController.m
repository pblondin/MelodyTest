//
//  ViewController.m
//  MelodyTest
//
//  Created by Philippe Blondin on 2016-01-08.
//  Copyright © 2016 Philippe Blondin. All rights reserved.
//

#import "MelodyRootViewController.h"

@interface MelodyRootViewController ()

// buttons
@property(weak, nonatomic) IBOutlet UIButton *playButton;
@property(weak, nonatomic) IBOutlet UIButton *clearButton;

@end

@implementation MelodyRootViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    // setup
    [self setupUI];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UI

- (void)setupUI {
    // bg color
    [self.view setBackgroundColor:[UIColor whiteColor]];
}

#pragma mark - IB Actions

- (IBAction)playMelodyButton:(id)sender {
    DDLogDebug(@"press play melody button");

    // toggle button
    self.playButton.selected = !self.playButton.selected;
}

- (IBAction)clearMelodyButton:(id)sender {
    DDLogDebug(@"press clear melody button");
}

@end
