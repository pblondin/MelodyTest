//
//  GenericTableViewCell.m
//  core app
//
//  Created by Philippe Blondin on 2015-07-22.
//  Copyright (c) 2015 TAG Taxi. All rights reserved.
//

#import "GenericCollectionViewCell.h"

@implementation GenericCollectionViewCell

#pragma mark - Class methods

+ (UINib *)nib {
    return [UINib nibWithNibName:NSStringFromClass([self class]) bundle:[NSBundle bundleForClass:[self class]]];
}

+ (NSString *)cellReuseIdentifier {
    return NSStringFromClass([self class]);
}

#pragma mark - Initialization

- (void)awakeFromNib {
    // Initialization code
    [super awakeFromNib];

    self.backgroundColor = [UIColor clearColor];
}

#pragma mark - <GenericViewCellProtocol>

- (void)configureCell:(NSObject *)cellObject {
    // Abstract protocol implementation
    // we get rid of compiler warning
}

@end
