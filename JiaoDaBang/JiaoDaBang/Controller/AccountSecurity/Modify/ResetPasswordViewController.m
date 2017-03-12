//
//  ResetPasswordViewController.m
//  页面
//
//  Created by apple on 17/3/5.
//  Copyright © 2017年 Sunjiandong. All rights reserved.
//

#import "ResetPasswordViewController.h"

@interface ResetPasswordViewController ()<UITextFieldDelegate>
// 手机号
@property (nonatomic, strong) UITextField *phoneNumber;
// 第一次新密码
@property (nonatomic, strong) UITextField *passwordOne;
// 第二次新密码
@property (nonatomic, strong) UITextField *passwordTwo;
// 验证码输入
@property (nonatomic, strong) UITextField *code;
// 获取验证码按钮
@property (nonatomic, strong) UIButton *codeButton;
// 提交
@property (nonatomic, strong) UIButton *submitButton;
@end

@implementation ResetPasswordViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = RGB(210, 210, 210);
    [self addView];
}

- (void)addView {
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(MAIN_SCREEN_WIDTH / 2 - 150, 25, 300, 150)];
    view.backgroundColor = [UIColor whiteColor];
    view.layer.masksToBounds = YES;
    view.layer.cornerRadius = 5;
    [self.view addSubview:view];
    
    // 手机号的输入
    _phoneNumber = [UITextField new];
    _phoneNumber.delegate = self;
    //设置边框样式
    _phoneNumber.borderStyle = UITextBorderStyleNone;
    //输入框中是否有个叉号
    _phoneNumber.clearButtonMode = UITextFieldViewModeWhileEditing;
    // 水印
    _phoneNumber.placeholder = @"请输入手机号";
    [view addSubview:_phoneNumber];
    [_phoneNumber mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(view.mas_top).offset(10);
        make.left.equalTo(view.mas_left).offset(0);
        make.right.equalTo(view.mas_right).offset(0);
        make.height.equalTo(@21);
    }];
    
    // 分割线
    UIView *fenGe1 = [UIView new];
    fenGe1.backgroundColor = [UIColor blackColor];
    [view addSubview:fenGe1];
    [fenGe1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_phoneNumber.mas_bottom).offset(5);
        make.left.equalTo(view.mas_left).offset(0);
        make.right.equalTo(view.mas_right).offset(0);
        make.height.equalTo(@1);
    }];
    
    // 第一次密码的输入
    _passwordOne = [UITextField new];
    _passwordOne.delegate = self;
    //设置边框样式
    _passwordOne.borderStyle = UITextBorderStyleNone;
    //输入框中是否有个叉号
    _passwordOne.clearButtonMode = UITextFieldViewModeWhileEditing;
    // 水印
    _passwordOne.placeholder = @"请输入密码";
    [view addSubview:_passwordOne];
    [_passwordOne mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(fenGe1.mas_top).offset(10);
        make.left.equalTo(view.mas_left).offset(0);
        make.right.equalTo(view.mas_right).offset(0);
        make.height.equalTo(@21);
    }];
    
    // 分割线
    UIView *fenGe2 = [UIView new];
    fenGe2.backgroundColor = [UIColor blackColor];
    [view addSubview:fenGe2];
    [fenGe2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_passwordOne.mas_bottom).offset(5);
        make.left.equalTo(view.mas_left).offset(0);
        make.right.equalTo(view.mas_right).offset(0);
        make.height.equalTo(@1);
    }];
    
    // 第二次密码的输入
    _passwordTwo = [UITextField new];
    _passwordTwo.delegate = self;
    //设置边框样式
    _passwordTwo.borderStyle = UITextBorderStyleNone;
    //输入框中是否有个叉号
    _passwordTwo.clearButtonMode = UITextFieldViewModeWhileEditing;
    // 水印
    _passwordTwo.placeholder = @"请确认密码";
    [view addSubview:_passwordTwo];
    [_passwordTwo mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(fenGe2.mas_top).offset(10);
        make.left.equalTo(view.mas_left).offset(0);
        make.right.equalTo(view.mas_right).offset(0);
        make.height.equalTo(@21);
    }];
    
    // 分割线
    UIView *fenGe3 = [UIView new];
    fenGe3.backgroundColor = [UIColor blackColor];
    [view addSubview:fenGe3];
    [fenGe3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_passwordTwo.mas_bottom).offset(5);
        make.left.equalTo(view.mas_left).offset(0);
        make.right.equalTo(view.mas_right).offset(0);
        make.height.equalTo(@1);
    }];
    
    // 验证码
    _code = [UITextField new];
    _code.delegate = self;
    //设置边框样式
    _code.borderStyle = UITextBorderStyleNone;
    //输入框中是否有个叉号
    _code.clearButtonMode = UITextFieldViewModeWhileEditing;
    // 水印
    _code.placeholder = @"请输入验证码";
    [view addSubview:_code];
    [_code mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(fenGe3.mas_bottom).offset(10);
        make.left.equalTo(view.mas_left).offset(0);
        make.height.equalTo(@21);
        make.width.equalTo(@120);
    }];
    
    // 提交按钮
    _codeButton = [UIButton new];
    _codeButton.titleLabel.tintColor = [UIColor whiteColor];
    [_codeButton setTitle:@"获取验证码" forState:UIControlStateNormal];
    _codeButton.backgroundColor = RGB(140, 188, 23);
    _codeButton.layer.masksToBounds = YES;
    _codeButton.layer.cornerRadius = 5;
    [_codeButton addTarget:self action:@selector(getCodeButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_codeButton];
    [_codeButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(fenGe3.mas_bottom).offset(5);
        make.right.equalTo(view.mas_right).offset(0);
        make.height.equalTo(@30);
        make.width.equalTo(@130);
    }];
    
    // 提交按钮
    _submitButton = [UIButton new];
    _submitButton.titleLabel.tintColor = [UIColor whiteColor];
    [_submitButton setTitle:@"完成" forState:UIControlStateNormal];
    _submitButton.backgroundColor = RGB(140, 188, 23);
    _submitButton.layer.masksToBounds = YES;
    _submitButton.layer.cornerRadius = 5;
    [_submitButton addTarget:self action:@selector(submitButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_submitButton];
    [_submitButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(view.mas_bottom).offset(35);
        make.left.equalTo(self.view.mas_left).offset(30);
        make.right.equalTo(self.view.mas_right).offset(-30);
        make.height.equalTo(@40);
    }];
}

// 获取验证码
- (void)getCodeButtonClick:(UIButton *)sender {
    if (_phoneNumber.text.length == 0) {
//        [MBProgressHUD showError:@"请先输入手机号"];
        return;
    }
    if (_phoneNumber.text.length != 11) {
//        [MBProgressHUD showError:@"手机号输入有误"];
        return;
    }
    [_codeButton startTime];
}

// 完成按钮
- (void)submitButtonClick:(UIButton *)sender {
    if (_phoneNumber.text.length == 0) {
//        [MBProgressHUD showError:@"手机号不能为空"];
        return;
    }
    if (_passwordOne.text.length == 0 || _passwordTwo.text.length == 0) {
//        [MBProgressHUD showError:@"密码不能为空"];
        return;
    }
    if (_code.text.length == 0) {
//        [MBProgressHUD showError:@"验证码不能为空"];
        return;
    }
    [self.navigationController popToRootViewControllerAnimated:YES];
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
