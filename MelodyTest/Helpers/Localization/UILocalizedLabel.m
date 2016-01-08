//
//  UILocalizedLabel.m
//  MelodyTest
//
//  Created by Philippe Blondin on 8/15/14.
//  Copyright (c) 2014 E-180 Inc. All rights reserved.
//

#import "UILocalizedLabel.h"
#import "UIView+Localize.h"

@implementation UILocalizedLabel

- (void)awakeFromNib {
    [super awakeFromNib];

    if (self.titlekey != nil) {
        self.text = NSLocalizedString(self.titlekey, nil);
    }
}

@end
