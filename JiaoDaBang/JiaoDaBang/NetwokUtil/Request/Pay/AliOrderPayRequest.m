//
//  AliOrderPayRequest.m
//  MiTang_Client
//
//  Created by OTT on 16/5/13.
//  Copyright © 2016年 Heaven. All rights reserved.
//

#import "AliOrderPayRequest.h"
#import "AliOrderPayResponse.h"

@interface AliOrderPayRequest ()

@property (nonatomic, strong) NSString *orderId;
@property (nonatomic, strong) NSString *orderName;
@property (nonatomic, assign) CGFloat fee;
@property (nonatomic, strong) NSString *orderDetail;
@property (nonatomic, strong) NSString *token;
@property (nonatomic, strong) NSString *orderToken;

@end

@implementation AliOrderPayRequest

- (instancetype)init {
    
    self = [super init];
    if (self) {
        [self setHttpMethod:@"GET"];
        self.URLString = @"index.php?r=v1/alipay-pay/pay";
    }
    return self;
}

- (void)setParametersOrderId:(NSString *)aorderId OrderName:(NSString *)aorderName orderDetail:(NSString *)aorderDetail fee:(CGFloat)afee token:(NSString *)atoken orderToken:(NSString *)aorderToken {
    
    self.orderId = aorderId;
    self.orderName = aorderName;
    self.fee = afee;
    self.orderDetail = aorderDetail;
    self.token = atoken;
    self.orderToken = aorderToken;
    [self parametersWithProperties];
}

- (void)parametersWithProperties {
    
    NSMutableDictionary *mDic = [NSMutableDictionary dictionaryWithCapacity:10];
    [mDic setObject:_orderId forKey:@"out_trade_no"];
    [mDic setObject:_orderName forKey:@"subject"];
    [mDic setObject:[NSNumber numberWithFloat:_fee] forKey:@"total_fee"];
    [mDic setObject:_orderDetail forKey:@"body"];
    [mDic setObject:_token forKey:@"token"];
    [mDic setObject:_orderToken forKey:@"orderToken"];
    self.parameters = mDic;
}

ResponserParserGenerate(AliOrderPayResponse)



@end
