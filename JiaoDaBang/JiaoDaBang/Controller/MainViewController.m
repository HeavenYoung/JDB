//
//  MainViewController.m
//  JiaoDaBang
//
//  Created by Heaven on 2016/12/15.
//  Copyright © 2016年 Heaven. All rights reserved.
//

#import "MainViewController.h"
#import "YTNavigationController.h"
#import "JDHomeViewController.h"
#import "SeekViewController.h"
#import "HelpViewController.h"
#import "ProfileViewController.h"
#import "LoginViewController.h"

@interface MainViewController ()

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [UITabBar appearance].barTintColor = CustomGreen;
    [UITabBar appearance].tintColor = [UIColor whiteColor];

    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(logoutOperation) name:NOTIFCATION_USER_SETTINGLOGOUT object:nil];
    
    [self autoLogin];
    
    [self addChildViewControllers];
}

- (void)autoLogin {

    DLog(@"-------自动登陆-------")
    NSString *userId = [[NSUserDefaults standardUserDefaults] objectForKey:kUserID];
    
    if (userId) {
        UserInfoRequest *request = [[UserInfoRequest alloc] init];
        [request setParametersWithUserId:userId];
        [request setSuccessBlock:^(id object, id responseObject) {
            DLog(@"-----用户登录成功");
            
            [[GlobalManager sharedManager] loginSuccessedWithUserInfo:object];
            
        }];
        [request setFailureBlock:^(NSInteger errorCode, id responseObject) {
            DLog(@"-----用户登录失败");
            [self showLogin];
            
        }];
        [request sendRequest];
    
    } else {
        
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            
            [self showLogin];
            
        });

    }
}

- (void)showLogin {
    LoginViewController *loginViewController = [[LoginViewController alloc] init];
    YTNavigationController *navigationController = [[YTNavigationController alloc] initWithRootViewController:loginViewController];
    [self presentViewController:navigationController animated:NO completion:nil];
}

- (void)logoutOperation {

    [self showLogin];
}

//添加所有子控制器
- (void)addChildViewControllers {
    
    [self addChildViewController:[[JDHomeViewController alloc] init] title:@"首页" imageName:@"home"];
    [self addChildViewController:[[SeekViewController alloc] init] title:@"发布求助" imageName:@"seek"];
    [self addChildViewController:[[HelpViewController alloc] init] title:@"顺手帮忙" imageName:@"help"];
    [self addChildViewController:[[ProfileViewController alloc] init] title:@"个人中心" imageName:@"profile"];

}

//添加子控制器
- (void)addChildViewController:(UIViewController *)childController title:(NSString *)title imageName:(NSString *)imageName  {
    
    // 设置标题
    childController.title = title;
    
    // 通过 AttributeText 设置字体属性
    // 设置字体颜色
    NSDictionary *attributes = @{NSForegroundColorAttributeName : [UIColor whiteColor]};
    
    [childController.tabBarItem setTitleTextAttributes:attributes forState:UIControlStateNormal];
    [childController.tabBarItem setTitleTextAttributes:attributes forState:UIControlStateSelected];

    // 设置字体大小
    // [childController.tabBarItem setTitleTextAttributes:@{NSFontAttributeName: [UIFont systemFontOfSize:20]} forState:UIControlStateNormal];
    
    // 设置图像
    childController.tabBarItem.image = [[UIImage imageNamed:imageName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    NSString *selectedImageName = [NSString stringWithFormat:@"%@_selected", imageName];
    
    childController.tabBarItem.selectedImage = [[UIImage imageNamed:selectedImageName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    // 添加子控制器
    YTNavigationController *navigationController = [[YTNavigationController alloc] initWithRootViewController:childController];
    
    [self addChildViewController:navigationController];
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
