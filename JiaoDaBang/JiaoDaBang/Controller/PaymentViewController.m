//
//  PaymentViewController.m
//  JiaoDaBang
//
//  Created by 詹鹏翼 on 2017/4/12.
//  Copyright © 2017年 Heaven. All rights reserved.
//

#import "PaymentViewController.h"
#import "QCheckBox.h"

#define LABEL_INITIAL_HEIGHT 35
#define FIRST_LABEL_X 20
#define FIRST_LABEL_HEIGHT 90

@interface PaymentViewController ()


@end

@implementation PaymentViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithHexString:@"#fafafa"];

    
    [self setupUI];
    
    // Do any additional setup after loading the view.
}

- (void)setupUI{
    
    UILabel *profileLabel = [[UILabel alloc] initWithFrame:CGRectMake(FIRST_LABEL_X, FIRST_LABEL_HEIGHT, SCREEN_WIDTH/4, LABEL_INITIAL_HEIGHT)];
    profileLabel.backgroundColor = [UIColor whiteColor];
    profileLabel.text = @"求助定位";
    UILabel *profileLabelContent = [[UILabel alloc] initWithFrame:CGRectMake(FIRST_LABEL_X + SCREEN_WIDTH/4, FIRST_LABEL_HEIGHT, SCREEN_WIDTH * 0.75, LABEL_INITIAL_HEIGHT)];
    profileLabelContent.backgroundColor = [UIColor whiteColor];
    profileLabelContent.text = @"测试求助内容";
    
    UILabel *location = [[UILabel alloc] initWithFrame:CGRectMake(FIRST_LABEL_X, FIRST_LABEL_HEIGHT + LABEL_INITIAL_HEIGHT, SCREEN_WIDTH/4, LABEL_INITIAL_HEIGHT)];
    location.backgroundColor = [UIColor whiteColor];
    location.text = @"送达地址";
    UILabel *locationContent = [[UILabel alloc] initWithFrame:CGRectMake(FIRST_LABEL_X + SCREEN_WIDTH/4, FIRST_LABEL_HEIGHT + LABEL_INITIAL_HEIGHT, SCREEN_WIDTH * 0.75, LABEL_INITIAL_HEIGHT)];
    locationContent.backgroundColor = [UIColor whiteColor];
    locationContent.text = @"测试送达地址内容";

    UILabel *address = [[UILabel alloc] initWithFrame:CGRectMake(FIRST_LABEL_X, FIRST_LABEL_HEIGHT + 2*LABEL_INITIAL_HEIGHT, SCREEN_WIDTH/4, LABEL_INITIAL_HEIGHT)];
    address.backgroundColor = [UIColor whiteColor];
    address.text = @"金额";
    UILabel *addressContent = [[UILabel alloc] initWithFrame:CGRectMake(FIRST_LABEL_X + SCREEN_WIDTH/4, FIRST_LABEL_HEIGHT + 2*LABEL_INITIAL_HEIGHT, SCREEN_WIDTH * 0.75, LABEL_INITIAL_HEIGHT)];
    addressContent.backgroundColor = [UIColor whiteColor];
    addressContent.text = @"测试金额";

    QCheckBox *qcheck = [[QCheckBox alloc] init];
    
    
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
