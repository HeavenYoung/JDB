//
//  OrderDetailViewController.m
//  JiaoDaBang
//
//  Created by 詹鹏翼 on 2017/4/7.
//  Copyright © 2017年 Heaven. All rights reserved.
//

#import "OrderDetailViewController.h"


#define LABEL_INITIAL_HEIGHT 40
#define FIRST_LABEL_X 10
#define FIRST_LABEL_HEIGHT 60

@interface OrderDetailViewController ()

@end

@implementation OrderDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor colorWithHexString:@"#fafafa"];
    [self setUI];
    // Do any additional setup after loading the view.
}

- (void)setUI {
    
    UILabel *profileLabel = [[UILabel alloc] initWithFrame:CGRectMake(FIRST_LABEL_X, FIRST_LABEL_HEIGHT, SCREEN_WIDTH/4, LABEL_INITIAL_HEIGHT)];
    profileLabel.backgroundColor = [UIColor whiteColor];
    profileLabel.text = @"求助内容";
    UILabel *profileLabelContent = [[UILabel alloc] initWithFrame:CGRectMake(FIRST_LABEL_X + SCREEN_WIDTH/4, FIRST_LABEL_HEIGHT, SCREEN_WIDTH * 0.75, LABEL_INITIAL_HEIGHT)];
    profileLabelContent.backgroundColor = [UIColor whiteColor];
    profileLabelContent.text = @"测试求助内容";
    
    UILabel *location = [[UILabel alloc] initWithFrame:CGRectMake(FIRST_LABEL_X, FIRST_LABEL_HEIGHT + LABEL_INITIAL_HEIGHT, SCREEN_WIDTH/4, LABEL_INITIAL_HEIGHT)];
    location.backgroundColor = [UIColor whiteColor];
    location.text = @"求助定位";
    UILabel *locationContent = [[UILabel alloc] initWithFrame:CGRectMake(FIRST_LABEL_X + SCREEN_WIDTH/4, FIRST_LABEL_HEIGHT + LABEL_INITIAL_HEIGHT, SCREEN_WIDTH * 0.75, LABEL_INITIAL_HEIGHT)];
    locationContent.backgroundColor = [UIColor whiteColor];
    locationContent.text = @"测试求助内容";
    
    UILabel *address = [[UILabel alloc] initWithFrame:CGRectMake(FIRST_LABEL_X, FIRST_LABEL_HEIGHT + 2*LABEL_INITIAL_HEIGHT, SCREEN_WIDTH/4, LABEL_INITIAL_HEIGHT)];
    address.backgroundColor = [UIColor whiteColor];
    address.text = @"送达地址";
    UILabel *addressContent = [[UILabel alloc] initWithFrame:CGRectMake(FIRST_LABEL_X + SCREEN_WIDTH/4, FIRST_LABEL_HEIGHT + 2*LABEL_INITIAL_HEIGHT, SCREEN_WIDTH * 0.75, LABEL_INITIAL_HEIGHT)];
    addressContent.backgroundColor = [UIColor whiteColor];
    addressContent.text = @"送达地址内容";
    
    UILabel *money = [[UILabel alloc] initWithFrame:CGRectMake(FIRST_LABEL_X, FIRST_LABEL_HEIGHT + 3*LABEL_INITIAL_HEIGHT, SCREEN_WIDTH/4, LABEL_INITIAL_HEIGHT)];
    money.backgroundColor = [UIColor whiteColor];
    money.text = @"金额";
    UILabel *moneyContent = [[UILabel alloc] initWithFrame:CGRectMake(FIRST_LABEL_X + SCREEN_WIDTH/4, FIRST_LABEL_HEIGHT + 3*LABEL_INITIAL_HEIGHT, SCREEN_WIDTH * 0.75, LABEL_INITIAL_HEIGHT)];
    moneyContent.backgroundColor = [UIColor whiteColor];
    moneyContent.text = @"金额内容";
    
    UILabel *memo = [[UILabel alloc] initWithFrame:CGRectMake(FIRST_LABEL_X, FIRST_LABEL_HEIGHT + 4*LABEL_INITIAL_HEIGHT, SCREEN_WIDTH/4, LABEL_INITIAL_HEIGHT)];
    memo.backgroundColor = [UIColor whiteColor];
    memo.text = @"备注";
    UILabel *memoContent = [[UILabel alloc] initWithFrame:CGRectMake(FIRST_LABEL_X + SCREEN_WIDTH/4, FIRST_LABEL_HEIGHT + 4*LABEL_INITIAL_HEIGHT, SCREEN_WIDTH * 0.75, LABEL_INITIAL_HEIGHT)];
    memoContent.backgroundColor = [UIColor whiteColor];
    memoContent.text = @"备注内容";
    
    [self.view addSubview:profileLabel];
    [self.view addSubview:profileLabelContent];
    [self.view addSubview:location];
    [self.view addSubview:locationContent];
    [self.view addSubview:address];
    [self.view addSubview:addressContent];
    [self.view addSubview:money];
    [self.view addSubview:moneyContent];
    [self.view addSubview:memo];
    [self.view addSubview:memoContent];

    
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
