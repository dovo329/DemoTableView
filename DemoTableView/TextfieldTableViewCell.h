//
//  TextfieldTableViewCell.h
//  DemoTableView
//
//  Created by TRM on 6/11/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol TextfieldTableViewCellDelegate;

@interface TextfieldTableViewCell : UITableViewCell

@property (strong, nonatomic) UITextField *textField;
@property (weak, nonatomic) id<TextfieldTableViewCellDelegate> delegate;

@end

@protocol TextfieldTableViewCellDelegate <NSObject>

@required

- (void)textFieldDidEndEditing:(TextfieldTableViewCell *)cell;

@end
