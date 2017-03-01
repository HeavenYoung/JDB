//
//  AliPayRequestHandler.m
//  MiTang_Client
//
//  Created by OTT on 16/5/11.
//  Copyright © 2016年 Heaven. All rights reserved.
//

#import "AliPayRequestHandler.h"

@implementation AliPayRequestHandler

+ (void)alipayRequestPay:(AliOrderPayData *)orderPayData {
    NSString *appScheme = AlipayScheme;
    NSString *orderString = orderPayData.orderStr;
    [[AlipaySDK defaultService] payOrder:orderString fromScheme:appScheme callback:^(NSDictionary *resultDic) {
        //【callback处理支付结果】
        DLog(@"reslut = %@",resultDic);
        NSInteger resultCode = [[resultDic objectForKey:@"resultStatus"] integerValue];
        BOOL isSuccess = NO;
        if (resultCode == 9000) {
            isSuccess = YES;
        }
        [[NSNotificationCenter defaultCenter]postNotificationName:kCallPayResultHandleNotification object:@(isSuccess)];
    }];
}


@end
