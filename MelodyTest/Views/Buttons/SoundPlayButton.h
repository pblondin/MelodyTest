//
//  SoundToolbarButton.h
//  MelodyTest
//
//  Created by Philippe Blondin on 2016-01-08.
//  Copyright © 2016 Philippe Blondin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SoundButtonView.h"

typedef enum : NSUInteger {
    SoundPlayButtonStatePlay,
    SoundPlayButtonStatePause,
} SoundPlayButtonState;

@interface SoundPlayButton : UIButton

@property(nonatomic, readonly) SoundPlayButtonState playButtonState;
@property(strong, nonatomic) SoundButtonView *customView;

@end
