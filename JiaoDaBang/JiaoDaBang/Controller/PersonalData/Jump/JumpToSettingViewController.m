//
//  JumpToSettingViewController.m
//  页面
//
//  Created by apple on 17/3/5.
//  Copyright © 2017年 Sunjiandong. All rights reserved.
//
#import "JumpToSettingViewController.h"

@interface JumpToSettingViewController ()<UITextViewDelegate>
@property (nonatomic, strong) UITextView *textView;

@property (nonatomic, strong) UILabel *titleLabel;

@property (nonatomic, strong) UIButton *submitButton;
@end

@implementation JumpToSettingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = RGB(210, 210, 210);
    self.textView.delegate = self;
    // Do any additional setup after loading the view.
//    //消除影响（iOS7 如果把UIscrollView 加在导航中一般内容会向下走64）
//    self.automaticallyAdjustsScrollViewInsets = NO;
    // 设置头
    if ([self.num isEqualToString:@"1"]) {
        self.title = @"昵称";
    }else if ([self.num isEqualToString:@"2"]) {
        self.title = @"手机号";
    }else if ([self.num isEqualToString:@"4"]) {
        self.title = @"学校";
    }else if ([self.num isEqualToString:@"5"]) {
        self.title = @"我的常用地址";
    }
    [self addView];
}

- (void)addView {
    // 标题
    _titleLabel = [UILabel new];
    if ([self.num isEqualToString:@"1"]) {
        _titleLabel.text = @"昵称";
    }else if ([self.num isEqualToString:@"2"]) {
        _titleLabel.text = @"手机号";
    }else if ([self.num isEqualToString:@"4"]) {
        _titleLabel.text = @"学校";
    }else if ([self.num isEqualToString:@"5"]) {
        _titleLabel.text = @"我的常用地址";
    }
    [self.view addSubview:_titleLabel];
    [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view.mas_top).offset(15);
        make.left.equalTo(self.view.mas_left).offset(20);
        make.height.equalTo(@21);
    }];
    
    // 输入框
    _textView = [UITextView new];
    //设置是否可以编辑
    _textView.editable = YES;
    //设置是否可以滚动
    _textView.scrollEnabled = NO;
    _textView.layer.masksToBounds = YES;
    _textView.layer.cornerRadius = 5;
    [self.view addSubview:_textView];
    [_textView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_titleLabel.mas_bottom).offset(8);
        make.left.equalTo(self.view.mas_left).offset(20);
        make.right.equalTo(self.view.mas_right).offset(-20);
        make.height.equalTo(@100);
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
        make.top.equalTo(_textView.mas_bottom).offset(35);
        make.left.equalTo(self.view.mas_left).offset(30);
        make.right.equalTo(self.view.mas_right).offset(-30);
        make.height.equalTo(@40);
    }];
}

// 提交按钮
- (void)submitButtonClick:(UIButton *)sender {
    if (_textView.text.length == 0) {
//        [MBProgressHUD showError:@"输入不能为空"];
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
