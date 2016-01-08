//
//  UIViewController+Localization.h
//  core app
//
//  Created by Philippe Blondin on 2015-03-16.
//  Copyright (c) 2015 E-180 Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (Localize)

// The title of the view
@property(nonatomic, strong) NSString *title;

// The title key using Localization file
@property(nonatomic, strong) NSString *titlekey;

@end
