//
//  PayManager.h
//  MiTang_Client
//
//  Created by OTT on 16/5/12.
//  Copyright © 2016年 Heaven. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PayObjc.h"

typedef void(^HandlerSuccess)(id object, id responseObject);
typedef void(^HandlerFailurer)(NSInteger error, id responseObject);

typedef NS_ENUM(NSInteger, PayType)
{
    PayType_Non = 0,
    PayType_AliPay = 1,
    PayType_WEChatPay
};

typedef NS_ENUM(NSInteger, OrderType)
{
    OrderType_Non = -1,
    OrderType_Good = 0,
    OrderType_Service = 1
};

@interface PayManager : NSObject

@property(nonatomic, assign)PayType mtPayType;
@property(nonatomic, assign)OrderType mtOrderType;
@property(nonatomic, strong)NSString *callbackUrl;
@property(nonatomic, strong)NSString *payRes;

+ (instancetype)sharedManager;

- (void)orderPayUsePayType:(PayType)mPayType orderInfo:(PayObjc *)payObjc;

- (void)payResCallBackHandlerWithSuccess:(HandlerSuccess)handleSuccess faile:(HandlerFailurer)handleFailed;

@end
