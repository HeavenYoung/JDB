//
//  OrderPay.h
//  MiTang_Client
//
//  Created by OTT on 16/5/12.
//  Copyright © 2016年 Heaven. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WXOrderPayData : NSObject

@property (nonatomic, copy) NSString *appid;                // 应用Id
@property (nonatomic, copy) NSString *partnerid;            // 商户号
@property (nonatomic, copy) NSString *prepayid;             // 预支付交易会话ID
@property (nonatomic, copy) NSString *package;              // 扩展字段
@property (nonatomic, copy) NSString *noncestr;             // 随机字符串
@property (nonatomic, copy) NSString *timestamp;            // 时间戳
@property (nonatomic, copy) NSString *sign;                 // 签名
@property (nonatomic, copy) NSString *callbackUrl;



@end
