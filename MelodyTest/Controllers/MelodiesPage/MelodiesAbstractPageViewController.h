//
//  MelodiesAbstractPageViewController.h
//  MelodyTest
//
//  Created by Philippe Blondin on 2016-01-12.
//  Copyright © 2016 Philippe Blondin. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Melody;
@protocol MelodiesPageControllerProtocol;

@interface MelodiesAbstractPageViewController : UIViewController

@property(nonatomic) NSUInteger pageIndex;
@property(nonatomic, strong) NSArray *melodies;
@property(nonatomic, weak) id<MelodiesPageControllerProtocol> delegate;

// Identifier
+ (NSString *)viewControllerIdentifier;

// DataSource configure
- (void)configurePageWithMelodies:(NSArray *)melodies;

@end

@protocol MelodiesPageControllerProtocol <NSObject>

@required
- (void)melodiesPageViewController:(UIViewController *)viewController didSelectMelody:(Melody *)melody;
- (void)melodiesPageViewController:(UIViewController *)viewController didUnselectMelody:(Melody *)melody;

@end
