//
//  WalletViewController.m
//  JiaoDaBang
//
//  Created by ott001 on 2017/4/7.
//  Copyright © 2017年 Heaven. All rights reserved.
//

#import "WalletViewController.h"
#import "WithdrawViewController.h"
#import "BillViewController.h"
#import "PaymentVerifyViewController.h"

@interface WalletViewController ()

@property (nonatomic, weak) UILabel *balanceLabel;
@property (nonatomic, weak) UIView *withdrawView;

@end

@implementation WalletViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"我的钱包";
    self.view.backgroundColor = [UIColor colorWithHexString:@"#fafafa"];
    [self setupUI];
    
    [self loadData];
}

- (void)loadData {

    WalletRequest *walletRequest = [[WalletRequest alloc] init];
    [walletRequest setParametersWithUserId:[GlobalManager sharedManager].userId];    [walletRequest setSuccessBlock:^(id object, id responseObject) {
    
        WalletData *walletData = (WalletData *)object;
        
        self.balanceLabel.text = walletData.money;
    
    }];
    
    [walletRequest setFailureBlock:^(NSInteger errorCode, id responseObject) {
        
        DLog(@"-----获取我的钱失败");
        
    }];
    [walletRequest sendRequest];

}

- (void)setupUI{
    UIView *backView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 200)];
    backView.backgroundColor = [UIColor colorWithHexString:@"#8BC34A"];
    [self.view addSubview:backView];
    
    UILabel *moneyLabel = [[UILabel alloc] init];
    moneyLabel.text = @"账户余额";
    moneyLabel.textColor = [UIColor whiteColor];
    moneyLabel.font = [UIFont systemFontOfSize:18];
    [backView addSubview:moneyLabel];
    [moneyLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@40);
        make.centerX.equalTo(backView.mas_centerX);
    }];
    
    UILabel *balanceLabel = [[UILabel alloc] init];
    balanceLabel.text = @"账户余额";
    balanceLabel.textColor = [UIColor whiteColor];
    balanceLabel.font = [UIFont systemFontOfSize:28];
    self.balanceLabel = balanceLabel;
    [backView addSubview:balanceLabel];
    [balanceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(moneyLabel.mas_bottom).offset (10);
        make.centerX.equalTo(backView.mas_centerX);
    }];

    UIButton *withDrawBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    withDrawBtn.backgroundColor = [UIColor whiteColor];
    withDrawBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    [withDrawBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [withDrawBtn setTitle:@"    提现" forState:UIControlStateNormal];
    [self.view addSubview:withDrawBtn];
    [withDrawBtn addTarget:self action:@selector(withDrawBtnDidClicked) forControlEvents:UIControlEventTouchUpInside];
    [withDrawBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@200);
        make.left.equalTo(self.view.mas_left);
        make.right.equalTo(self.view.mas_right);
        make.height.equalTo(@60);
    }];
    
    // 分割线
    UIView *breakView = [[UIView alloc] initWithFrame:CGRectMake(0, 260, SCREEN_WIDTH, 0.5)];
    breakView.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:breakView];

    UIButton *billBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    billBtn.backgroundColor = [UIColor whiteColor];
    billBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    [billBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [billBtn setTitle:@"    账单记录" forState:UIControlStateNormal];
    [self.view addSubview:billBtn];
    [billBtn addTarget:self action:@selector(billBtnDidClicked) forControlEvents:UIControlEventTouchUpInside];
    [billBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@260.5);
        make.left.equalTo(self.view.mas_left);
        make.right.equalTo(self.view.mas_right);
        make.height.equalTo(@60);
    }];
    
    // 分割线
    UIView *breakView1 = [[UIView alloc] initWithFrame:CGRectMake(0, 320, SCREEN_WIDTH, 0.5)];
    breakView1.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:breakView1];
    
    UIButton *verifyBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    verifyBtn.backgroundColor = [UIColor whiteColor];
    verifyBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    [verifyBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [verifyBtn setTitle:@"    认证" forState:UIControlStateNormal];
    [self.view addSubview:verifyBtn];
    [verifyBtn addTarget:self action:@selector(verifyBtnDidClicked) forControlEvents:UIControlEventTouchUpInside];
    [verifyBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@320.5);
        make.left.equalTo(self.view.mas_left);
        make.right.equalTo(self.view.mas_right);
        make.height.equalTo(@60);
    }];
    
    if ([Tools iSNull:[GlobalManager sharedManager].userInfoData.userPayPwd]) {

        UIAlertController *payController =
        [UIAlertController alertControllerWithTitle:@"提示"
                                            message:@"您还没有设置支付密码，请设置完成后再进行余额支付。"
                                     preferredStyle:UIAlertControllerStyleAlert ];
        
        //添加取消到UIAlertController中
        UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleDefault handler:nil];
        [payController addAction:cancelAction];
        
        //添加确定到UIAlertController中
        UIAlertAction *OKAction = [UIAlertAction actionWithTitle:@"设置支付密码" style:UIAlertActionStyleDefault handler:nil];
        [payController addAction:OKAction];
        
        [self presentViewController:payController animated:YES completion:nil];
    }
}

- (void)withDrawBtnDidClicked {
    if (![Tools iSNull:[GlobalManager sharedManager].userInfoData.userAliAccount]) {
        WithdrawViewController *withdrawVC = [[WithdrawViewController alloc] initWithBalanceString:self.balanceLabel.text];
        [self.navigationController pushViewController:withdrawVC animated:YES];

    }else {
        UIAlertController *alertController =
        [UIAlertController alertControllerWithTitle:@"提示"
                    message:@"您还未实名认证，为了资金安全，请实名认证后再进行提现操作"
                    preferredStyle:UIAlertControllerStyleAlert ];
        
        //添加取消到UIAlertController中
        UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleDefault handler:nil];
        [alertController addAction:cancelAction];
        
        //添加确定到UIAlertController中
        UIAlertAction *OKAction = [UIAlertAction actionWithTitle:@"认证" style:UIAlertActionStyleDefault handler:nil];
        [alertController addAction:OKAction];
        
        [self presentViewController:alertController animated:YES completion:nil];
    }
}

- (void)billBtnDidClicked {
    
    BillViewController *billVC = [[BillViewController alloc] init];
    [self.navigationController pushViewController:billVC animated:YES];
}

- (void)verifyBtnDidClicked {
    
    PaymentVerifyViewController *veriftVC = [[PaymentVerifyViewController alloc] init];
    [self.navigationController pushViewController:veriftVC animated:YES];
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
