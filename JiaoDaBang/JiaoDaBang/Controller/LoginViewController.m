//
//  LoginViewController.m
//  JiaoDaBang
//
//  Created by Heaven on 2017/1/12.
//  Copyright © 2017年 Heaven. All rights reserved.
//

#import "LoginViewController.h"
#import "RegisterViewController.h"

@interface LoginViewController () <UITextFieldDelegate, UIScrollViewDelegate>

@property (nonatomic, weak) UITextField *phoneTextField;
@property (nonatomic, weak) UITextField *passwordTextField;

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

//    self.navigationController.navigationBarHidden = YES;

    self.title = @"登陆";
    self.view.backgroundColor = [UIColor colorWithHexString:@"#fafafa"];
    
    [self placeSubviews];
}

- (void)placeSubviews {

    [self setupUI];
}

/// 设置导航栏
- (void)setupNavigationBar {
    
    // 1. 左按钮
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem barButtonWithTitle:nil
                                                                      titleFont:[UIFont systemFontOfSize:16]
                                                                     titleColor:[UIColor whiteColor]
                                                                      imageName:@"btn_close"
                                                                         target:self
                                                                         action:@selector(leftBarButtonItemDidClicked)];
}

/// 搭建UI
- (void)setupUI {
    
    __weak typeof(self) weakSelf = self;
    
//    UILabel *titleLabel = [[UILabel alloc] init];
//    titleLabel.textAlignment = NSTextAlignmentCenter;
//    titleLabel.font = [UIFont systemFontOfSize:16];
//    titleLabel.text = @"登陆";
//    titleLabel.textColor = [UIColor whiteColor];
//    [self.view addSubview:titleLabel];
//    [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.centerX.equalTo(weakSelf.view.mas_centerX);
//        make.top.equalTo(weakSelf.view.mas_top).offset(27);
//    }];
    
    UIScrollView *scrollView = [[UIScrollView alloc] init];
    scrollView.backgroundColor = [UIColor clearColor];
    scrollView.delegate = self;
    scrollView.contentSize = CGSizeMake(0, SCREEN_HEIGHT);
    [self.view addSubview:scrollView];
    [scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(weakSelf.view);
    }];
    
    UIView *backView = [[UIView alloc] initWithFrame:CGRectMake(0, 100, SCREEN_WIDTH, 120)];
    backView.backgroundColor = [UIColor whiteColor];
    [scrollView addSubview:backView];

    // logo
    UIImageView *logoImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"logo_login"]];
    logoImageView.yt_top = self.view.yt_top + 30;
    logoImageView.yt_centerX = self.view.yt_centerX;
    [self.view addSubview:logoImageView];
    
    // 电话
//    UITextField *phoneTextField = [[UITextField alloc] initWithFrame:CGRectMake(10, logoImageView.yt_bottom +20, SCREEN_WIDTH-20, 40)];
    UITextField *phoneTextField = [[UITextField alloc] initWithFrame:CGRectMake(10, 120, SCREEN_WIDTH-20, 40)];

    phoneTextField.tag = 200001;
    phoneTextField.backgroundColor = [UIColor clearColor];
    phoneTextField.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"请输入您的电话号码" attributes:@{NSForegroundColorAttributeName:CustomGreen ,NSFontAttributeName:PlaceTextFont}];
    phoneTextField.keyboardType = UIKeyboardTypePhonePad;
    phoneTextField.clearButtonMode = UITextFieldViewModeWhileEditing;
    phoneTextField.returnKeyType = UIReturnKeyNext;
    phoneTextField.textColor = CustomGreen;
    phoneTextField.delegate = self;
    [self.view addSubview:phoneTextField];
    self.phoneTextField = phoneTextField;
    
    // 分割线
    UIView *linephone = [[UIView alloc] initWithFrame:CGRectMake(5, 0, SCREEN_WIDTH-10, 1)];
    linephone.backgroundColor = [UIColor lightGrayColor];
    linephone.yt_top = phoneTextField.yt_bottom;
    [self.view addSubview:linephone];
    
    // 密码
    UITextField *passwordTextField = [[UITextField alloc] initWithFrame:CGRectMake(10, phoneTextField.yt_bottom+20, SCREEN_WIDTH-20, 40)];
    passwordTextField.tag = 200002;
    passwordTextField.backgroundColor = [UIColor clearColor];
    passwordTextField.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"请输入您的密码" attributes:@{NSForegroundColorAttributeName:CustomGreen ,NSFontAttributeName:PlaceTextFont}];
    passwordTextField.secureTextEntry = YES;
    passwordTextField.clearButtonMode = UITextFieldViewModeWhileEditing;
    passwordTextField.returnKeyType = UIReturnKeyGo;
    passwordTextField.textColor = CustomGreen;
    passwordTextField.delegate = self;
    [self.view addSubview:passwordTextField];
    self.passwordTextField = passwordTextField;
    
    // 分割线
    UIView *linePass = [[UIView alloc] initWithFrame:CGRectMake(5, 0, SCREEN_WIDTH-10, 1)];
    linePass.backgroundColor = [UIColor lightGrayColor];
    linePass.yt_top = passwordTextField.yt_bottom;
    [self.view addSubview:linePass];
    
    UIButton *loginBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    loginBtn.frame = CGRectMake(10, passwordTextField.yt_bottom+20, SCREEN_WIDTH - 20, 40);
    loginBtn.backgroundColor = [UIColor whiteColor];
    [loginBtn setTitleColor:CustomGreen forState:UIControlStateNormal];
    loginBtn.titleLabel.font = [UIFont systemFontOfSize:16.0];
    loginBtn.layer.cornerRadius = 20.0;
    loginBtn.layer.masksToBounds = YES;
    [loginBtn setTitle:@"登录" forState:UIControlStateNormal];
    [loginBtn addTarget:self action:@selector(loginBtnDidClicked) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:loginBtn];
    
    // 分割线
    UIView *breakView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 1, 12)];
    breakView.backgroundColor = CustomGreen;
    breakView.yt_top = loginBtn.yt_bottom +20;
    breakView.yt_centerX = loginBtn.yt_centerX;
    [self.view addSubview:breakView];
    
    // 注册
    UIButton *registerBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [registerBtn addTarget:self action:@selector(registerBtnDidClicked) forControlEvents:UIControlEventTouchUpInside];
    [registerBtn setTitleColor:CustomGreen forState:UIControlStateNormal];
    [registerBtn setTitle:@"用户注册" forState:UIControlStateNormal];
    registerBtn.titleLabel.font = [UIFont systemFontOfSize:12.0];
    [self.view addSubview:registerBtn];
    [registerBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(breakView.mas_centerY);
        make.right.equalTo(breakView.mas_left).offset(-10);
    }];
    
    // 忘记密码
    UIButton *forgetPassBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [forgetPassBtn addTarget:self action:@selector(forgetPassBtnDidClicked) forControlEvents:UIControlEventTouchUpInside];
    [forgetPassBtn setTitleColor:CustomGreen forState:UIControlStateNormal];
    [forgetPassBtn setTitle:@"忘记密码" forState:UIControlStateNormal];
    forgetPassBtn.titleLabel.font = [UIFont systemFontOfSize:12.0];
    [self.view addSubview:forgetPassBtn];
    [forgetPassBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(breakView.mas_centerY);
        make.left.equalTo(breakView.mas_right).offset(10);
    }];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    if (textField == self.phoneTextField) {
        [self.passwordTextField becomeFirstResponder];
    } else if (textField == self.passwordTextField) {
        [self loginBtnDidClicked];
    }
    [self.view endEditing:YES];
    return YES;
}

// 登录
- (void)loginBtnDidClicked {
    
    // 收起键盘
    [self.view endEditing:YES];
    
    // 检测状态
    if (![self isValidRegisterInput]) {return;}
    
    UserLoginRequest *request = [[UserLoginRequest alloc] init];
//    [request setParametersWithUserName:@"15311437664" passWord:@"123456"];
    [request setParametersWithUserName:self.phoneTextField.text passWord:self.passwordTextField.text];

    [request setSuccessBlock:^(id object, id responseObject) {
        DLog(@"-----用户登录成功");

        [[GlobalManager sharedManager] loginSuccessedWithUserInfo:object];

        [self leftBarButtonItemDidClicked];
    }];
    [request setFailureBlock:^(NSInteger errorCode, id responseObject) {
        DLog(@"-----用户登录失败");
        
        NSDictionary *dataDic = (NSDictionary *)responseObject;
        
        NSString *infoStr = [dataDic objectForKeySafe:@"info"];
        
        [SVProgressHUD showWithStatus:infoStr];
        [SVProgressHUD dismissWithDelay:1.5];

    }];
    [request sendRequest];
}

- (void)textFieldChange {
}

- (void)showAlertWithTitle:(NSString *)title message:(NSString *)message {
    
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *action = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
    }];
    
    [alertController addAction:action];
    
    [self presentViewController:alertController animated:YES completion:nil];
}

// 注册
- (void)registerBtnDidClicked {
    RegisterViewController *registerVC = [[RegisterViewController alloc] init];
    [self.navigationController pushViewController:registerVC animated:YES];
}

// 忘记密码
- (void)forgetPassBtnDidClicked {
    RegisterViewController *registerVC = [[RegisterViewController alloc] init];
    [self.navigationController pushViewController:registerVC animated:YES];
}

// 关闭页面
- (void)leftBarButtonItemDidClicked {
    
    [self.view endEditing:YES];
    [self dismissViewControllerAnimated:YES completion:nil];
}

// 检测输入内容
- (BOOL)isValidRegisterInput {
    
    BOOL isPhoneNum = self.phoneTextField.text.isMobileNumber;
    
    if (!isPhoneNum) {
        [SVProgressHUD showErrorWithStatus:@"请输入11位正确手机号码"];
        [SVProgressHUD setDefaultMaskType:SVProgressHUDMaskTypeBlack];
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [SVProgressHUD dismiss];
        });
        return NO;
    }
    if ([Tools iSNull:self.passwordTextField.text]) {
        [SVProgressHUD showErrorWithStatus:@"密码不能为空"];
        [SVProgressHUD setDefaultMaskType:SVProgressHUDMaskTypeBlack];
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [SVProgressHUD dismiss];
        });
        return NO;
    }
    return YES;
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    [self.view endEditing:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
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
