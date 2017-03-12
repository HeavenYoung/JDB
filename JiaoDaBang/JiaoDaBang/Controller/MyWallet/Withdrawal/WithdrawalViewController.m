//
//  WithdrawalViewController.m
//  页面
//
//  Created by apple on 17/3/2.
//  Copyright © 2017年 Sunjiandong. All rights reserved.
//

#import "WithdrawalViewController.h"

@interface WithdrawalViewController ()
@property (weak, nonatomic) IBOutlet UITextField *inputMoneyTextField;
@property (weak, nonatomic) IBOutlet UIButton *PayTreasureBtn;
@property (weak, nonatomic) IBOutlet UIButton *WeChatBtn;
@property (weak, nonatomic) IBOutlet UIButton *confirmBtn;
// 选中按钮
@property (nonatomic, strong) UIButton *selectBtn;
@end

@implementation WithdrawalViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    _confirmBtn.layer.masksToBounds = YES;
    _confirmBtn.layer.cornerRadius = 5;
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


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
