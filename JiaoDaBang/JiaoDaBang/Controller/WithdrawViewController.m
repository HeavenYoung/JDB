//
//  WithdrawViewController.m
//  JiaoDaBang
//
//  Created by ott001 on 2017/4/7.
//  Copyright © 2017年 Heaven. All rights reserved.
//

#import "WithdrawViewController.h"

@interface WithdrawViewController ()

@property (nonatomic, weak) UITextField *moneyTextField;
@property (nonatomic, copy) NSString *balanceString;
@property (nonatomic, weak) NSString *password;

@end

@implementation WithdrawViewController

- (instancetype)initWithBalanceString:(NSString *)balanceString {

    self = [super init];
    if (self) {
        self.balanceString = balanceString;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"提现";
    self.view.backgroundColor = [UIColor colorWithHexString:@"#fafafa"];
    [self setupUI];
}

- (void)setupUI{
    UIView *backView = [[UIView alloc] initWithFrame:CGRectMake(0, 20, SCREEN_WIDTH, 140)];
    backView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:backView];
    
    UILabel *nameLabel = [[UILabel alloc] init];
    nameLabel.text = @"支付宝";
    nameLabel.backgroundColor = [UIColor clearColor];
    nameLabel.textColor = [UIColor blackColor];
    [backView addSubview:nameLabel];
    [nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@0);
        make.left.equalTo(@10);
        make.height.equalTo(@70);
    }];
    
    UILabel *aliAccountLabel = [[UILabel alloc] init];
    aliAccountLabel.text = [GlobalManager sharedManager].userInfoData.userAliAccount;
    aliAccountLabel.textColor = [UIColor grayColor];
    aliAccountLabel.font = [UIFont systemFontOfSize:16];
    aliAccountLabel.textAlignment = NSTextAlignmentCenter;
    [backView addSubview:aliAccountLabel];
    [aliAccountLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(nameLabel.mas_centerY);
        make.left.equalTo(@100);
    }];
    
    // 分割线
    UIView *breakView = [[UIView alloc] initWithFrame:CGRectMake(0, 69.5, SCREEN_WIDTH, 0.5)];
    breakView.backgroundColor = [UIColor lightGrayColor];
    [backView addSubview:breakView];
    
    UILabel *withdrawLabel = [[UILabel alloc] init];
    withdrawLabel.backgroundColor = [UIColor clearColor];
    withdrawLabel.text = @"提现金额";
    withdrawLabel.textColor = [UIColor blackColor];
    [backView addSubview:withdrawLabel];
    [withdrawLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(breakView.mas_bottom);
        make.left.equalTo(@10);
        make.height.equalTo(@70);
    }];

    
    UITextField *moneyTextField = [[UITextField alloc] init];
    moneyTextField.backgroundColor = [UIColor clearColor];
    moneyTextField.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"请输入提现金额" attributes:@{NSForegroundColorAttributeName:[UIColor grayColor] ,NSFontAttributeName:PlaceTextFont}];
    moneyTextField.clearButtonMode = UITextFieldViewModeWhileEditing;
    moneyTextField.returnKeyType = UIReturnKeyNext;
    moneyTextField.textColor = [UIColor blackColor];
    moneyTextField.delegate = self;
    [backView addSubview:moneyTextField];
    self.moneyTextField = moneyTextField;
    [moneyTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(withdrawLabel.mas_centerY);
        make.left.equalTo(@100);
        make.width.equalTo(@250);
        make.height.equalTo(@70);
    }];
    
    
    UILabel *contentLabel = [[UILabel alloc] init];
    contentLabel.backgroundColor = [UIColor clearColor];
    contentLabel.font = [UIFont systemFontOfSize:12];
    NSString *balanceStr = [NSString stringWithFormat:@"可提现金额：%@，提现成功后24小时内到账", self.balanceString];
    contentLabel.text = balanceStr;
    contentLabel.textColor = [UIColor orangeColor];
    contentLabel.textAlignment = NSTextAlignmentRight;
    [self.view addSubview:contentLabel];
    [contentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(backView.mas_bottom).offset(15);
        make.right.equalTo(self.view.mas_right).offset(-10);
    }];
    
    UIButton *submitBtn = [UIButton buttonWithTitle:@"提现"
                                        normalColor:CustomGreen
                                   highlightedColor:CustomGreen
                                          titleFont:[UIFont systemFontOfSize:16]
                                          imageName:nil
                                      backImageName:nil
                                             target:self
                                             action:@selector(showPayAlert)];
    submitBtn.frame = CGRectMake(10, 220, SCREEN_WIDTH - 20, 40);
    submitBtn.backgroundColor = [UIColor lightTextColor];
    submitBtn.layer.cornerRadius = 5.0;
    submitBtn.layer.masksToBounds = YES;
    [self.view addSubview:submitBtn];
}

- (void)withdrawPassWord:(NSString *)password{
        WithdrawRequest *withdrawRequest = [[WithdrawRequest alloc] init];
        [withdrawRequest setParametersWithUserId:[GlobalManager sharedManager].userInfoData.userId payPassword:password money:_moneyTextField.text];
        [withdrawRequest setSuccessBlock:^(id object, id responseObject) {
                        
            [SVProgressHUD showErrorWithStatus:@"提现成功"];
            [SVProgressHUD setDefaultMaskType:SVProgressHUDMaskTypeBlack];
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                [SVProgressHUD dismiss];
            });

            
        }];
        
        [withdrawRequest setFailureBlock:^(NSInteger errorCode, id responseObject) {
            
            DLog(@"-----获取失败");
            [SVProgressHUD showErrorWithStatus:@"提现失败"];
            [SVProgressHUD setDefaultMaskType:SVProgressHUDMaskTypeBlack];
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                [SVProgressHUD dismiss];
            });
            
        }];
        [withdrawRequest sendRequest];
}

-(void)showPayAlert{
    if (_moneyTextField.text.floatValue<=_balanceString.floatValue
        && _moneyTextField.text.floatValue>0){
    UIAlertController *alertController =
    [UIAlertController alertControllerWithTitle:@"请输入支付密码"
                                        message:nil
                                 preferredStyle:UIAlertControllerStyleAlert ];
    
    //添加取消到UIAlertController中
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleDefault handler:nil];
    
    //添加确定到UIAlertController中
    UIAlertAction *OKAction = [UIAlertAction actionWithTitle:@"认证" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        UITextField *textField = alertController.textFields[0];
        if (![Tools iSNull:textField.text]) {
            [self withdrawPassWord:textField.text];
        }
    }];
    [alertController addAction:cancelAction];
    [alertController addAction:OKAction];
    [alertController addTextFieldWithConfigurationHandler:^(UITextField *textField){
        textField.placeholder = @"请输入支付密码";
        textField.secureTextEntry = YES;
    }];
    [self presentViewController:alertController animated:YES completion:nil];
        
    }else{
        [SVProgressHUD showErrorWithStatus:@"不能超过可提现金额"];
        [SVProgressHUD setDefaultMaskType:SVProgressHUDMaskTypeBlack];
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [SVProgressHUD dismiss];
        });
    }
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
