//
//  TextfieldTableViewCell.m
//  DemoTableView
//
//  Created by TRM on 6/11/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import "TextfieldTableViewCell.h"
#import "UIView+FLKAutoLayout.h"

@interface TextfieldTableViewCell() <UITextFieldDelegate>

@end

@implementation TextfieldTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    // Initialization code for Programmatically
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self)
    {
        self.textField = [UITextField new];
        self.textField.delegate = self;
        [self.contentView addSubview:self.textField];
        
        [self.textField alignTop:@"5" leading:@"16" bottom:@"-5" trailing:@"-16" toView:self.contentView];
    }
    
    return self;
}


- (void)textFieldDidEndEditing:(UITextField *)textField
{
    [self.delegate textFieldDidEndEditing:self];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

- (void)awakeFromNib {
    // Initialization code for Storyboard
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
