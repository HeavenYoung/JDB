//
//  NewPhoneNumberViewController.m
//  页面
//
//  Created by apple on 17/3/5.
//  Copyright © 2017年 Sunjiandong. All rights reserved.
//


#import "NewPhoneNumberViewController.h"

@interface NewPhoneNumberViewController ()<UITextFieldDelegate>

@property (nonatomic, strong) UITextField *phoneNumber;


@property (nonatomic, strong) UIButton *submitButton;
@end

@implementation NewPhoneNumberViewController

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
    
    UILabel *textPhone = [UILabel new];
    textPhone.text = @"新手机号";
    [view addSubview:textPhone];
    [textPhone mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(view.mas_left).offset(20);
        make.top.equalTo(view.mas_top).offset(15);
        make.height.equalTo(@21);
        make.width.equalTo(@90);
    }];
    
    // 修改手机号的输入
    _phoneNumber = [UITextField new];
    _phoneNumber.delegate = self;
    //设置边框样式
    _phoneNumber.borderStyle = UITextBorderStyleNone;
    //输入框中是否有个叉号
    _phoneNumber.clearButtonMode = UITextFieldViewModeWhileEditing;
    // 水印
    _phoneNumber.placeholder = @"请输入新的手机号";
    [view addSubview:_phoneNumber];
    [_phoneNumber mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(textPhone.mas_bottom).offset(15);
        make.left.equalTo(view.mas_left).offset(20);
        make.right.equalTo(view.mas_right).offset(-20);
        make.height.equalTo(@21);
    }];
    
    // 分割线
    UIView *fenGe = [UIView new];
    fenGe.backgroundColor = [UIColor blackColor];
    [view addSubview:fenGe];
    [fenGe mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_phoneNumber.mas_bottom).offset(5);
        make.left.equalTo(view.mas_left).offset(20);
        make.right.equalTo(view.mas_right).offset(-20);
        make.height.equalTo(@1);
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

// 提交按钮
- (void)submitButtonClick:(UIButton *)sender {
    if (_phoneNumber.text.length == 0) {
//        [MBProgressHUD showError:@"手机号不能为空"];
        return;
    }
    if (_phoneNumber.text.length != 11) {
//        [MBProgressHUD showError:@"手机号输入有误"];
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
