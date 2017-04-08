//
//  webViewController.m
//  JiaoDaBang
//
//  Created by 詹鹏翼 on 2017/4/8.
//  Copyright © 2017年 Heaven. All rights reserved.
//

#import "WebViewController.h"
#define homeUrl www.baidu.com

@interface WebViewController () <UIWebViewDelegate>

@property (nonatomic, copy) NSString *nameString;
@property (nonatomic, copy) NSString *urlString;
@property (nonatomic, weak) UIWebView *webView;


@end

@implementation WebViewController

- (id)initwithNameString:(NSString *)nameString urlString:(NSString *)urlString {

    if (self) {
        
        self.nameString  = nameString;
        self.urlString = urlString;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = self.nameString;
    
    [self setupWebView];
    // Do any additional setup after loading the view.
}


- (void)setupWebView{
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:self.urlString]];//homeUrl for test
    
    UIWebView *webView = [[UIWebView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
    webView.backgroundColor = [UIColor clearColor];
    [webView sizeToFit];
    webView.delegate = self;
    webView.scrollView.delegate = self;
    webView.scalesPageToFit = YES;
    [webView loadRequest:request];
    [self.view addSubview:webView];
    self.webView = webView;

}

- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType {

    return YES;
}

- (void)webViewDidFinishLoad:(UIWebView *)webView {

}

- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error {

    DLog(@"-----WEB加载失败");
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
