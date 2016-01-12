//
//  MelodyView.h
//  MelodyTest
//
//  Created by Philippe Blondin on 2016-01-12.
//  Copyright © 2016 Philippe Blondin. All rights reserved.
//

#import "AbstractView.h"

@class Melody;
@protocol MelodyViewDelegate;

@interface MelodyView : AbstractView

@property(weak, nonatomic) IBOutlet UIImageView *melodyImageView;
@property(weak, nonatomic) IBOutlet UILabel *melodyLabel;
@property(weak, nonatomic) IBOutlet UIButton *melodyButton;

@property(weak, nonatomic) id<MelodyViewDelegate> delegate;

#pragma mark - Public

- (BOOL)isMelodyViewSelected;
- (void)configureMelodyViewWithMelody:(Melody *)melody;

@end

@protocol MelodyViewDelegate <NSObject>

- (void)melodyView:(MelodyView *)view didPressMelodyButton:(id)sender;

@end