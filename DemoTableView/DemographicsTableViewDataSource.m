//
//  DemographicsTableViewDataSource.m
//  DemoTableView
//
//  Created by TRM on 6/11/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import "DemographicsTableViewDataSource.h"
#import "Demographics.h"
#import "TextfieldTableViewCell.h"
#import "GenderTableViewCell.h"
#import "MaritalTableViewCell.h"

typedef NS_ENUM(int16_t, DemographicsTableViewDataSourceSection)
{
    NameSection = 0,
    AddressSection = 1,
    GenderSection = 2,
    AgeSection = 3,
    MaritalStatusSection = 4
};

static NSString *textFieldCellID = @"textField";
static NSString *genderCellID = @"gender";
static NSString *maritalCellID = @"marital";

@interface DemographicsTableViewDataSource() <TextfieldTableViewCellDelegate>

@property (strong, nonatomic) Demographics *demographics;
@property (strong, nonatomic) UITableView *tableView;

@end

@implementation DemographicsTableViewDataSource

- (void)registerTableView:(UITableView *)tableView
{
    self.demographics = [Demographics new];
    self.tableView = tableView;
    [tableView registerClass:[TextfieldTableViewCell class] forCellReuseIdentifier:textFieldCellID];
    [tableView registerClass:[GenderTableViewCell class] forCellReuseIdentifier:genderCellID];
    [tableView registerClass:[MaritalTableViewCell class] forCellReuseIdentifier:maritalCellID];
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    NSArray *titleArray = @[@"Name",
                           @"Address",
                           @"Gender",
                           @"Age",
                           @"Marital Status",
                           @"Other Cells to Demostrate Dequeueing"];
    
    return titleArray[section];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 6;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    switch (section)
    {
        case NameSection:
            return 2;
            break;
        case AddressSection:
            return 4;
            break;
        case GenderSection:
            return 1;
            break;
        case AgeSection:
            return 1;
            break;
        case MaritalStatusSection:
            return 1;
            break;
        default:
            return 50;
            break;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell;
    
    switch (indexPath.section)
    {
        case NameSection:
            cell = [tableView dequeueReusableCellWithIdentifier:textFieldCellID];
            ((TextfieldTableViewCell *)cell).delegate = self;
            if (indexPath.row == 0)
            {
                ((TextfieldTableViewCell *)cell).textField.placeholder = @"First Name";
                ((TextfieldTableViewCell *)cell).textField.text = self.demographics.firstName;
            }
            else
            {
                ((TextfieldTableViewCell *)cell).textField.placeholder = @"Last Name";
                ((TextfieldTableViewCell *)cell).textField.text = self.demographics.lastName;
            }
            break;
        case AddressSection:
            cell = [tableView dequeueReusableCellWithIdentifier:textFieldCellID];
            ((TextfieldTableViewCell *)cell).delegate = self;
            if (indexPath.row == DemographicsStreetAddress)
            {
                ((TextfieldTableViewCell *)cell).textField.placeholder = @"Street Address";
                ((TextfieldTableViewCell *)cell).textField.text = self.demographics.streetAddress;
            }
            else if (indexPath.row == DemographicsCity)
            {
                ((TextfieldTableViewCell *)cell).textField.placeholder = @"City";
                ((TextfieldTableViewCell *)cell).textField.text = self.demographics.city;
            }
            else if (indexPath.row == DemographicsState)
            {
                ((TextfieldTableViewCell *)cell).textField.placeholder = @"State";
                ((TextfieldTableViewCell *)cell).textField.text = self.demographics.state;
            }
            else if (indexPath.row == DemographicsZipCode)
            {
                ((TextfieldTableViewCell *)cell).textField.placeholder = @"Zip Code";
                ((TextfieldTableViewCell *)cell).textField.text = self.demographics.zipCode;
            }
            break;
        case GenderSection:
            cell = [tableView dequeueReusableCellWithIdentifier:genderCellID];
            [((GenderTableViewCell *)cell).segmentedControl addTarget:self action:@selector(genderSegmentChanged:) forControlEvents:UIControlEventValueChanged];
            break;
        case AgeSection:
            cell = [tableView dequeueReusableCellWithIdentifier:textFieldCellID];
            ((TextfieldTableViewCell *)cell).delegate = self;
            ((TextfieldTableViewCell *)cell).textField.placeholder = @"Age";
            ((TextfieldTableViewCell *)cell).textField.keyboardType = UIKeyboardTypeNumberPad;
            ((TextfieldTableViewCell *)cell).textField.text = [self.demographics.age stringValue];
            break;
        case MaritalStatusSection:
            cell = [tableView dequeueReusableCellWithIdentifier:maritalCellID];
            [((MaritalTableViewCell *)cell).segmentedControl addTarget:self action:@selector(maritalStatusSegmentChanged:) forControlEvents:UIControlEventValueChanged];
            break;
        default:
            cell = [tableView dequeueReusableCellWithIdentifier:textFieldCellID];
            ((TextfieldTableViewCell *)cell).textField.text = @"";
            ((TextfieldTableViewCell *)cell).textField.placeholder = @"";
            break;
    }
    
    return cell;
}

- (void)textFieldDidEndEditing:(TextfieldTableViewCell *)cell
{
    UITextField *textField = cell.textField;
    NSIndexPath *indexPath = [self.tableView indexPathForCell:cell];
    
    if (indexPath.section == NameSection)
    {
        switch (indexPath.row)
        {
            case 0:
                self.demographics.firstName = textField.text;
                break;
            case 1:
                self.demographics.lastName = textField.text;
                break;
        }
    }
    else if (indexPath.section == AddressSection)
    {
        switch (indexPath.row)
        {
            case DemographicsStreetAddress:
                self.demographics.streetAddress = textField.text;
                break;
            case DemographicsCity:
                self.demographics.city = textField.text;
                break;
            case DemographicsState:
                self.demographics.state = textField.text;
                break;
            case DemographicsZipCode:
                self.demographics.zipCode = textField.text;
                break;
                
        }
    }
    else if (indexPath.section == AgeSection)
    {
        self.demographics.age = [NSNumber numberWithInteger:[textField.text integerValue]];
    }
    
}

- (void)genderSegmentChanged:(id)sender
{
    UISegmentedControl *sc = sender;
    self.demographics.gender = sc.selectedSegmentIndex;
}

- (void)maritalStatusSegmentChanged:(id)sender
{
    UISegmentedControl *sc = sender;
    self.demographics.maritalStatus = sc.selectedSegmentIndex;
}















@end
