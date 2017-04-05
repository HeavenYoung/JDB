//
//  FeedBackViewController.m
//  JiaoDaBang
//
//  Created by ott001 on 2017/4/5.
//  Copyright © 2017年 Heaven. All rights reserved.
//

#import "FeedBackViewController.h"

@interface FeedBackViewController ()

@property (nonatomic, strong) UITextView *inputView;

@end

@implementation FeedBackViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor colorWithHexString:@"#fafafa"];
    [self setupUI];
}

- (void)setupUI {

    //识别码
    UITextView *inputView = [[UITextView alloc]initWithFrame:CGRectMake(10,20, SCREEN_WIDTH -20, 200)];
    inputView.font = [UIFont systemFontOfSize:16];
    inputView.layer.borderWidth = 0;
    inputView.layer.masksToBounds = YES;
    inputView.layer.cornerRadius = 3;
    inputView.layer.borderColor = [UIColor colorWithRed:240/255 green:240/255 blue:240/255 alpha:0.5].CGColor;
    inputView.textAlignment = NSTextAlignmentLeft;
    inputView.delegate = self;
    inputView.tintColor = [UIColor colorWithRed:240/255 green:240/255 blue:240/255 alpha:0.3];
    [self.view addSubview:inputView];
    self.inputView = inputView;
    
    // 按钮
    UIButton *submitBtn = [UIButton buttonWithTitle:@"提交"
                                         normalColor:CustomGreen
                                    highlightedColor:CustomGreen
                                           titleFont:[UIFont systemFontOfSize:16]
                                           imageName:nil
                                       backImageName:nil
                                              target:self
                                              action:@selector(submitBtnDidClicked)];
    submitBtn.frame = CGRectMake(10, 240, SCREEN_WIDTH - 20, 40);
    submitBtn.backgroundColor = [UIColor lightTextColor];
    submitBtn.layer.cornerRadius = 5.0;
    submitBtn.layer.masksToBounds = YES;
    [self.view addSubview:submitBtn];
}

- (void)submitBtnDidClicked {
    
    DLog(@"-----提交");
    
    FeedbackRequest *request = [[FeedbackRequest alloc] init];
    [request setParametersWithUserId:[GlobalManager sharedManager].userId content:self.inputView.text];
    [request setSuccessBlock:^(id object, id responseObject) {
    
        [self.navigationController popViewControllerAnimated:YES];
    }];
    
    [request setFailureBlock:^(NSInteger errorCode, id responseObject) {
       
        DLog(@"-----提交失败");
        
    }];
    [request sendRequest];
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
