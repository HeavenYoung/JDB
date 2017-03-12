//
//  DeliveryTableViewController.m
//  页面
//
//  Created by apple on 17/3/2.
//  Copyright © 2017年 Sunjiandong. All rights reserved.
//


#import "DeliveryTableViewController.h"


@interface DeliveryTableViewController ()
// 扩展按钮数组
@property (nonatomic,strong) NSMutableArray *menuItems;
// 扩展按钮
@property (nonatomic, strong) UIButton *chooseBtn;

@end

@implementation DeliveryTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    [self addFooterButton];
}

- (void)addFooterButton {
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 80)];
    view.backgroundColor = [UIColor whiteColor];
    UIButton *button = [UIButton new];
    [button setTitle:@"免费送达" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    button.userInteractionEnabled = YES;
    button.layer.masksToBounds = YES;
    button.layer.cornerRadius = 5;
    button.backgroundColor = RGB(156, 197, 28);
    [view addSubview:button];
    [button mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(view.mas_left).offset(40);
        make.right.equalTo(view.mas_right).offset(-40);
        make.top.equalTo(view.mas_top).offset(20);
        make.height.equalTo(@35);
    }];
    self.tableView.tableFooterView = view;
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
    static NSString *tableViewIdentifier = @"Cell_Delivery";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:tableViewIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:tableViewIdentifier];
    }
    // cell 点击无效果
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    if (indexPath.section == 0 && indexPath.row == 0) {
        UIView *viewOne = [UIView new];
        viewOne.frame = cell.bounds;
        UILabel *text = [UILabel new];
        text.textColor = RGB(100, 101, 102);
        text.text = [NSString stringWithFormat:@"您的快递已到达：%@",@"校内服务站"];
        [viewOne addSubview:text];
        [cell addSubview:viewOne];
        [text mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(viewOne.mas_left).offset(15);
            make.top.equalTo(viewOne.mas_top).offset(22);
            make.height.equalTo(@20);
        }];
    }
    
    if (indexPath.section == 0 && indexPath.row == 1) {
        UIView *viewTwo = [UIView new];
        viewTwo.frame = cell.bounds;
        // 包头1
        UILabel *text1 = [UILabel new];
        text1.font = My_Font(14);
        text1.textColor = RGB(100, 101, 102);
        text1.text = [NSString stringWithFormat:@"请填写最后一公里详细地址："];
        [viewTwo addSubview:text1];
        [cell addSubview:viewTwo];
        [text1 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(viewTwo.mas_left).offset(15);
            make.top.equalTo(viewTwo.mas_top).offset(10);
            make.height.equalTo(@20);
        }];
        // 包头2
        UILabel *text2 = [UILabel new];
        text2.font = My_Font(14);
        text2.textColor = RGB(100, 101, 102);
        text2.text = [NSString stringWithFormat:@"选择地址"];
        [viewTwo addSubview:text2];
        [text2 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(viewTwo.mas_left).offset(15);
            make.top.equalTo(text1.mas_bottom).offset(25);
            make.height.equalTo(@20);
        }];
        
        _chooseBtn = [UIButton new];
        NSString *str = [NSString stringWithFormat:@"%@ ▼",@"北京交通大学第九教学楼"];
        [_chooseBtn setTitle:str forState:UIControlStateNormal];
        [_chooseBtn setTintColor:[UIColor blackColor]];
        _chooseBtn.backgroundColor = RGB(156, 197, 28);
        _chooseBtn.titleLabel.font = My_Font(14);
        _chooseBtn.userInteractionEnabled = YES;
        _chooseBtn.layer.masksToBounds = YES;
        _chooseBtn.layer.cornerRadius = 5;
        [viewTwo addSubview:_chooseBtn];
        [_chooseBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(text1.mas_bottom).offset(25);
            make.left.equalTo(text2.mas_right).offset(10);
            make.right.equalTo(viewTwo.mas_right).offset(25);
            make.height.equalTo(@30);
        }];
    }
    
    if (indexPath.section == 0 && indexPath.row == 2) {
        UIView *viewThree = [UIView new];
        viewThree.frame = cell.bounds;
        UILabel *text3 = [UILabel new];
        text3.font = My_Font(14);
        text3.textColor = RGB(100, 101, 102);
        text3.text = [NSString stringWithFormat:@"详细地址"];
        [viewThree addSubview:text3];
        [cell addSubview:viewThree];
        [text3 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(viewThree.mas_left).offset(15);
            make.top.equalTo(viewThree.mas_top).offset(22);
            make.height.equalTo(@20);
        }];
        
        UITextField *textField = [[UITextField alloc] init];
        textField.borderStyle = UITextBorderStyleRoundedRect;
        textField.placeholder = @"请填写详细地址";
        textField.font = [UIFont fontWithName:@"Arial" size:12.0f];
        textField.keyboardType = UIKeyboardTypeASCIICapable;
        [viewThree addSubview:textField];
        [textField mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(text3.mas_right).offset(5);
            make.top.equalTo(viewThree.mas_top).offset(15);
            make.right.equalTo(viewThree.mas_right).offset(25);
            make.height.equalTo(@40);
        }];
    }
    
    return cell;
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0 && indexPath.row == 1) {
        return 100;
    }else {
        return 64;
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (indexPath.section == 0 && indexPath.row == 1) {
        __weak typeof(self) weakSelf = self;
        [YCXMenu setTintColor:[UIColor whiteColor]];
        [YCXMenu setHasShadow:YES];
        if ([YCXMenu isShow]) {
            [YCXMenu dismissMenu];
        } else {
            [YCXMenu showMenuInView:self.view fromRect:CGRectMake(CGRectGetMaxX(_chooseBtn.frame)-25, CGRectGetMaxY(_chooseBtn.frame)+65, 40, 0) menuItems:weakSelf.menuItems selected:^(NSInteger index, YCXMenuItem *item) {
                switch (item.tag) {
                    case 100:{
                        
                        break;
                    }
                    case 101:{
                        
                        break;
                    }
                    case 102:{
                        
                        break;
                    }
                    case 103:{
                        
                        break;
                    }
                    default:
                        break;
                }
            }];
        }
    }
}

// 扩展按钮数组
- (NSMutableArray *)menuItems {
    if (!_menuItems) {
        _menuItems = [@[
                        [YCXMenuItem menuItem:@"地址1111111111"
                                        image:nil
                                          tag:100
                                     userInfo:@{@"title":@"Menu"}],
                        [YCXMenuItem menuItem:@"地址2222222222"
                                        image:nil
                                          tag:101
                                     userInfo:@{@"title":@"Menu"}],
                        [YCXMenuItem menuItem:@"地址333333333333"
                                        image:nil
                                          tag:102
                                     userInfo:@{@"title":@"Menu"}],
                        [YCXMenuItem menuItem:@"地址444444444444"
                                        image:nil
                                          tag:103
                                     userInfo:@{@"title":@"Menu"}],
                        ] mutableCopy];
    }
    return _menuItems;
}


@end
