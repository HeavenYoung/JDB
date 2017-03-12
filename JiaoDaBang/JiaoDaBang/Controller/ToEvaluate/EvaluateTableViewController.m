//
//  EvaluateTableViewController.m
//  页面
//
//  Created by apple on 17/3/1.
//  Copyright © 2017年 Sunjiandong. All rights reserved.
//

#import "EvaluateTableViewController.h"
#import "EvaluateTableViewCell.h"


@interface EvaluateTableViewController ()

@end

@implementation EvaluateTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tableView registerClass:[EvaluateTableViewCell class] forCellReuseIdentifier:@"EvaluateTableViewCell"];
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 5;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    EvaluateTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"EvaluateTableViewCell" forIndexPath:indexPath];
    // 去掉多余的Cell
    self.tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 160;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];

}

@end
