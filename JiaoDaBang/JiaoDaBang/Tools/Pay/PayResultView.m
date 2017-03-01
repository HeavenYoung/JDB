//
//  PayResultView.m
//  MiTang_Client
//
//  Created by OTT on 16/5/12.
//  Copyright © 2016年 Heaven. All rights reserved.
//

#import "PayResultView.h"

@interface PayResultView ()

@property (nonatomic, assign) BOOL payRusult;
@property (nonatomic, strong) UIView *centerView;
@property (nonatomic, strong) UIButton *closeBtn;
@property (nonatomic, strong) UIImageView *resultImageView;
@property (nonatomic, strong) UILabel *resultLabel;
@property (nonatomic, strong) UIButton *sendMessage;

@end

@implementation PayResultView

//- (instancetype)initWithFrame:(CGRect)frame {
//    self = [super initWithFrame:frame];
//    if (self) {
//        self.backgroundColor = RGBACOLOR(96, 96, 96, 0.5);
//        
//        [self addSubview:self.centerView];
//        [self addSubview:self.closeBtn];
//        [self addSubview:self.resultImageView];
//        [self addSubview:self.resultLabel];
//        [self addSubview:self.sendMessage];
//        
//    }
//    
//    return self;
//}

- (instancetype)initWithFrame:(CGRect)frame andPayResult:(BOOL)isSuccess {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = RGBACOLOR(96, 96, 96, 0.5);
        self.payRusult = isSuccess;
        [self configView];
    }
    
    return self;
}

- (void)configView {
    [self addSubview:self.centerView];
    [self addSubview:self.closeBtn];
    [self addSubview:self.resultImageView];
    [self addSubview:self.resultLabel];
    [self addSubview:self.sendMessage];
    if (self.payRusult) {
        self.resultLabel.text = @"支付成功";
        [self.sendMessage setTitle:@"通知卖家" forState:UIControlStateNormal];
        [self.sendMessage setTitle:@"通知卖家" forState:UIControlStateHighlighted];
    }
    else {
        self.resultLabel.text = @"支付失败！";
    }
}


- (UIView *)centerView {
    if (!_centerView) {
        UIView *acenterView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 200, 240)];
        acenterView.center = CGPointMake(self.center.x, self.center.y*4/5);
        acenterView.backgroundColor = [UIColor whiteColor];
        acenterView.layer.cornerRadius = 9;
        acenterView.layer.masksToBounds = YES;
        _centerView = acenterView;
    }
    return _centerView;
}

- (UIButton *)closeBtn {
    if (!_closeBtn) {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        [btn setBackgroundImage:[UIImage imageNamed:@"btn_close_pop_highlighted"] forState:UIControlStateNormal];
        [btn setBackgroundImage:[UIImage imageNamed:@"btn_close_pop"] forState:UIControlStateHighlighted];
        //ico_pay_big_pop_org@3x
        [btn addTarget:self action:@selector(closeResultView) forControlEvents:UIControlEventTouchUpInside];
        _closeBtn = btn;
    }
    return _closeBtn;
}

- (UIImageView *)resultImageView {
    if (!_resultImageView) {
        UIImageView *imageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"ico_pay_big_pop_org"]];
        imageView.contentMode = UIViewContentModeScaleAspectFit;
        _resultImageView = imageView;
    }
    return _resultImageView;
}

- (UILabel *)resultLabel {
    if (!_resultLabel) {
        UILabel *result = [[UILabel alloc]init];
        result.text = @"支付成功";
        result.font = [UIFont systemFontOfSize:15];
        result.backgroundColor = [UIColor clearColor];
        _resultLabel = result;
    }
    return _resultLabel;
}

- (UIButton *)sendMessage {
    if (!_sendMessage) {
        UIButton *send = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [send setTitle:@"通知卖家" forState:UIControlStateNormal];
        [send setTitle:@"通知卖家" forState:UIControlStateHighlighted];
        send.backgroundColor = [UIColor clearColor];
        send.titleLabel.font = [UIFont systemFontOfSize:16];
        [send setTitleColor:RGBACOLOR(75, 182, 97, 1) forState:UIControlStateNormal];
        send.layer.cornerRadius = 15;
        send.layer.masksToBounds = YES;
        send.layer.borderColor = [RGBACOLOR(75, 182, 97, 1) CGColor];//[[UIColor greenColor] CGColor];75 182 97
        send.layer.borderWidth = 1;
        [send addTarget:self action:@selector(sendMessageAction) forControlEvents:UIControlEventTouchUpInside];
        _sendMessage = send;
    }
    return _sendMessage;
}

- (void)layoutSubviews {
    
    
    if (self.payRusult) {
        [self.centerView setFrame:CGRectMake(0, 0, 200, 240)];
        self.centerView.center = CGPointMake(self.center.x, self.center.y*4/5);
        [self.closeBtn setFrame:CGRectMake(self.centerView.frame.origin.x+200-25, self.centerView.frame.origin.y-15, 40, 40)];
        [self.resultImageView setFrame:CGRectMake(0, 0, 80, 80)];
        self.resultImageView.center = CGPointMake(self.center.x, self.center.y*2/3);
        [self.resultLabel setFrame:CGRectMake(self.resultImageView.frame.origin.x, self.resultImageView.frame.origin.y+80+10, 80, 20)];
        [self.sendMessage setFrame:CGRectMake(self.resultLabel.frame.origin.x-15, self.resultLabel.frame.origin.y+20+20, 110, 34)];
    }
    else {
        [self.centerView setFrame:CGRectMake(0, 0, 200, 200)];
        self.centerView.center = CGPointMake(self.center.x, self.center.y*4/5);
        [self.closeBtn setFrame:CGRectMake(self.centerView.frame.origin.x+200-25, self.centerView.frame.origin.y-15, 40, 40)];
        [self.resultImageView setFrame:CGRectMake(0, 0, 80, 80)];
        self.resultImageView.center = CGPointMake(self.center.x, self.center.y*4/5*0.9);
        [self.resultLabel setFrame:CGRectMake(self.resultImageView.frame.origin.x, self.resultImageView.frame.origin.y+80+10+10, 80, 20)];
    }
    
}

- (void)closeResultView {
    CGRect frame = self.frame;
    [UIView animateWithDuration:0.5f animations:^{
        self.frame = CGRectMake(0, frame.size.height, frame.size.width, frame.size.height);
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
        if (_delegate && [_delegate respondsToSelector:@selector(closePayResultView:)]) {
            [_delegate closePayResultView:self.payRusult];
        }
    }];
}

- (void)sendMessageAction {
    [self closeResultView];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
