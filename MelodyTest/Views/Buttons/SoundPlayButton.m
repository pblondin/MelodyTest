//
//  SoundToolbarButton.m
//  MelodyTest
//
//  Created by Philippe Blondin on 2016-01-08.
//  Copyright © 2016 Philippe Blondin. All rights reserved.
//

#import "SoundPlayButton.h"

@implementation SoundPlayButton

#pragma mark - Class methods

+ (UINib *)nib {
    return [UINib nibWithNibName:NSStringFromClass([self class]) bundle:[NSBundle bundleForClass:[self class]]];
}

#pragma mark - Init

- (void)awakeFromNib {

    [super awakeFromNib];
    // Add custom view
    self.customView = [[[[self class] nib] instantiateWithOwner:self options:nil] firstObject];
    [self.customView setUserInteractionEnabled:NO];

    self.clipsToBounds = YES;
    self.backgroundColor = [UIColor clearColor];

    self.titleLabel.text = nil;

    [self addSubview:self.customView];
}

- (void)setSelected:(BOOL)selected {
    [super setSelected:selected];

    // Toggle Play/Pause button UI
    if (self.selected) {
        [self.customView.buttonImageVIew setImage:[UIImage imageNamed:@"Btn_Pause"]];
        [self.customView.buttonLabel setText:@"Pause"];
    } else {
        [self.customView.buttonImageVIew setImage:[UIImage imageNamed:@"Btn_Play"]];
        [self.customView.buttonLabel setText:@"Play"];
    }
}

#pragma mark - Accessor

- (void)setPlayButtonState:(SoundPlayButtonState)playButtonState {
    if (playButtonState == SoundPlayButtonStatePlay) {
        self.selected = NO;
    } else {
        self.selected = YES;
    }
}

- (SoundPlayButtonState)playButtonState {
    return !self.selected; // Unselected == Play, Otherwise Pause
}

@end
