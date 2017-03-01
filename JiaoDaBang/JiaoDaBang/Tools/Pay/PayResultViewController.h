//
//  PayResultViewController.h
//  MiTang_Client
//
//  Created by OTT on 16/5/16.
//  Copyright © 2016年 Heaven. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PayResultView.h"

@interface PayResultViewController : UIViewController

- (instancetype)initWithOrderUrl:(NSString *)urlString payResult:(BOOL)isSuccess;

@end
