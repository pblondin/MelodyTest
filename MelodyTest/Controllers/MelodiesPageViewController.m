//
//  MelodiesPageViewController.m
//  MelodyTest
//
//  Created by Philippe Blondin on 2016-01-12.
//  Copyright © 2016 Philippe Blondin. All rights reserved.
//

#import "MelodiesManager.h"
#import "MelodiesPageViewController.h"
#import "Melody.h"

// pages
#import "MelodiesBinauralBeatsPageViewController.h"
#import "MelodiesIAPPageViewController.h"
#import "MelodiesStandardPageViewController.h"

// categories
#import "UIStoryboard+Melody.h"

@interface MelodiesPageViewController () <UIPageViewControllerDataSource, UIPageViewControllerDelegate, MelodiesPageControllerProtocol>

@property(nonatomic) NSUInteger currentPageIndex;
@property(strong, nonatomic) NSArray *pageViewControllers;

@end

@implementation MelodiesPageViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    // setup
    [self setupPageViewController];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Setup

- (void)setupPageViewController {

    // setup delegate
    self.dataSource = self;
    self.delegate = self;

    [self setViewControllers:@[ [self viewControllerAtIndex:0] ] direction:UIPageViewControllerNavigationDirectionForward animated:YES completion:nil];
}

#pragma mark - <MelodiesPageControllerProtocol>

- (void)melodiesPageViewController:(MelodiesAbstractPageViewController *)viewController didSelectMelody:(Melody *)melody {
    DDLogDebug(@"Did select melody: %@ in pageVC: %i", melody.name, (int)viewController.pageIndex);
    [[MelodiesManager sharedInstance] playMelody:melody];
}

- (void)melodiesPageViewController:(MelodiesAbstractPageViewController *)viewController didUnselectMelody:(Melody *)melody {
    DDLogDebug(@"Did unselect melody: %@ in pageVC: %i", melody.name, (int)viewController.pageIndex);
    [[MelodiesManager sharedInstance] stopMelody:melody];
}

#pragma mark - <UIPageViewControllerDataSource>

- (NSArray *)pageViewControllers {
    if (!_pageViewControllers) {
        // Setup 3 statics melodies pages
        // @TODO Refactor me

        // Page 0: Standard melody page
        MelodiesAbstractPageViewController *page1 =
            [[UIStoryboard mainStoryboard] instantiateViewControllerWithIdentifier:[MelodiesStandardPageViewController viewControllerIdentifier]];
        page1.pageIndex = 0;
        page1.melodies = [[MelodiesManager sharedInstance] getMelodiesForPage:0];
        page1.delegate = self;

        // Page 1: IAP melody page
        MelodiesAbstractPageViewController *page2 =
            [[UIStoryboard mainStoryboard] instantiateViewControllerWithIdentifier:[MelodiesIAPPageViewController viewControllerIdentifier]];
        page2.pageIndex = 1;
        page2.melodies = nil; // Empty page

        // Page 2: Binaural beats page
        MelodiesAbstractPageViewController *page3 =
            [[UIStoryboard mainStoryboard] instantiateViewControllerWithIdentifier:[MelodiesBinauralBeatsPageViewController viewControllerIdentifier]];
        page3.pageIndex = 2;
        page3.melodies = nil; // Empty page

        self.pageViewControllers = @[ page1, page2, page3 ];
    }
    return _pageViewControllers;
}

- (MelodiesAbstractPageViewController *)viewControllerAtIndex:(NSUInteger)index {
    if (([self.pageViewControllers count] == 0) || (index >= [self.pageViewControllers count])) {
        return nil;
    }

    // Create a new view controller and pass suitable data.
    MelodiesAbstractPageViewController *pageContentViewController = (MelodiesAbstractPageViewController *)[self.pageViewControllers objectAtIndex:index];
    pageContentViewController.pageIndex = index;

    return pageContentViewController;
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController
      viewControllerBeforeViewController:(MelodiesAbstractPageViewController *)viewController {
    NSUInteger index = viewController.pageIndex;
    if ((index == 0) || (index == NSNotFound)) {
        return nil;
    }

    index--;

    // keep ref of index
    self.currentPageIndex = index;
    return [self viewControllerAtIndex:index];
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController
       viewControllerAfterViewController:(MelodiesAbstractPageViewController *)viewController {
    NSUInteger index = viewController.pageIndex;
    if (index == NSNotFound) {
        return nil;
    }

    index++;
    if (index == [self.pageViewControllers count]) {
        return nil;
    }

    // keep ref of index
    self.currentPageIndex = index;
    return [self viewControllerAtIndex:index];
}

#pragma mark - <UIPageViewControllerDelegate>

- (NSInteger)presentationCountForPageViewController:(UIPageViewController *)pageViewController {
    return [self.pageViewControllers count];
}

- (NSInteger)presentationIndexForPageViewController:(UIPageViewController *)pageViewController {
    return self.currentPageIndex;
}

@end
