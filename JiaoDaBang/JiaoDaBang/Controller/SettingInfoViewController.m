//
//  SettingInfoViewController.m
//  JiaoDaBang
//
//  Created by Heaven on 07/04/2017.
//  Copyright © 2017 Heaven. All rights reserved.
//

#import "SettingInfoViewController.h"
static NSString *const kNickName = @"nickname";
static NSString *const kGender = @"sex";
static NSString *const kSchool = @"school";

@interface SettingInfoViewController () <UITextFieldDelegate>

@property (nonatomic, assign) SettingInfoType settingInfoType;

@property (nonatomic, strong) UITextField *textField;

@property (nonatomic, copy) NSString *contentString;

@property (nonatomic, copy) SettingInfoSuccessBlock successBlock;

@end

@implementation SettingInfoViewController

- (id)initWithInfoType:(SettingInfoType)settingInfoType contentString:(NSString *)contentString settingBlock:(SettingInfoSuccessBlock)block{

    self = [super init];
    if (self) {
        self.settingInfoType = settingInfoType;
        self.contentString = contentString;
        self.successBlock = block;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor colorWithHexString:@"#fafafa"];

    [self setupUI];
}

- (void)setupUI {

    UIView *backView = [[UIView alloc] initWithFrame:CGRectMake(0, 20, SCREEN_WIDTH, 40)];
    backView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:backView];
    
    UITextField *textField = [[UITextField alloc] initWithFrame:CGRectMake(10, 0, SCREEN_WIDTH-20, 40)];
    textField.backgroundColor = [UIColor whiteColor];
    textField.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"请输入内容" attributes:@{NSForegroundColorAttributeName:PlaceTextColor ,NSFontAttributeName:PlaceTextFont}];
    textField.keyboardType = UIKeyboardTypePhonePad;
    textField.clearButtonMode = UITextFieldViewModeWhileEditing;
    textField.returnKeyType = UIReturnKeyNext;
    textField.textColor = [UIColor blackColor];
    textField.text = self.contentString;
    textField.delegate = self;
    [backView addSubview:textField];
    self.textField = textField;

    // 按钮
    UIButton *submitBtn = [UIButton buttonWithTitle:@"确定"
                                        normalColor:CustomGreen
                                   highlightedColor:CustomGreen
                                          titleFont:[UIFont systemFontOfSize:16]
                                          imageName:nil
                                      backImageName:nil
                                             target:self
                                             action:@selector(submitBtnDidClicked)];
    submitBtn.frame = CGRectMake(10, textField.yt_bottom + 30, SCREEN_WIDTH - 20, 40);
    submitBtn.backgroundColor = [UIColor lightTextColor];
    submitBtn.layer.cornerRadius = 5.0;
    submitBtn.layer.masksToBounds = YES;
    [self.view addSubview:submitBtn];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {

    [self submitBtnDidClicked];
    
    return YES;
}

- (void)submitBtnDidClicked {

    if ([Tools iSNull:self.textField.text]) {
        
        
        
    } else {
    
        NSString *keyString = nil;
        
        switch (self.settingInfoType) {
            case SettingInfoTypeNickName: {
                keyString = kNickName;
            }
                break;
            case SettingInfoTypeGender: {
                keyString = kGender;
            }
            case SettingInfoTypeSchool: {
                keyString = kSchool;
            }
            default:
                break;
        }
        
        UserInfoSetRequest *request = [[UserInfoSetRequest alloc] init];
        [request setParametersWithUserId:[GlobalManager sharedManager].userId valueString:self.textField.text keyString:keyString];
        [request setSuccessBlock:^(id object, id responseObject) {
            
            [self.navigationController popViewControllerAnimated:YES];
            
            if (self.successBlock) {
                self.successBlock(self.textField.text);
            }
            
            UserInfoData *infoData = [GlobalManager sharedManager].userInfoData;
            
            switch (self.settingInfoType) {
                case SettingInfoTypeNickName: {
                    infoData.userNickName = kNickName;
                }
                    break;
                case SettingInfoTypeGender: {
                    infoData.userSex = kGender;
                }
                case SettingInfoTypeSchool: {
                    infoData.userSchool = kSchool;
                }
                default:
                    break;
            }
            [[GlobalManager sharedManager] loginSuccessedWithUserInfo:infoData];
            
        }];
        [request setFailureBlock:^(NSInteger errorCode, id responseObject) {
            
            DLog(@"-----修改失败------");
        }];
        [request sendRequest];
    }
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
