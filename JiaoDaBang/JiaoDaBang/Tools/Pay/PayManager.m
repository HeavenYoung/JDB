//
//  PayManager.m
//  MiTang_Client
//
//  Created by OTT on 16/5/12.
//  Copyright © 2016年 Heaven. All rights reserved.
//

#import "PayManager.h"
#import "WXOrderPayRequest.h"
#import "WXApiRequestHandler.h"
#import "WXOrderPayData.h"
#import "AliOrderPayRequest.h"
#import "AliPayRequestHandler.h"
#import "OrderPayResRequst.h"
//#import "ChatterInfoRequest.h"
//#import "ChatterInfoData.h"
#import "ServiceOrderPayResRequest.h"

@interface PayManager ()

@property (nonatomic, strong) PayObjc *payObjc;

@end

@implementation PayManager

static PayManager *instance;

+ (instancetype)sharedManager {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[PayManager alloc]init];
    });
    
    return instance;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(sendPayMessageToSeller:) name:kPayMessageNotification object:nil];
    }
    return self;
}

- (void)payInit {
    self.mtPayType = PayType_Non;
    self.mtOrderType = OrderType_Non;
    self.payObjc = nil;
    self.payRes = nil;
}

- (void)sendPayMessageToSeller:(NSNotification *)notification {

    NSNumber *boolNum = [notification object];
    if (![boolNum boolValue]) {
        return;
    }
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm"];
    NSString *strDate = [dateFormatter stringFromDate:[NSDate date]];
    NSLog(@"%@", strDate);
    
    NSString *orderTitle = @"订单提醒";
    NSString *orderId = self.payObjc.orderId;
    NSString *orderDetail = self.payObjc.orderName;
    NSString *orderTime = strDate;

    NSDictionary *extDic = [NSDictionary dictionaryWithObjectsAndKeys:@"orderType",@"orderType",
                            orderTitle,@"orderTitle",
                            orderId,@"orderId",
                            orderDetail,@"orderDetail",
                            orderTime,@"orderTime",
                            nil];
    
    NSString *orderImageUrl = self.payObjc.orderImageUrl;
    
    NSString *sellerId = nil;
    if (self.mtOrderType == OrderType_Good) {
        sellerId = [NSString stringWithFormat:@"s%@",self.payObjc.sellerMobile];
    }
    else if (self.mtOrderType == OrderType_Service) {
        sellerId = self.payObjc.sellerId;
    }
    
    if (!sellerId) {
        return;
    }
}

- (void)orderPayUsePayType:(PayType)mPayType orderInfo:(PayObjc *)payObjc {
    
    if (mPayType == PayType_WEChatPay && ![WXApi isWXAppInstalled]) {
        UIAlertView *alter = [[UIAlertView alloc]initWithTitle:@"支付提示" message:@"未安装微信，请安装后重试支付！" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alter show];
        return;
    }
    
    [self payInit];
    
    self.mtPayType = mPayType;
    self.payObjc = payObjc;
    if (payObjc.orderType && [payObjc.orderType isEqualToString:@"1"]) {
        self.mtOrderType = OrderType_Service;
    }
    else if (payObjc.orderType && [payObjc.orderType isEqualToString:@"0"]) {
        self.mtOrderType = OrderType_Good;
    }
    
//    self.payObjc.fee = @(0.01);
    
    switch (_mtPayType) {
        case PayType_WEChatPay: {
            [self wxPayOrder:payObjc];
        }
            break;
        case PayType_AliPay: {
            [self AliPayOrder:payObjc];
        }
            break;
        default:
            break;
    }
}

- (void)wxPayOrder:(PayObjc *)payObjc {

    NSString *orderId = payObjc.orderId;
    NSString *orderName = payObjc.orderName;
    CGFloat fee = [payObjc.fee floatValue];
    NSString *token = payObjc.userToken;
    NSString *orderToken = payObjc.orderToken;
    
    WXOrderPayRequest *orderPayRequest = [[WXOrderPayRequest alloc]init];
    [orderPayRequest setParametersOrderId:orderId goodsName:orderName price:fee token:token orderToken:orderToken];
    
    [orderPayRequest setSuccessBlock:^(id object, id responseObject) {
        NSLog(@"--------拉取微信支付信息成功");
        WXOrderPayData *payInfo = (WXOrderPayData *)object;
        [WXApiRequestHandler WXOrderPay:payInfo];
        if (payInfo.callbackUrl) {
            _callbackUrl = [NSString stringWithFormat:@"%@&type=2",payInfo.callbackUrl];
        }
    }];
    [orderPayRequest setFailureBlock:^(NSInteger errorCode, id responseObject) {
        NSLog(@"--------拉取微信支付信息失败");
    }];
    
    [orderPayRequest sendRequest];
}

- (void)AliPayOrder:(PayObjc *)payObjc {
 
    NSString *orderId = payObjc.orderId;
    NSString *orderName = payObjc.orderName;
    NSString *orderDetail= payObjc.orderDetail;
    CGFloat fee = [payObjc.fee floatValue];
    NSString *token = payObjc.userToken;
    NSString *orderToken = payObjc.orderToken;
    
    AliOrderPayRequest *orderPayRequest = [[AliOrderPayRequest alloc]init];
    [orderPayRequest setParametersOrderId:orderId OrderName:orderName orderDetail:orderDetail fee:fee token:token orderToken:orderToken];    
    [orderPayRequest setSuccessBlock:^(id object, id responseObject) {
        NSLog(@"--------拉取支付宝支付信息成功");
        AliOrderPayData *payInfo = (AliOrderPayData *)object;
        [AliPayRequestHandler alipayRequestPay:payInfo];
        if (payInfo.callbackUrl) {
            _callbackUrl = [NSString stringWithFormat:@"%@&type=1",payInfo.callbackUrl];
        }
    }];
    [orderPayRequest setFailureBlock:^(NSInteger errorCode, id responseObject) {
        NSLog(@"--------拉取支付宝支付信息失败");
    }];
    
    [orderPayRequest sendRequest];
}

- (void)payResCallBackHandlerWithSuccess:(HandlerSuccess)handleSuccess faile:(HandlerFailurer)handleFailed {
    
    NSString *orderId = self.payObjc.orderId;
    NSString *payMethod = self.payObjc.payMethod;
    NSString *payRes= self.payRes;
    NSString *token = self.payObjc.userToken;
    NSString *orderToken = self.payObjc.orderToken;
    
    if (self.mtOrderType == OrderType_Good) {
        OrderPayResRequst *requst = [[OrderPayResRequst alloc]init];
        [requst setParametersOrderId:orderId payType:payMethod payRes:payRes token:token orderToken:orderToken];
        [requst setSuccessBlock:^(id object, id responseObject) {
            handleSuccess(object, responseObject);
        }];
        [requst setFailureBlock:^(NSInteger errorCode, id responseObject) {
            handleFailed(errorCode, responseObject);
        }];
        [requst sendRequest];
    }
    else if (self.mtOrderType == OrderType_Service) {
        ServiceOrderPayResRequest *requst = [[ServiceOrderPayResRequest alloc]init];
        [requst setParametersOrderId:orderId payType:payMethod payRes:payRes token:token orderToken:orderToken];
        [requst setSuccessBlock:^(id object, id responseObject) {
            handleSuccess(object, responseObject);
        }];
        [requst setFailureBlock:^(NSInteger errorCode, id responseObject) {
            handleFailed(errorCode, responseObject);
        }];
        [requst sendRequest];
    }
    
}


@end
