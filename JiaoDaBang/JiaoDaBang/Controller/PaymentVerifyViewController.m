//
//  PaymentVerifyViewController.m
//  JiaoDaBang
//
//  Created by Heaven on 06/04/2017.
//  Copyright © 2017 Heaven. All rights reserved.
//

#import "PaymentVerifyViewController.h"

@interface PaymentVerifyViewController ()


@property (nonatomic, weak) UITextField *userNameTextField;
@property (nonatomic, weak) UITextField *aliAccountTextField;

@end

@implementation PaymentVerifyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"认证";
    self.view.backgroundColor = [UIColor colorWithHexString:@"#fafafa"];
    [self setupUI];
}

- (void)setupUI{
    
    UIView *backView = [[UIView alloc] initWithFrame:CGRectMake(0, 20, SCREEN_WIDTH, 140)];
    backView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:backView];
    
    UILabel *nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 15, 60,40)];
    nameLabel.text = @"姓名";
    nameLabel.backgroundColor = [UIColor clearColor];
    nameLabel.textColor = [UIColor blackColor];
    [backView addSubview:nameLabel];
    
    UITextField *userNameTextField = [[UITextField alloc] init];
    userNameTextField.backgroundColor = [UIColor clearColor];
    userNameTextField.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"请输入姓名" attributes:@{NSForegroundColorAttributeName:[UIColor grayColor] ,NSFontAttributeName:PlaceTextFont}];
    userNameTextField.clearButtonMode = UITextFieldViewModeWhileEditing;
    userNameTextField.returnKeyType = UIReturnKeyNext;
    userNameTextField.textColor = [UIColor blackColor];
    userNameTextField.delegate = self;
    [self.view addSubview:userNameTextField];
    self.userNameTextField = userNameTextField;
    [userNameTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(nameLabel.mas_centerY);
        make.left.equalTo(nameLabel.mas_right).offset(5);
        make.width.equalTo(@250);
        make.height.equalTo(@70);
    }];
    
    // 分割线
    UIView *breakView = [[UIView alloc] initWithFrame:CGRectMake(0, 69.5, SCREEN_WIDTH, 0.5)];
    breakView.backgroundColor = [UIColor lightGrayColor];
    [backView addSubview:breakView];
    
    UILabel *aliLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 84, 60,40)];
    aliLabel.backgroundColor = [UIColor clearColor];
    aliLabel.text = @"支付宝";
    aliLabel.textColor = [UIColor blackColor];
    [backView addSubview:aliLabel];
    
    UITextField *aliAccountTextField = [[UITextField alloc] init];
    aliAccountTextField.backgroundColor = [UIColor clearColor];
    aliAccountTextField.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"请输入支付宝" attributes:@{NSForegroundColorAttributeName:[UIColor grayColor] ,NSFontAttributeName:PlaceTextFont}];
    aliAccountTextField.clearButtonMode = UITextFieldViewModeWhileEditing;
    aliAccountTextField.returnKeyType = UIReturnKeyNext;
    aliAccountTextField.textColor = [UIColor blackColor];
    aliAccountTextField.delegate = self;
    [self.view addSubview:aliAccountTextField];
    self.aliAccountTextField = aliAccountTextField;
    [aliAccountTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(aliLabel.mas_centerY);
        make.left.equalTo(aliLabel.mas_right).offset(5);
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
    
    if (![Tools iSNull:[GlobalManager sharedManager].userInfoData.userAliAccount]) {
        userNameTextField.enabled = NO;
        aliAccountTextField.enabled = NO;
        submitBtn.hidden = YES;
        userNameTextField.text = [GlobalManager sharedManager].userInfoData.userRealName;
        aliAccountTextField.text = [GlobalManager sharedManager].userInfoData.userAliAccount;


    }else {
        userNameTextField.enabled = YES;
        aliAccountTextField.enabled = YES;
        submitBtn.hidden = NO;
    }
}

- (void)verifyOperation {
    UserInfoSetRequest *request = [[UserInfoSetRequest alloc] init];
    [request setParametersWithUserId:[GlobalManager sharedManager].userId userNameString:self.userNameTextField.text aliAccountString:self.aliAccountTextField.text];
    [request setSuccessBlock:^(id object, id responseObject) {
        DLog(@"-------认证支付宝成功-------");

        [self.navigationController popViewControllerAnimated:YES];

    }];
    [request setFailureBlock:^(NSInteger errorCode, id responseObject) {
        
        DLog(@"-------认证支付宝失败-------");
    }];
    [request sendRequest];
    
    
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
