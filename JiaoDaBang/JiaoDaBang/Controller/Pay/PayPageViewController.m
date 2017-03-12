//
//  PayPageViewController.m
//  页面
//
//  Created by apple on 17/3/3.
//  Copyright © 2017年 Sunjiandong. All rights reserved.
//

#import "PayPageViewController.h"

@interface PayPageViewController ()<UITextViewDelegate>
// 起点
@property (weak, nonatomic) IBOutlet UITextField *startingTextField;
// 终点
@property (weak, nonatomic) IBOutlet UITextField *endtingTextField;
// 金额
@property (weak, nonatomic) IBOutlet UILabel *moneyLabel;
// 支付按钮
@property (weak, nonatomic) IBOutlet UIButton *payButton;
// 支付宝
@property (weak, nonatomic) IBOutlet UIButton *payTreasureButton;
// 微信
@property (weak, nonatomic) IBOutlet UIButton *weChatButton;
// 选中支付方式按钮
@property (nonatomic, strong) UIButton *selectBtn;
@end

@implementation PayPageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    _payButton.layer.masksToBounds = YES;
    _payButton.layer.cornerRadius = 5;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)MethodOfPaymentClick:(UIButton *)sender {
    if (self.selectBtn == sender) {
        sender.selected = !sender.selected;
    } else {
        sender.selected = YES;
        self.selectBtn.selected = NO;
        self.selectBtn = sender;
    }
}


@end
