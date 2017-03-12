//
//  SettingTableViewController.m
//  页面
//
//  Created by apple on 17/3/1.
//  Copyright © 2017年 Sunjiandong. All rights reserved.
//

#import "SettingTableViewController.h"
#import "SettingTableViewCell.h"
#import "PersonalDataTableViewController.h"
#import "AccountSecurityTableViewController.h"


@interface SettingTableViewController ()

@end

@implementation SettingTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tableView registerClass:[SettingTableViewCell class] forCellReuseIdentifier:@"SettingTableViewCell"];
    
    [self addFooterButton];
}

- (void)addFooterButton {
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 80)];
    view.backgroundColor = [UIColor whiteColor];
    UIButton *button = [UIButton new];
    [button setTitle:@"退出当前账户" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    button.userInteractionEnabled = YES;
    button.layer.masksToBounds = YES;
    button.layer.cornerRadius = 5;
    button.backgroundColor = RGB(156, 197, 28);
    [button addTarget:self action:@selector(exitTheCurrentAccount:) forControlEvents:UIControlEventTouchUpInside];
    [view addSubview:button];
    [button mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(view.mas_left).offset(40);
        make.right.equalTo(view.mas_right).offset(-40);
        make.top.equalTo(view.mas_top).offset(20);
        make.height.equalTo(@35);
    }];
    self.tableView.tableFooterView = view;
}

// 退出当前账号事件
- (void)exitTheCurrentAccount:(UIButton *)sender {
//    [MBProgressHUD showSuccess:@"退出当前账号"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 3;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    SettingTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"SettingTableViewCell" forIndexPath:indexPath];
    if (indexPath.section == 0 && indexPath.row == 0) {
        cell.iconImg.backgroundColor = RGB(156, 197, 28);
        cell.title.text = @"个人资料";
    }
    if (indexPath.section == 0 && indexPath.row == 1) {
        cell.iconImg.backgroundColor = RGB(156, 197, 28);
        cell.title.text = @"账户与安全";
    }
    if (indexPath.section == 0 && indexPath.row == 2) {
        cell.iconImg.backgroundColor = RGB(156, 197, 28);
        cell.title.text = @"关于我们";
    }
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 64;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (indexPath.section == 0 && indexPath.row == 0) {
        [self.navigationController pushViewController:[PersonalDataTableViewController new] animated:YES];
    }else if (indexPath.section == 0 && indexPath.row == 1) {
        [self.navigationController pushViewController:[AccountSecurityTableViewController new] animated:YES];
    }else if (indexPath.section == 0 && indexPath.row == 2){
//        [MBProgressHUD showSuccess:@"关于我们"];
    }
}

@end
