//
//  WalletTableViewController.m
//  页面
//
//  Created by apple on 17/3/2.
//  Copyright © 2017年 Sunjiandong. All rights reserved.
//

#import "WalletTableViewController.h"
#import "WalletTableViewCell.h"
#import "WithdrawalViewController.h"

@interface WalletTableViewController ()
// 头部View
@property (nonatomic, strong) UIView *headerView;
// 头部标题
@property (nonatomic, strong) UILabel *headerTitle;
// 头部金额
@property (nonatomic, strong) UILabel *moneyTitle;
@end

@implementation WalletTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tableView registerClass:[WalletTableViewCell class] forCellReuseIdentifier:@"WalletTableViewCell"];
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

    return 2;
}

// 头部高度
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 120;
}

// 设置Cell高度
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 64;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    WalletTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"WalletTableViewCell" forIndexPath:indexPath];
    if(indexPath.section == 0 && indexPath.row == 0) {
        cell.title.text = @"提现";
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }else {
        cell.title.text = @"冻结金额";
        cell.money.text = [NSString stringWithFormat:@"%@ 元",@"30"];
        cell.accessoryType = UITableViewCellAccessoryNone;
    }
    // 去掉多余的Cell
    self.tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (indexPath.section == 0 && indexPath.row == 0) {
        [self.navigationController pushViewController:[WithdrawalViewController new] animated:YES];
    }
}


#pragma ForHeader
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    self.headerView = [[UIView alloc]initWithFrame:CGRectMake(0, 200, MAIN_SCREEN_WIDTH, 400/MAIN_SCREEN_WIDTH)];
    self.headerView.backgroundColor = RGB(156, 197, 28);
    [self setupHeaderView];
    return self.headerView;
}

- (void)setupHeaderView{
    
    _headerTitle = [[UILabel alloc] initWithFrame:CGRectMake(MAIN_SCREEN_WIDTH / 2 - 40, 40, 80, 20)];
    _headerTitle.font = My_Font(15);
    _headerTitle.textColor = RGB(255, 255, 255);
    _headerTitle.text = @"账户余额";
    [self.headerView addSubview:_headerTitle];
    
    _moneyTitle = [[UILabel alloc] initWithFrame:CGRectMake(MAIN_SCREEN_WIDTH / 2 - 90, CGRectGetMaxY(_headerTitle.frame)+10 , 180, 35)];
    _moneyTitle.font = My_Font(25);
    _moneyTitle.textColor = RGB(255, 255, 255);
    _moneyTitle.textAlignment = UITextAlignmentCenter;
    _moneyTitle.text = @"30（元）";
    [self.headerView addSubview:_moneyTitle];
}
@end

#define MAIN_SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define RGB(r,g,b) [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:1]
#define My_Font(SIZE)  [UIFont boldSystemFontOfSize:SIZE];
#import "Masonry.h"
