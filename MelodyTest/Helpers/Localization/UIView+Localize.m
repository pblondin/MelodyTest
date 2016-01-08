//
//  UIView+Localization.m
//  core app
//
//  Created by Philippe Blondin on 2015-03-16.
//  Copyright (c) 2015 E-180 Inc. All rights reserved.
//

#import "UIView+Localize.h"
#import <objc/runtime.h>

@implementation UIView (Localize)

static const void *TitleKey = &TitleKey;

- (NSString *)title {
    return objc_getAssociatedObject(self, TitleKey);
}

- (void)setTitle:(NSString *)titlekey {
    objc_setAssociatedObject(self, TitleKey, titlekey, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

static const void *TitleLocalizationKey = &TitleLocalizationKey;

- (NSString *)titlekey {
    return objc_getAssociatedObject(self, TitleLocalizationKey);
}

- (void)setTitlekey:(NSString *)title {
    objc_setAssociatedObject(self, TitleLocalizationKey, title, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

@end
