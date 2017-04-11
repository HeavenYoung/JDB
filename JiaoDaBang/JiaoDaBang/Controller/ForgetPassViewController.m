//
//  ForgetPassViewController.m
//  JiaoDaBang
//
//  Created by Heaven on 2017/2/14.
//  Copyright © 2017年 Heaven. All rights reserved.
//

#import "ForgetPassViewController.h"
#import "InfoInputView.h"

@interface ForgetPassViewController ()

// 滚动视图
@property (nonatomic, weak) UIScrollView *scrollView;
@property (nonatomic, weak) InfoInputView *phoneNumber;          // 电话号码
@property (nonatomic, weak) InfoInputView *messageCode;          // 短信验证码
@property (nonatomic, weak) InfoInputView *passWord;             // 密码
@property (nonatomic, weak) InfoInputView *repassWord;           // 确认密码


@end

@implementation ForgetPassViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor colorWithHexString:@"#fafafa"];
    
    self.title = @"找回密码";
    
    [self placeSubviews];
}

- (void)placeSubviews {
    __weak typeof(self) weakSelf = self;
    
    UIScrollView *scrollView = [[UIScrollView alloc] init];
    scrollView.backgroundColor = [UIColor colorWithHexString:@"#fafafa"];
    scrollView.delegate = self;
    scrollView.contentSize = CGSizeMake(0, SCREEN_HEIGHT - 44);
    [self.view addSubview:scrollView];
    [scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(weakSelf.view);
    }];
    self.scrollView = scrollView;
    
    UIView *backView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 200)];
    backView.backgroundColor = [UIColor whiteColor];
    [self.scrollView addSubview:backView];
    
    // 电话号码
    InfoInputView *phoneNumber = [[InfoInputView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 50) placeHolder:@"手机号码:" secureType:0 keyboardType:UIKeyboardTypePhonePad];
    phoneNumber.delegate = self;
    phoneNumber.backgroundColor = [UIColor clearColor];
    phoneNumber.tag = 101;
    self.phoneNumber = phoneNumber;
    [backView addSubview:phoneNumber];
    
    // 验证码
    InfoInputView *messageCode = [[InfoInputView alloc] initWithFrame:CGRectMake(0, 50, SCREEN_WIDTH - 90, 50) placeHolder:@"验证码:" secureType:0 keyboardType:UIKeyboardTypePhonePad];
    messageCode.delegate = self;
    messageCode.tag = 102;
    self.messageCode = messageCode;
    [backView addSubview:messageCode];
    
    UIButton *messageBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [messageBtn setTitle:@"获取验证码" forState:UIControlStateNormal];
    [messageBtn setTitleColor:CustomGreen forState:UIControlStateNormal];
    messageBtn.backgroundColor = [UIColor clearColor];
    messageBtn.layer.borderColor = CustomGreen.CGColor;
    messageBtn.layer.borderWidth = 1.0;
    messageBtn.layer.cornerRadius = 5;
    messageBtn.layer.masksToBounds = YES;
    messageBtn.titleLabel.font = [UIFont systemFontOfSize:14];
    [messageBtn addTarget:self action:@selector(messageBtnDidClicked:) forControlEvents:UIControlEventTouchUpInside];
    messageBtn.frame = CGRectMake(SCREEN_WIDTH - 90, 60, 80, 30);
    [backView addSubview:messageBtn];
    
    // 密码
    InfoInputView *passWord = [[InfoInputView alloc] initWithFrame:CGRectMake(0, 100, SCREEN_WIDTH, 50) placeHolder:@"登录密码:" secureType:1 keyboardType:0];
    passWord.delegate = self;
    passWord.tag = 104;
    self.passWord = passWord;
    [backView addSubview:passWord];
    
    // 重复密码
    InfoInputView *repassWord = [[InfoInputView alloc] initWithFrame:CGRectMake(0, 150, SCREEN_WIDTH, 50) placeHolder:@"确认密码:" secureType:1 keyboardType:0];
    repassWord.delegate = self;
    repassWord.tag = 105;
    self.repassWord = repassWord;
    [backView addSubview:repassWord];
    
    UIButton *registerBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    registerBtn.frame = CGRectMake(10, repassWord.yt_bottom+20, SCREEN_WIDTH - 20, 40);
    registerBtn.backgroundColor = [UIColor whiteColor];
    [registerBtn setTitleColor:CustomGreen forState:UIControlStateNormal];
    registerBtn.titleLabel.font = [UIFont systemFontOfSize:16.0];
    registerBtn.layer.cornerRadius = 20.0;
    registerBtn.layer.masksToBounds = YES;
    [registerBtn setTitle:@"立即找回" forState:UIControlStateNormal];
    [registerBtn addTarget:self action:@selector(getbackBtnDidClicked) forControlEvents:UIControlEventTouchUpInside];
    [backView addSubview:registerBtn];

}

// 注册按钮点击事件
- (void)getbackBtnDidClickedBtnDidClicked {
//    // 收起键盘
//    [self.view endEditing:YES];
//    
//    // 检测状态
//    if (![self isValidRegisterInput]) {return;}
//    
//    [SVProgressHUD show];
//    [SVProgressHUD setDefaultMaskType:SVProgressHUDMaskTypeBlack];
//    
//    UserRegisterRequest *request = [[UserRegisterRequest alloc] init];
//    [request setParametersWithPhoneNumber:self.phoneNumber.contentString password:self.passWord.contentString messageCode:self.messageCode.contentString];
//    [request setSuccessBlock:^(id object, id responseObject) {
//        
//        DLog(@"注册成功");
//        
//        [[NSUserDefaults standardUserDefaults] setObject:self.phoneNumber.contentString forKey:kUserAccount];
//        [[NSUserDefaults standardUserDefaults] setObject:self.passWord.contentString forKey:kUserPassword];
//        [[NSUserDefaults standardUserDefaults] synchronize];
//        
//        [[GlobalManager sharedManager] loginSuccessedWithUserInfo:object];
//        
//        [SVProgressHUD dismiss];
//        
//        [self.navigationController dismissViewControllerAnimated:YES completion:nil];
//        
//    }];
//    
//    [request setFailureBlock:^(NSInteger errorCode, id responseObject) {
//        DLog(@"注册失败");
//        
//        [SVProgressHUD dismiss];
//        
//        [Tools alterWithNoNetwork];
//    }];
//    [request sendRequest];
}

// 获取验证码
- (void)messageBtnDidClicked:(UIButton *)sender {
    
//    DLog(@"%@", self.phoneNumber.contentString);
//    
//    BOOL isPhoneNum = self.phoneNumber.contentString.isMobileNumber;
//    if (!isPhoneNum) {
//        [SVProgressHUD showErrorWithStatus:@"请输入11位正确手机号码"];
//        return;
//    }
//    
//    sender.userInteractionEnabled = NO;
//    
//    [Tools timerCountDown:60 completionBlock:^{
//        
//        sender.userInteractionEnabled = YES;
//        
//        [sender setTitle:@"获取验证码" forState:UIControlStateNormal];
//        
//    } isRunBlock:^(NSString *countDownSec) {
//        [sender setTitle:countDownSec forState:UIControlStateNormal];
//    }];
//    
//    //
//    UserMessageCodeRequest *request = [[UserMessageCodeRequest alloc] init];
//    [request setParametersWithPhoneNumber:self.phoneNumber.contentString];
//    [request setSuccessBlock:^(id object, id responseObject) {
//        DLog(@"验证码发送成功");
//    }];
//    [request setFailureBlock:^(NSInteger errorCode, id responseObject) {
//        DLog(@"验证码发送失败");
//    }];
//    [request sendRequest];
}

// 检测输入内容
- (BOOL)isValidRegisterInput {
    
    BOOL isPhoneNum = self.phoneNumber.contentString.isMobileNumber;
    BOOL isSamePassword = [_passWord.contentString isEqualToString:_repassWord.contentString];
    
    if (!isPhoneNum) {
        [SVProgressHUD showErrorWithStatus:@"请输入11位正确手机号码"];
        [SVProgressHUD setDefaultMaskType:SVProgressHUDMaskTypeBlack];
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [SVProgressHUD dismiss];
        });
        return NO;
    }
    if ([Tools iSNull:_passWord.contentString]) {
        [SVProgressHUD showErrorWithStatus:@"密码不能为空"];
        [SVProgressHUD setDefaultMaskType:SVProgressHUDMaskTypeBlack];
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [SVProgressHUD dismiss];
        });
        return NO;
    }
    if (!isSamePassword) {
        [SVProgressHUD showErrorWithStatus:@"两次密码不一致"];
        [SVProgressHUD setDefaultMaskType:SVProgressHUDMaskTypeBlack];
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [SVProgressHUD dismiss];
        });
        return NO;
    }
    if ([Tools iSNull:_messageCode.contentString]) {
        [SVProgressHUD showErrorWithStatus:@"验证码不能为空"];
        [SVProgressHUD setDefaultMaskType:SVProgressHUDMaskTypeBlack];
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [SVProgressHUD dismiss];
        });
        return NO;
    }
    return YES;
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
