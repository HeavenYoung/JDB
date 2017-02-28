//
//  YTNavigationController.m
//  JiaoDaBang
//
//  Created by Heaven on 2016/12/15.
//  Copyright © 2016年 Heaven. All rights reserved.
//

#import "YTNavigationController.h"

@interface YTNavigationController () <UIGestureRecognizerDelegate>

@end

@implementation YTNavigationController

- (instancetype)initWithRootViewController:(UIViewController *)rootViewController {
    self = [super initWithRootViewController:rootViewController];
    if (self) {
        [UINavigationBar appearance].tintColor = [UIColor whiteColor];
        [UINavigationBar appearance].titleTextAttributes = @{NSForegroundColorAttributeName :[UIColor whiteColor]};

        [[UINavigationBar appearance] setBackgroundImage:[UIImage imageNamed:@"NavigationBarBack"] forBarMetrics:UIBarMetricsDefault];

//        [UINavigationBar appearance].barTintColor = [UIColor colorWithHexString:@"#8bc34a"];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationBar.shadowImage = [[UIImage alloc] init];

    self.interactivePopGestureRecognizer.delegate = self;
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    
    if (self.childViewControllers.count > 0) {
        
//        NSString *controllerTitle = [self.childViewControllers objectAtIndex:self.childViewControllers.count-1].title;
//        
//        NSString *title = [NSString stringWithFormat:@" %@", controllerTitle];
//        
//        // 左按钮
//        viewController.navigationItem.leftBarButtonItem = [UIBarButtonItem barButtonWithTitle:title
//                                                                                    titleFont:[UIFont systemFontOfSize:16] titleColor:[UIColor whiteColor] imageName:@"arrow_title_goback"
//                                                                                       target:self
//                                                                                       action:@selector(goBack)                                               ];
        
        // 隐藏底部的 TabBar
        viewController.hidesBottomBarWhenPushed = YES;
    }
    
    [super pushViewController:viewController animated:animated];
}

#pragma mark - UIGestureRecognizerDelegate
/// 手势识别将要开始
///
/// @param gestureRecognizer 手势识别
///
/// @return 返回 NO，放弃当前识别到的手势
- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer {
    // 如果是根视图控制器，则不支持手势返回
    return self.childViewControllers.count > 1 ? YES : NO;
}

#pragma mark - 监听方法
/// 返回上级视图控制器
- (void)goBack {
    [self popViewControllerAnimated:YES];
}

#pragma mark - StatusBar
- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
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
