//
//  GenderTableViewCell.m
//  DemoTableView
//
//  Created by TRM on 6/11/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import "GenderTableViewCell.h"
#import "UIView+FLKAutoLayout.h"

@implementation GenderTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    // Initialization code for Programmatically
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self)
    {
        self.segmentedControl = [[UISegmentedControl alloc] initWithItems:@[@"Male", @"Female"]];
        [self.contentView addSubview:self.segmentedControl];
        
        [self.segmentedControl alignTop:@"5" leading:@"16" bottom:@"-5" trailing:@"-16" toView:self.contentView];
    }
    
    return self;
}

- (void)awakeFromNib {
    // Initialization code for Storyboard
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
