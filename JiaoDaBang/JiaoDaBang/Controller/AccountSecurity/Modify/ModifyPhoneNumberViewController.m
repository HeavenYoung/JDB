//
//  ModifyPhoneNumberViewController.m
//  页面
//
//  Created by apple on 17/3/5.
//  Copyright © 2017年 Sunjiandong. All rights reserved.
//

#import "ModifyPhoneNumberViewController.h"
#import "NewPhoneNumberViewController.h"

@interface ModifyPhoneNumberViewController ()<UITextFieldDelegate>
// 旧的手机号
@property (nonatomic, strong) UITextField *oldPhoneNumberTextField;
// 验证码
@property (nonatomic, strong) UITextField *verificationCodeTextField;
// 获取验证码按钮
@property (nonatomic, strong) UIButton *codeButton;
// 提交按钮
@property (nonatomic, strong) UIButton *submitButton;
@end

@implementation ModifyPhoneNumberViewController

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
    UILabel *oldPhoneNumberLabel = [UILabel new];
    oldPhoneNumberLabel.text = @"旧手机号：";
    [view addSubview:oldPhoneNumberLabel];
    [oldPhoneNumberLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(view.mas_left).offset(20);
        make.top.equalTo(view.mas_top).offset(15);
        make.height.equalTo(@21);
        make.width.equalTo(@90);
    }];
    
    // 修改手机号的输入
    _oldPhoneNumberTextField = [UITextField new];
    _oldPhoneNumberTextField.delegate = self;
    //设置边框样式
    _oldPhoneNumberTextField.borderStyle = UITextBorderStyleNone;
    //输入框中是否有个叉号
    _oldPhoneNumberTextField.clearButtonMode = UITextFieldViewModeWhileEditing;
    // 水印
    _oldPhoneNumberTextField.placeholder = @"请输入手机号";
    [view addSubview:_oldPhoneNumberTextField];
    [_oldPhoneNumberTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(view.mas_top).offset(15);
        make.left.equalTo(oldPhoneNumberLabel.mas_right).offset(5);
        make.right.equalTo(view.mas_right).offset(-20);
        make.height.equalTo(@21);
    }];
    
    // 分割线
    UIView *fenGe = [UIView new];
    fenGe.backgroundColor = [UIColor blackColor];
    [view addSubview:fenGe];
    [fenGe mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_oldPhoneNumberTextField.mas_bottom).offset(10);
        make.left.equalTo(view.mas_left).offset(20);
        make.right.equalTo(view.mas_right).offset(-20);
        make.height.equalTo(@1);
    }];
    
    // 验证码
    _verificationCodeTextField = [UITextField new];
    _verificationCodeTextField.delegate = self;
    //设置边框样式
    _verificationCodeTextField.borderStyle = UITextBorderStyleNone;
    //输入框中是否有个叉号
    _verificationCodeTextField.clearButtonMode = UITextFieldViewModeWhileEditing;
    // 水印
    _verificationCodeTextField.placeholder = @"请输入验证码";
    [view addSubview:_verificationCodeTextField];
    [_verificationCodeTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(fenGe.mas_bottom).offset(15);
        make.left.equalTo(view.mas_left).offset(20);
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
        make.top.equalTo(fenGe.mas_bottom).offset(10);
        make.right.equalTo(view.mas_right).offset(-20);
        make.height.equalTo(@30);
        make.width.equalTo(@130);
    }];
    
    // 提交按钮
    _submitButton = [UIButton new];
    _submitButton.titleLabel.tintColor = [UIColor whiteColor];
    [_submitButton setTitle:@"下一步" forState:UIControlStateNormal];
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
    if (_oldPhoneNumberTextField.text.length == 0) {
//        [MBProgressHUD showError:@"请先输入手机号"];
        return;
    }
    if (_oldPhoneNumberTextField.text.length != 11) {
//        [MBProgressHUD showError:@"手机号输入有误"];
        return;
    }
    [_codeButton startTime];
}

// 提交按钮
- (void)submitButtonClick:(UIButton *)sender {
//    if (_verificationCodeTextField.text.length == 0) {
//        [MBProgressHUD showError:@"验证码不能为空"];
//        return;
//    }
    [self.navigationController pushViewController:[NewPhoneNumberViewController new] animated:YES];
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
