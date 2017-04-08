//
//  AccountViewController.m
//  JiaoDaBang
//
//  Created by ott001 on 2017/4/8.
//  Copyright © 2017年 Heaven. All rights reserved.
//

#import "AccountViewController.h"
#import "ChangePayPasswordViewController.h"
#import "ChangeUserPasswordViewController.h"

@interface AccountViewController ()

@property (nonatomic, copy) NSString *titleString;

@end

@implementation AccountViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"帐户与安全";
    self.view.backgroundColor = [UIColor colorWithHexString:@"#fafafa"];
    [self setupUI];
}

- (void)setupUI{
    
    UIButton *userPwdBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    userPwdBtn.backgroundColor = [UIColor whiteColor];
    userPwdBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    [userPwdBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [userPwdBtn setTitle:@"  修改密码" forState:UIControlStateNormal];
    [self.view addSubview:userPwdBtn];
    [userPwdBtn addTarget:self action:@selector(changeUserPassword) forControlEvents:UIControlEventTouchUpInside];
    [userPwdBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(@60);
        make.top.equalTo(@20);
        make.left.equalTo(self.view.mas_left);
        make.right.equalTo(self.view.mas_right);
    }];
    
    UIButton *payPwdBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    payPwdBtn.backgroundColor = [UIColor whiteColor];
    payPwdBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    [payPwdBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    if ([Tools iSNull:[GlobalManager sharedManager].userInfoData.userPayPwd]) {
        self.titleString = @"  设置支付密码";
    }else{
        self.titleString = @"  修改支付密码";
    }
    [payPwdBtn setTitle:self.titleString forState:UIControlStateNormal];
    [self.view addSubview:payPwdBtn];
    [payPwdBtn addTarget:self action:@selector(changePayPassword) forControlEvents:UIControlEventTouchUpInside];
    [payPwdBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(@60);
        make.top.equalTo(@81);
        make.left.equalTo(self.view.mas_left);
        make.right.equalTo(self.view.mas_right);
    }];
}

- (void)changeUserPassword{
    ChangeUserPasswordViewController *userVC = [[ChangeUserPasswordViewController alloc] init];
    [self.navigationController pushViewController:userVC animated:YES];
}

- (void)changePayPassword{
    ChangePayPasswordViewController *payCV = [[ChangePayPasswordViewController alloc] initWithTitleString:self.titleString];
    [self.navigationController pushViewController:payCV animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
