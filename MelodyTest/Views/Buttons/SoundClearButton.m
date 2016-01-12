//
//  SoundClearButton.m
//  MelodyTest
//
//  Created by Philippe Blondin on 2016-01-08.
//  Copyright © 2016 Philippe Blondin. All rights reserved.
//

#import "SoundClearButton.h"

@implementation SoundClearButton

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

@end
