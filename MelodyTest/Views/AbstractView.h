//
//  AbstractView.h
//  MelodyTest
//
//  Created by Philippe Blondin on 2016-01-08.
//  Copyright © 2016 Philippe Blondin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AbstractView : UIView

#pragma mark - Class methods

/**
 *  Returns the `UINib` object initialized for the cell.
 *
 *  @return The initialized `UINib` object or `nil` if there were errors during
 *  initialization or the nib file could not be located.
 */
+ (UINib *)nib;

@end
