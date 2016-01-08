//
//  UILocalizedButton.m
//  MelodyTest
//
//  Created by Philippe Blondin on 8/15/14.
//  Copyright (c) 2016 Philippe Blondin. All rights reserved.
//

#import "UILocalizedBarButtonItem.h"
#import "UIBarItem+Localize.h"

@implementation UILocalizedBarButtonItem

- (void)awakeFromNib {
    [super awakeFromNib];

    if (self.titlekey != nil) {
        [self setTitle:NSLocalizedString(self.titlekey, nil)];
    }
}

@end
