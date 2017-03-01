//
//  AliPayRequestHandler.h
//  MiTang_Client
//
//  Created by OTT on 16/5/11.
//  Copyright © 2016年 Heaven. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AliOrderPayData.h"

@interface AliPayRequestHandler : NSObject

/*!
 *@brief 支付宝支付
 *@param paramsDic 订单参数
 */
+ (void)alipayRequestPay:(AliOrderPayData *)orderPayData;

@end
