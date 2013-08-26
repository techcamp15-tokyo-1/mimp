//
//  ArtistTableViewCell.m
//  SidebarDemo
//
//  Created by fixedpoint on 8/26/13.
//  Copyright (c) 2013 Appcoda. All rights reserved.
//

#import "ArtistTableViewCell.h"

@implementation ArtistTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
