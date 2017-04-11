//
//  ChangeUserPasswordViewController.m
//  JiaoDaBang
//
//  Created by ott001 on 2017/4/8.
//  Copyright © 2017年 Heaven. All rights reserved.
//

#import "ChangeUserPasswordViewController.h"
#import "InfoInputView.h"

@interface ChangeUserPasswordViewController () <UIScrollViewDelegate>

// 滚动视图
@property (nonatomic, weak) UIScrollView *scrollView;
@property (nonatomic, weak) InfoInputView *oldPassWord;          // 旧密码
@property (nonatomic, weak) InfoInputView *passWord;             // 新密码
@property (nonatomic, weak) InfoInputView *repassWord;           // 确认密码


@end

@implementation ChangeUserPasswordViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"修改密码";
    self.view.backgroundColor = [UIColor colorWithHexString:@"#fafafa"];
    [self setupUI];
}

- (void)setupUI{
    __weak typeof(self) weakSelf = self;
    
    UIScrollView *scrollView = [[UIScrollView alloc] init];
    scrollView.backgroundColor = [UIColor whiteColor];
    scrollView.delegate = self;
    scrollView.contentSize = CGSizeMake(0, SCREEN_HEIGHT);
    [self.view addSubview:scrollView];
    [scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(weakSelf.view);
    }];
    self.scrollView = scrollView;
    
    InfoInputView *oldPassWord = [[InfoInputView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 50) placeHolder:@"旧密码" secureType:1 keyboardType:0];
    self.oldPassWord = oldPassWord;
    [self.view addSubview:oldPassWord];
    
    InfoInputView *passWord = [[InfoInputView alloc] initWithFrame:CGRectMake(0, 50, SCREEN_WIDTH, 50) placeHolder:@"新密码" secureType:1 keyboardType:0];
    self.passWord = passWord;
    [self.view addSubview:passWord];
    
    InfoInputView *repassWord = [[InfoInputView alloc] initWithFrame:CGRectMake(0, 100, SCREEN_WIDTH, 50) placeHolder:@"确认密码" secureType:0 keyboardType:0];
    self.repassWord = repassWord;
    [self.view addSubview:repassWord];
    
    UIButton *confirmBtn = [UIButton buttonWithTitle:@"确定"
                                         normalColor:CustomGreen
                                    highlightedColor:CustomGreen
                                           titleFont:[UIFont systemFontOfSize:16]
                                           imageName:nil
                                       backImageName:nil
                                              target:self
                                              action:@selector(confirmBtnDidClicked)];
    confirmBtn.frame = CGRectMake(10, repassWord.yt_bottom + 20, SCREEN_WIDTH - 20, 40);
    confirmBtn.backgroundColor = [UIColor lightTextColor];
    confirmBtn.layer.cornerRadius = 5.0;
    confirmBtn.layer.masksToBounds = YES;
    [self.view addSubview:confirmBtn];


}

// 确认
- (void)confirmBtnDidClicked {
    
    // 收起键盘
//    [self.view endEditing:YES];
    
    // 检测状态
    //    if (![self isValidRegisterInput]) {return;}
    
//    [SVProgressHUD show];
//    [SVProgressHUD setDefaultMaskType:SVProgressHUDMaskTypeBlack];
//    
//    UserChangeRequest *request = [[UserChangeRequest alloc] init];
//    [request setParametersWithToken:[GlobalManager sharedManager].token oldPassWord:self.oldPassWord.contentString passWord:self.passWord.contentString rePassWord:self.repassWord.contentString];
//    [request setSuccessBlock:^(id object, id responseObject) {
//        UserLoginData *data = object;
//        [self getUserinfoWithToken:data.token];
//    }];
//    [request setFailureBlock:^(NSInteger errorCode, id responseObject) {
//        [SVProgressHUD dismiss];
//        
//        if (errorCode == 100001) {
//            [self showAlertWithTitle:@"提示" message:@"原始密码输入错误"];
//        } else if (errorCode == 20005) {
//            [self showAlertWithTitle:@"提示" message:@"两次密码输入不一致"];
//        } else if (errorCode == 20012) {
//            [self showAlertWithTitle:@"提示" message:@"系统繁忙 请稍后再试"];
//        } else {
//            [Tools alterWithNoNetwork];
//        }
//    }];
//    [request sendRequest];
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
