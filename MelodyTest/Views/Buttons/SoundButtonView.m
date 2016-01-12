//
//  SoundToolbarButtonView.m
//  MelodyTest
//
//  Created by Philippe Blondin on 2016-01-08.
//  Copyright © 2016 Philippe Blondin. All rights reserved.
//

#import "SoundButtonView.h"

@implementation SoundButtonView

- (void)awakeFromNib {
    [super awakeFromNib];
    
    [self setBackgroundColor:[UIColor clearColor]];

    // setup UI
    [self.buttonLabel setTextColor:[UIColor primaryBackgroundColor]];
}

@end
