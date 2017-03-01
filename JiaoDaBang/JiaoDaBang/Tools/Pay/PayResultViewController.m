//
//  PayResultViewController.m
//  MiTang_Client
//
//  Created by OTT on 16/5/16.
//  Copyright © 2016年 Heaven. All rights reserved.
//

#import "PayResultViewController.h"

@interface PayResultViewController ()<UIWebViewDelegate>

@property (nonatomic, strong)NSString *urlString;
@property (nonatomic, strong)UIWebView *webView;
@property (nonatomic, assign)BOOL payResult;

@end

@implementation PayResultViewController

- (instancetype)initWithOrderUrl:(NSString *)urlString payResult:(BOOL)isSuccess {
    self = [super init];
    if (self) {
        
        self.payResult = isSuccess;
        NSString *payTag = @"1";
        if (!isSuccess) {
            payTag = @"0";
        }
        self.urlString = [NSString stringWithFormat:@"%@&payRes=%@", urlString, payTag];
        
    }
    
    return self;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.view setBackgroundColor:[UIColor clearColor]];
    [self setupNavigationBar];
    [self.view addSubview:self.webView];

}

- (UIWebView *)webView {
    if (!_webView) {
        NSMutableURLRequest * request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:self.urlString]];
        _webView = [[UIWebView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT - 64)];
        [_webView sizeToFit];
        _webView.delegate = self;
        _webView.scalesPageToFit = YES;
        [_webView loadRequest:request];
        [self.view addSubview:_webView];
    }
    return _webView;
}

//设置导航栏
- (void)setupNavigationBar {
    
    // 1. 左按钮
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem barButtonWithTitle:nil titleFont:[UIFont systemFontOfSize:16] titleColor:[UIColor whiteColor] imageName:@"btn_close" target:self action:@selector(leftBarButtonItemDidClicked)];
}

//关闭页面
- (void)leftBarButtonItemDidClicked {
    [self dismissViewControllerAnimated:YES completion:nil];
    [[NSNotificationCenter defaultCenter] postNotificationName:@"GoodDetailRefrashNotification" object:@(self.payResult)];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - StatusBar

- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}

- (BOOL)prefersStatusBarHidden {
    return NO;
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
