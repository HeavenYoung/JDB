//
//  ProfileViewController.m
//  JiaoDaBang
//
//  Created by Heaven on 2016/12/15.
//  Copyright © 2016年 Heaven. All rights reserved.
//

#import "ProfileViewController.h"
#import "SettingViewController.h"
#import "LoginViewController.h"

@interface ProfileViewController () <SettingViewControllerDelegate>

@end

@implementation ProfileViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setupNavigationBar];
}

#pragma mark - navigation
/// 设置导航栏
- (void)setupNavigationBar {
    
    // 右按钮
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem barButtonWithTitle:@"设置"
                                                                       titleFont:[UIFont systemFontOfSize:16]
                                                                      titleColor:[UIColor whiteColor]
                                                                       imageName:@""
                                                                          target:self
                                                                          action:@selector(rightBarButtonItemDidClicked)];
}

/// 设置
- (void)rightBarButtonItemDidClicked {
    
    SettingViewController *settingVC = [[SettingViewController alloc] init];
    settingVC.delegate = self;
    [self.navigationController pushViewController:settingVC animated:YES];
}

- (void)settingLogout {

    LoginViewController *loginViewController = [[LoginViewController alloc] init];
    YTNavigationController *navigationController = [[YTNavigationController alloc] initWithRootViewController:loginViewController];
    [self presentViewController:navigationController animated:NO completion:nil];
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
