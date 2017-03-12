//
//  PersonalDataTableViewController.m
//  页面
//
//  Created by apple on 17/3/1.
//  Copyright © 2017年 Sunjiandong. All rights reserved.
//

#import "PersonalDataTableViewController.h"
#import "PersonalDataTableViewCell.h"
#import "JumpToSettingViewController.h"

@interface PersonalDataTableViewController ()
@property (nonatomic, strong) JCAlertView *alert;
@property (nonatomic, strong) NSArray *array;
@end

@implementation PersonalDataTableViewController
- (NSArray *)array {
    if (!_array) {
        _array = @[@"头像",
                   @"昵称",
                   @"手机号",
                   @"性别",
                   @"学校",
                   @"我的常用地址"];
    }
    return _array;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tableView registerClass:[PersonalDataTableViewCell class] forCellReuseIdentifier:@"PersonalDataTableViewCell"];
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
    return 6;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    PersonalDataTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"PersonalDataTableViewCell" forIndexPath:indexPath];
    NSString *modelName = [self.array objectAtIndex:indexPath.row];
    cell.title.text = modelName;
    if (indexPath.section == 0 && indexPath.row == 0) {
        cell.icon.hidden = NO;
        cell.nickName.hidden = YES;
        cell.phoneNum.hidden = YES;
        cell.sex.hidden = YES;
        cell.schoolName.hidden = YES;
        cell.address.hidden = YES;
        // 头像
        cell.icon.backgroundColor = RGB(107, 108, 109);
    }
    if (indexPath.section == 0 && indexPath.row == 1) {
        cell.icon.hidden = YES;
        cell.nickName.hidden = NO;
        cell.phoneNum.hidden = YES;
        cell.sex.hidden = YES;
        cell.schoolName.hidden = YES;
        cell.address.hidden = YES;
        // 昵称
        cell.nickName.text = @"zhang y t";
    }
    if (indexPath.section == 0 && indexPath.row == 2) {
        cell.icon.hidden = YES;
        cell.nickName.hidden = YES;
        cell.phoneNum.hidden = NO;
        cell.sex.hidden = YES;
        cell.schoolName.hidden = YES;
        cell.address.hidden = YES;
        // 手机号
        cell.phoneNum.text = @"135********";
    }
    if (indexPath.section == 0 && indexPath.row == 3) {
        cell.icon.hidden = YES;
        cell.nickName.hidden = YES;
        cell.phoneNum.hidden = YES;
        cell.sex.hidden = NO;
        cell.schoolName.hidden = YES;
        cell.address.hidden = YES;
        // 性别
        cell.sex.text = @"女";
    }
    if (indexPath.section == 0 && indexPath.row == 4) {
        cell.icon.hidden = YES;
        cell.nickName.hidden = YES;
        cell.phoneNum.hidden = YES;
        cell.sex.hidden = YES;
        cell.schoolName.hidden = NO;
        cell.address.hidden = YES;
        // 学校名称
        cell.schoolName.text = @"北京交通大学";
    }
    if (indexPath.section == 0 && indexPath.row == 5) {
        cell.icon.hidden = YES;
        cell.nickName.hidden = YES;
        cell.phoneNum.hidden = YES;
        cell.sex.hidden = YES;
        cell.schoolName.hidden = YES;
        cell.address.hidden = NO;
        // 学校班级
        cell.address.text = @"北京交通大学主校四年级七班56教室";
    }
    // 去掉多余的Cell
    self.tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    if (indexPath.row == 3) {
        cell.accessoryType = UITableViewCellAccessoryNone;
    } else {
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 64;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (indexPath.section == 0 && indexPath.row == 3) {
        [self popupGenderView];
    }
    if (indexPath.section == 0 && indexPath.row == 1) {
        JumpToSettingViewController *vc = [[JumpToSettingViewController alloc] init];
        vc.num = [NSString stringWithFormat:@"%ld",indexPath.row];
        [self.navigationController pushViewController:vc animated:YES];
    }
    if (indexPath.section == 0 && indexPath.row == 2) {
        JumpToSettingViewController *vc = [[JumpToSettingViewController alloc] init];
        vc.num = [NSString stringWithFormat:@"%ld",indexPath.row];
        [self.navigationController pushViewController:vc animated:YES];
    }
    if (indexPath.section == 0 && indexPath.row == 4) {
        JumpToSettingViewController *vc = [[JumpToSettingViewController alloc] init];
        vc.num = [NSString stringWithFormat:@"%ld",indexPath.row];
        [self.navigationController pushViewController:vc animated:YES];
    }
    if (indexPath.section == 0 && indexPath.row == 5) {
        JumpToSettingViewController *vc = [[JumpToSettingViewController alloc] init];
        vc.num = [NSString stringWithFormat:@"%ld",indexPath.row];
        [self.navigationController pushViewController:vc animated:YES];
    }
}


// 性别选择View
- (void)popupGenderView {
    UIView *custtomView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 200, 110)];
    custtomView.backgroundColor = [UIColor whiteColor];
    custtomView.layer.cornerRadius = 8;
    custtomView.layer.masksToBounds = YES;
    // 男
    UIButton *male = [[UIButton alloc] initWithFrame:CGRectMake(custtomView.frame.size.width * 0.5 - 40, 20, 80, 25)];
    [male setTitle:@"男" forState:UIControlStateNormal];
    [male setBackgroundColor:RGB(156, 197, 28)];
    [male setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    male.layer.cornerRadius = 5;
    male.layer.masksToBounds = YES;
    male.tag = 1;
    [male addTarget:self action:@selector(genderView:) forControlEvents:UIControlEventTouchUpInside];
    [custtomView addSubview:male];
    // 女
    UIButton *female = [[UIButton alloc] initWithFrame:CGRectMake(custtomView.frame.size.width * 0.5 - 40, 60, 80, 25)];
    [female setTitle:@"女" forState:UIControlStateNormal];
    [female setBackgroundColor:RGB(156, 197, 28)];
    [female setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    female.layer.cornerRadius = 5;
    female.layer.masksToBounds = YES;
    female.tag = 2;
    [female addTarget:self action:@selector(genderView:) forControlEvents:UIControlEventTouchUpInside];
    [custtomView addSubview:female];
    _alert = [[JCAlertView alloc] initWithCustomView:custtomView dismissWhenTouchedBackground:YES];
    [self.alert show];
}

// 男女选择按钮
- (void)genderView:(UIButton *)sender {
    NSInteger sex = sender.tag; // tag 1男，2女
    __weak typeof(self) weakSelf = self;
    [self.alert dismissWithCompletion:^{
        PersonalDataTableViewCell *cell = [weakSelf.tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:3 inSection:0]];
        cell.sex.text = sender.titleLabel.text;
    }];
}

@end
