//
//  MelodiesStandardPageViewController.m
//  MelodyTest
//
//  Created by Philippe Blondin on 2016-01-12.
//  Copyright © 2016 Philippe Blondin. All rights reserved.
//

#import "MelodiesManager.h"
#import "MelodiesStandardPageViewController.h"
#import "Melody.h"
#import "MelodyView.h"

@interface MelodiesStandardPageViewController () <MelodyViewDelegate>

@property(strong, nonatomic) IBOutletCollection(UIView) NSArray *melodiesCollectionView;

@end

@implementation MelodiesStandardPageViewController

@synthesize pageIndex;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    // setup UI
    [self setupMelodiesUI];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Setup

//@TODO Refactor me
- (void)setupMelodiesUI {
    int i = 0;
    for (Melody *melody in self.melodies) {
        UIView *container = [self.melodiesCollectionView objectAtIndex:i];
        [container setBackgroundColor:[UIColor clearColor]];

        MelodyView *melodyView = [[[MelodyView nib] instantiateWithOwner:self options:nil] firstObject];
        [melodyView configureMelodyViewWithMelody:melody];

        // setup delegate
        melodyView.delegate = self;

        [container addSubview:melodyView];
        i++;
    }
}

#pragma mark - <MelodiesPageProtocol>

+ (NSString *)viewControllerIdentifier {
    return @"STANDARD_PAGE_VC";
}

#pragma mark <MelodyViewDelegate>

- (NSInteger)indexForMelodyView:(MelodyView *)aMelodyView {
    int i = 0;
    for (UIView *melodyViewContainer in self.melodiesCollectionView) {
        if (aMelodyView == [[melodyViewContainer subviews] firstObject]) {
            return i;
        }
        i++;
    }
    return NSNotFound;
}

- (void)melodyView:(MelodyView *)view didPressMelodyButton:(id)sender {
    NSInteger melodyIndex = [self indexForMelodyView:view];
    if (melodyIndex != NSNotFound) {
        Melody *melody = [self.melodies objectAtIndex:melodyIndex];

        if ([view isMelodyViewSelected]) {
            if (self.delegate != nil && [self.delegate respondsToSelector:@selector(melodiesPageViewController:didSelectMelody:)]) {
                [self.delegate melodiesPageViewController:self didSelectMelody:melody];
            }
        } else {
            if (self.delegate != nil && [self.delegate respondsToSelector:@selector(melodiesPageViewController:didUnselectMelody:)]) {
                [self.delegate melodiesPageViewController:self didUnselectMelody:melody];
            }
        }
    }
}

@end
