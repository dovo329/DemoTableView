//
//  DemographicsTableViewDataSource.h
//  DemoTableView
//
//  Created by TRM on 6/11/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import <Foundation/Foundation.h>
@import UIKit;

@interface DemographicsTableViewDataSource : NSObject <UITableViewDataSource>

- (void)registerTableView:(UITableView *)tableView;

@end
