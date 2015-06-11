//
//  ViewController.m
//  DemoTableView
//
//  Created by TRM on 6/11/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import "ViewController.h"
#import "UIView+FLKAutoLayout.h"
#import "DemographicsTableViewDataSource.h"

@interface ViewController ()

@property (strong, nonatomic) UITableView *tableView;
@property (strong, nonatomic) DemographicsTableViewDataSource *dataSource;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.title = @"Enter Your Information";
    
    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    self.dataSource = [DemographicsTableViewDataSource new];
    [self.dataSource registerTableView:self.tableView];
    self.tableView.dataSource = self.dataSource;
    [self.view addSubview:self.tableView];
    
    [self.tableView alignTop:@"0" leading:@"0" bottom:@"0" trailing:@"0" toView:self.view];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
