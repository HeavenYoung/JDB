//
//  AccountSecurityTableViewController.m
//  页面
//
//  Created by apple on 17/3/3.
//  Copyright © 2017年 Sunjiandong. All rights reserved.
//

#import "AccountSecurityTableViewController.h"
#import "AccountSecurityTableViewCell.h"
#import "ModifyNicknameViewController.h"
#import "ModifyPhoneNumberViewController.h"
#import "ResetPasswordViewController.h"
@interface AccountSecurityTableViewController ()
@property (nonatomic, strong) NSArray *array;


@end

@implementation AccountSecurityTableViewController
- (NSArray *)array {
    if (!_array) {
        _array = @[@"昵称",
                   @"修改手机号码",
                   @"修改密码"];
    }
    return _array;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tableView registerClass:[AccountSecurityTableViewCell class] forCellReuseIdentifier:@"AccountSecurityTableViewCell"];
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
    return 3;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 64;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    AccountSecurityTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"AccountSecurityTableViewCell" forIndexPath:indexPath];
    // 去掉多余的Cell
    self.tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    NSString *modelName = [self.array objectAtIndex:indexPath.row];
    
    cell.title.text = modelName;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (indexPath.section == 0 && indexPath.row == 0) {
        [self.navigationController pushViewController:[ModifyNicknameViewController new] animated:YES];
    }else if (indexPath.section == 0 && indexPath.row == 1) {
        [self.navigationController pushViewController:[ModifyPhoneNumberViewController new] animated:YES];
    }else if (indexPath.section == 0 && indexPath.row == 2) {
        [self.navigationController pushViewController:[ResetPasswordViewController new] animated:YES];
    }
}

@end
