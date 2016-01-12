//
//  GenericViewCellProtocol.h
//  core app
//
//  Created by Philippe Blondin on 2014-09-16.
//  Copyright (c) 2014 E-180 Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol GenericViewCellProtocol <NSObject>

/**
 *  Configure the cell using the backed object
 *
 *  @param cellObject The backed object of the cell
 */
- (void)configureCell:(NSObject *)cellObject;

@end
