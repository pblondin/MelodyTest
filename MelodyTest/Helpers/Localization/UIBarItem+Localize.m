//
//  UIView_ViewTitle.h
//  MelodyTest
//
//  Created by Philippe Blondin on 8/14/14.
//  Copyright (c) 2014 E-180 Inc. All rights reserved.
//

#import "UIBarItem+Localize.h"
#import <objc/runtime.h>

@implementation UIBarItem (Localize)

static const void *TitleKey = &TitleKey;

- (NSString *)titlekey {
    return objc_getAssociatedObject(self, TitleKey);
}

- (void)setTitlekey:(NSString *)titlekey {
    objc_setAssociatedObject(self, TitleKey, titlekey, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

@end