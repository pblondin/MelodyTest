//
//  MelodiesAbstractPageViewController.m
//  MelodyTest
//
//  Created by Philippe Blondin on 2016-01-12.
//  Copyright © 2016 Philippe Blondin. All rights reserved.
//

#import "MelodiesAbstractPageViewController.h"

@implementation MelodiesAbstractPageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    [self setupUI];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Setup

- (void)setupUI {
    [self.view setBackgroundColor:[UIColor clearColor]];
}

#pragma mark - Data source

- (void)configurePageWithMelodies:(NSArray *)melodies {
    return; // Abstract implementation
}

#pragma mark - <MelodiesPageProtocol>

+ (NSString *)viewControllerIdentifier {
    return NSStringFromClass([self class]);
}

@end
