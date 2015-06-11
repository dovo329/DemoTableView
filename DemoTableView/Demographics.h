//
//  Demographics.h
//  DemoTableView
//
//  Created by TRM on 6/11/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(int16_t, DemographicsGender)
{
    DemographicsGenderMale = 0,
    DemographicsGenderFemale = 1
};

typedef NS_ENUM(int16_t, DemographicsMaritalStatus)
{
    DemographicsSingle = 0,
    DemographicsMarried = 1,
    DemographicsDivorced = 2,
    DemographicsWidowed = 3
};

typedef NS_ENUM(int16_t, DemographicAddressComponents)
{
    DemographicsStreetAddress = 0,
    DemographicsCity = 1,
    DemographicsState = 2,
    DemographicsZipCode = 3
};

@interface Demographics : NSObject

@property (strong, nonatomic) NSString *firstName;
@property (strong, nonatomic) NSString *lastName;

@property (strong, nonatomic) NSString *streetAddress;
@property (strong, nonatomic) NSString *city;
@property (strong, nonatomic) NSString *state;
@property (strong, nonatomic) NSString *zipCode;

@property (assign, nonatomic) enum DemographicsGender gender;

@property (strong, nonatomic) NSNumber *age;

@property (assign, nonatomic) enum DemographicsMaritalStatus maritalStatus;

@end
