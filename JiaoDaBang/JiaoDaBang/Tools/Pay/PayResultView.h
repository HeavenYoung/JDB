//
//  PayResultView.h
//  MiTang_Client
//
//  Created by OTT on 16/5/12.
//  Copyright © 2016年 Heaven. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol PayResultViewDelegate;

@interface PayResultView : UIView

@property (nonatomic, weak)id<PayResultViewDelegate> delegate;

- (instancetype)initWithFrame:(CGRect)frame andPayResult:(BOOL)isSuccess;

@end


@protocol PayResultViewDelegate <NSObject>

@optional
- (void)closePayResultView:(BOOL)payResult;
- (void)sendMessageNotificateSeller;

@end