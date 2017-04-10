//
//  ChangeUserPasswordViewController.m
//  JiaoDaBang
//
//  Created by ott001 on 2017/4/8.
//  Copyright © 2017年 Heaven. All rights reserved.
//

#import "ChangeUserPasswordViewController.h"

@interface ChangeUserPasswordViewController ()

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
