//
//  UserVerifyViewController.m
//  JiaoDaBang
//
//  Created by Heaven on 06/04/2017.
//  Copyright © 2017 Heaven. All rights reserved.
//

#import "UserVerifyViewController.h"
#import "InfoInputView.h"

@interface UserVerifyViewController ()

@property (nonatomic, weak) UITextField *userNameTextField;
@property (nonatomic, weak) UITextField *userNumberTextField;

@end

@implementation UserVerifyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"在校生认证";
    self.view.backgroundColor = [UIColor colorWithHexString:@"#fafafa"];
    [self setupUI];
}

- (void)setupUI{
    
    UIView *backView = [[UIView alloc] initWithFrame:CGRectMake(0, 20, SCREEN_WIDTH, 140)];
    backView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:backView];

    UIImageView *iconView = [[UIImageView alloc] initWithFrame:CGRectMake(5, 15, 40, 40)];
    iconView.backgroundColor = [UIColor randomColor];
    [backView addSubview:iconView];
    
    NSString *nameString = [GlobalManager sharedManager].userInfoData.userNickName ? [GlobalManager sharedManager].userInfoData.userNickName : [GlobalManager sharedManager].userInfoData.userName;
    
    UITextField *userNameTextField = [[UITextField alloc] init];
        userNameTextField.backgroundColor = [UIColor clearColor];
    userNameTextField.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"请输入名称" attributes:@{NSForegroundColorAttributeName:[UIColor grayColor] ,NSFontAttributeName:PlaceTextFont}];
    userNameTextField.clearButtonMode = UITextFieldViewModeWhileEditing;
    userNameTextField.returnKeyType = UIReturnKeyNext;
    userNameTextField.textColor = [UIColor blackColor];
    userNameTextField.delegate = self;
    userNameTextField.text = nameString;
    [self.view addSubview:userNameTextField];
    self.userNameTextField = userNameTextField;
    [userNameTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(iconView.mas_centerY);
        make.left.equalTo(iconView.mas_right).offset(5);
        make.width.equalTo(@250);
        make.height.equalTo(@70);
    }];
    
    // 分割线
    UIView *breakView = [[UIView alloc] initWithFrame:CGRectMake(0, 69.5, SCREEN_WIDTH, 0.5)];
    breakView.backgroundColor = [UIColor lightGrayColor];
    [backView addSubview:breakView];
    
    UIImageView *phoneView = [[UIImageView alloc] initWithFrame:CGRectMake(5, 85, 40, 40)];
    phoneView.backgroundColor = [UIColor randomColor];
    [backView addSubview:phoneView];
    
    UITextField *userNumberTextField = [[UITextField alloc] init];
    userNumberTextField.backgroundColor = [UIColor clearColor];
    userNumberTextField.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"请输入学生证号" attributes:@{NSForegroundColorAttributeName:[UIColor grayColor] ,NSFontAttributeName:PlaceTextFont}];
    userNumberTextField.clearButtonMode = UITextFieldViewModeWhileEditing;
    userNumberTextField.returnKeyType = UIReturnKeyDone;
    userNumberTextField.textColor = [UIColor blackColor];
    userNumberTextField.delegate = self;
    userNumberTextField.text = [GlobalManager sharedManager].userInfoData.userSchoolNum;
    [backView addSubview:userNumberTextField];
    self.userNumberTextField = userNumberTextField;
    [userNumberTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(phoneView.mas_centerY);
        make.left.equalTo(phoneView.mas_right).offset(5);
        make.width.equalTo(@250);
        make.height.equalTo(@70);
    }];

    // 按钮
    UIButton *submitBtn = [UIButton buttonWithTitle:@"认证"
                                        normalColor:CustomGreen
                                   highlightedColor:CustomGreen
                                          titleFont:[UIFont systemFontOfSize:16]
                                          imageName:nil
                                      backImageName:nil
                                             target:self
                                             action:@selector(verifyOperation)];
    submitBtn.frame = CGRectMake(10, 180, SCREEN_WIDTH - 20, 40);
    submitBtn.backgroundColor = [UIColor lightTextColor];
    submitBtn.layer.cornerRadius = 5.0;
    submitBtn.layer.masksToBounds = YES;
    [self.view addSubview:submitBtn];
    
    if ([[GlobalManager sharedManager].userInfoData.userType isEqualToString:@"1"]) {
        userNumberTextField.enabled = NO;
        userNameTextField.enabled = NO;
        submitBtn.enabled = NO;
    }

}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    if (textField == self.userNameTextField) {
        [self.userNumberTextField becomeFirstResponder];
    } else if (textField == self.userNumberTextField) {

        [self verifyOperation];
    }
    [self.view endEditing:YES];
    return YES;
}

- (void)verifyOperation {

    
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
