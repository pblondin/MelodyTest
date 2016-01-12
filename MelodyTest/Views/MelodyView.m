//
//  MelodyView.m
//  MelodyTest
//
//  Created by Philippe Blondin on 2016-01-12.
//  Copyright © 2016 Philippe Blondin. All rights reserved.
//

#import "Melody.h"
#import "MelodyView.h"

#import <pop/POP.h>

@implementation MelodyView

#pragma mark - View lifecycle

- (void)awakeFromNib {
    [super awakeFromNib];

    // we change the anchor point to create a swing effect
    // anchor on the center left
    CGPoint center = self.layer.position;
    [self.layer setAnchorPoint:CGPointMake(0.5, 0)];
    [self.layer setPosition:CGPointMake(center.x, center.y - self.layer.bounds.size.height * 0.5)];

    // setup
    [self setupUI];
}

#pragma mark - UI

- (void)setupUI {
    self.backgroundColor = [UIColor clearColor];
}

#pragma mark - Accessor

- (BOOL)isMelodyViewSelected {
    return self.melodyImageView.highlighted;
}

#pragma mark - Animation

- (void)startMelodyViewAnimation {
    POPBasicAnimation *swingAnimation = [POPBasicAnimation animationWithPropertyNamed:kPOPLayerRotation];
    swingAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    swingAnimation.duration = 1.5;
    swingAnimation.fromValue = @(M_PI * -0.08);
    swingAnimation.toValue = @(M_PI * 0.08);
    swingAnimation.repeatForever = YES;
    swingAnimation.autoreverses = YES;
    [self.layer pop_addAnimation:swingAnimation forKey:@"swing_animation"];
}

- (void)stopMelodyViewAnimation {
    self.layer.transform = CATransform3DMakeRotation(0, 0, 0, 1);
    [self.layer pop_removeAllAnimations];
}

#pragma mark - Public

- (void)configureMelodyViewWithMelody:(Melody *)melody {

    // set label
    [self.melodyLabel setText:melody.name];

    // set buttons imageview
    [self.melodyImageView setImage:[UIImage imageNamed:melody.imageFilename]];
    [self.melodyImageView setHighlightedImage:[UIImage imageNamed:melody.imageSelectedFilename]];
}

#pragma mark - IBActions

- (IBAction)selectMelody:(id)sender {
    self.melodyImageView.highlighted = !self.melodyImageView.highlighted;

    if ([self isMelodyViewSelected]) {
        [self startMelodyViewAnimation];
    } else {
        [self stopMelodyViewAnimation];
    }

    if (self.delegate != nil && [self.delegate respondsToSelector:@selector(melodyView:didPressMelodyButton:)]) {
        [self.delegate melodyView:self didPressMelodyButton:sender];
    }
}

@end
