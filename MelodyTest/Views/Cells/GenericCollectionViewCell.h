//
//  GenericTableViewCell.h
//  core app
//
//  Created by Philippe Blondin on 2015-07-22.
//  Copyright (c) 2015 TAG Taxi. All rights reserved.
//

#import "GenericViewCellProtocol.h"
#import <UIKit/UIKit.h>

@interface GenericCollectionViewCell : UICollectionViewCell <GenericViewCellProtocol>

#pragma mark - Class methods

/**
 *  Returns the `UINib` object initialized for the cell.
 *
 *  @return The initialized `UINib` object or `nil` if there were errors during
 *  initialization or the nib file could not be located.
 */
+ (UINib *)nib;

/**
 *  Returns the default string used to identify a reusable cell for text message items.
 *
 *  @return The string used to identify a reusable cell.
 */
+ (NSString *)cellReuseIdentifier;

@end
