//
//  CertificationViewController.m
//  页面
//
//  Created by apple on 17/3/3.
//  Copyright © 2017年 Sunjiandong. All rights reserved.
//
#import "CertificationViewController.h"

@interface CertificationViewController ()<UITextViewDelegate>
// 姓名
@property (weak, nonatomic) IBOutlet UITextField *nameTextField;
// 学号
@property (weak, nonatomic) IBOutlet UITextField *StudentIdTextField;
// 班级
@property (weak, nonatomic) IBOutlet UITextField *classTextField;
// 学院
@property (weak, nonatomic) IBOutlet UITextField *collegeTexeField;
// 身份证
@property (weak, nonatomic) IBOutlet UITextField *cardIdTextField;
// 自拍上传
@property (weak, nonatomic) IBOutlet UIButton *takeButton;
// 简历上传
@property (weak, nonatomic) IBOutlet UIButton *resumeButton;


@end

@implementation CertificationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self buttonRoundedCornersCSS];
    
    // 右边提交
    UIButton *rightBtn = [[UIButton alloc] init];
    rightBtn.frame = CGRectMake(0, 0, 60, 25);
    rightBtn.titleLabel.tintColor = [UIColor whiteColor];
    [rightBtn setTitle:@"提交" forState:UIControlStateNormal];
    [rightBtn addTarget:self action:@selector(rightClick:) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:rightBtn];
}

// 右边按钮
- (void)rightClick:(UIButton *)sender {
    if (self.nameTextField.text.length == 0 || self.StudentIdTextField.text.length == 0 || self.classTextField.text.length == 0 || self.collegeTexeField.text.length == 0 || self.cardIdTextField.text.length == 0) {
//        [MBProgressHUD showError:@"以上信息必填不能为空"];
        return;
    }
    
}
// 设置上传按钮圆角
- (void)buttonRoundedCornersCSS {
    self.takeButton.layer.masksToBounds = YES;
    self.takeButton.layer.cornerRadius = 5;
    self.resumeButton.layer.masksToBounds = YES;
    self.resumeButton.layer.cornerRadius = 5;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// 自拍上传
- (IBAction)takeButtonClick:(UIButton *)sender {
}



// 简历上传
- (IBAction)resumeButtonClick:(UIButton *)sender {
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
