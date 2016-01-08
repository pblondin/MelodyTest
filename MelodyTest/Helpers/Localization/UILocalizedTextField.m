//
//  UILocalizedTextField.m
//  MelodyTest
//
//  Created by Philippe Blondin on 8/15/14.
//  Copyright (c) 2014 E-180 Inc. All rights reserved.
//

#import "UILocalizedTextField.h"
#import "UIView+Localize.h"

@implementation UILocalizedTextField

#pragma mark - View lifecycle

- (void)awakeFromNib {
    [super awakeFromNib];
    [self commonInitLocalizedTextField];
}

- (instancetype)init {
    self = [super init];
    if (self) {
        [self commonInitLocalizedTextField];
    }
    return self;
}

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self commonInitLocalizedTextField];
    }
    return self;
}

- (void)commonInitLocalizedTextField {
    if (self.titlekey != nil) {
        self.placeholder = NSLocalizedString(self.titlekey, nil);
    }
}

@end
