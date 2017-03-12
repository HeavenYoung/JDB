//
//  ModifyNicknameViewController.m
//  页面
//
//  Created by apple on 17/3/4.
//  Copyright © 2017年 Sunjiandong. All rights reserved.
//



#import "ModifyNicknameViewController.h"
@interface ModifyNicknameViewController ()<UITextFieldDelegate>

@property (nonatomic, strong) UITextField *nickNmaeTextField;

@property (nonatomic, strong) UIButton *submitButton;

@end

@implementation ModifyNicknameViewController

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
    // 修改昵称的输入
    _nickNmaeTextField = [UITextField new];
    _nickNmaeTextField.delegate = self;
    //设置边框样式
    _nickNmaeTextField.borderStyle = UITextBorderStyleNone;
    //输入框中是否有个叉号
    _nickNmaeTextField.clearButtonMode = UITextFieldViewModeWhileEditing;
    // 水印
    _nickNmaeTextField.placeholder = @"请输入新的昵称";
    [view addSubview:_nickNmaeTextField];
    [_nickNmaeTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(view.mas_top).offset(10);
        make.left.equalTo(view.mas_left).offset(20);
        make.right.equalTo(view.mas_right).offset(-20);
        make.height.equalTo(@21);
    }];
    
    // 分割线
    UIView *fenGe = [UIView new];
    fenGe.backgroundColor = [UIColor blackColor];
    [view addSubview:fenGe];
    [fenGe mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_nickNmaeTextField.mas_bottom).offset(5);
        make.left.equalTo(view.mas_left).offset(20);
        make.right.equalTo(view.mas_right).offset(-20);
        make.height.equalTo(@1);
    }];
    
    // 说明
    UILabel *instructions = [UILabel new];
    instructions.text = [NSString stringWithFormat:@"说明：%@",@"还不知道说点什么！后续添加"];
    instructions.numberOfLines = 0;
    [view addSubview:instructions];
    [instructions mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(fenGe.mas_bottom).offset(0);
        make.left.equalTo(view.mas_left).offset(20);
        make.right.equalTo(view.mas_right).offset(-20);
        make.height.equalTo(@60);
    }];
    
    // 提交按钮
    _submitButton = [UIButton new];
    _submitButton.titleLabel.tintColor = [UIColor whiteColor];
    [_submitButton setTitle:@"提交" forState:UIControlStateNormal];
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
    if (_nickNmaeTextField.text.length == 0) {
//        [MBProgressHUD showError:@"昵称不能为空"];
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
