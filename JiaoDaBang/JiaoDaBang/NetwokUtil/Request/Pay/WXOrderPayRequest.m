//
//  OrderPayRequest.m
//  MiTang_Client
//
//  Created by OTT on 16/5/12.
//  Copyright © 2016年 Heaven. All rights reserved.
//

#import "WXOrderPayRequest.h"
#import "WXOrderPayResponse.h"

@interface WXOrderPayRequest ()

@property (nonatomic, strong) NSString *orderNumber;
@property (nonatomic, strong) NSString *goodsName;
@property (nonatomic, assign) CGFloat price;
@property (nonatomic, strong) NSString *token;
@property (nonatomic, strong) NSString *orderToken;


@end

@implementation WXOrderPayRequest

- (instancetype)init {
    
    self = [super init];
    if (self) {
        self.URLString = @"index.php?r=v1/weixin-pay/pay";
        [self setHttpMethod:@"GET"];
    }
    return self;
}

- (void)setParametersOrderId:(NSString *)aorderId goodsName:(NSString *)agoodName price:(CGFloat)aprice token:(NSString *)atoken orderToken:(NSString *)aorderToken {

    self.orderNumber = aorderId;
    self.goodsName = agoodName;
    self.price = aprice;
    self.token = atoken;
    self.orderToken = aorderToken;
    [self parametersWithProperties];
}

- (void)parametersWithProperties {
    
    NSMutableDictionary *mDic = [NSMutableDictionary dictionaryWithCapacity:10];
    [mDic setObject:_orderNumber forKey:@"orderNumber"];
    [mDic setObject:_goodsName forKey:@"goodsName"];
    [mDic setObject:[NSNumber numberWithFloat:_price] forKey:@"price"];
    [mDic setObject:_token forKey:@"token"];
    [mDic setObject:_orderToken forKey:@"orderToken"];
    self.parameters = mDic;
}

ResponserParserGenerate(WXOrderPayResponse)

@end
