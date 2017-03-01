//
//  ServiceOrderPayResRequest.m
//  MiTang_Client
//
//  Created by OTT on 16/6/27.
//  Copyright © 2016年 Heaven. All rights reserved.
//

#import "ServiceOrderPayResRequest.h"
#import "ServiceOrderPayResResponse.h"

@interface ServiceOrderPayResRequest ()

@property (nonatomic, strong) NSString *orderId;
@property (nonatomic, strong) NSString *payType;
@property (nonatomic, strong) NSString *payRes;
@property (nonatomic, strong) NSString *token;
@property (nonatomic, strong) NSString *orderToken;

@end

@implementation ServiceOrderPayResRequest

- (instancetype)init {
    
    self = [super init];
    if (self) {
        self.URLString = @"index.php?r=v1/service-pay-redirect";
        [self setHttpMethod:@"GET"];
    }
    return self;
}

- (void)setParametersOrderId:(NSString *)aorderId payType:(NSString *)type payRes:(NSString *)res token:(NSString *)atoken orderToken:(NSString *)aorderToken {
    
    self.orderId = aorderId;
    self.payType = type;
    self.payRes = res;
    self.token = atoken;
    self.orderToken = aorderToken;
    [self parametersWithProperties];
}

- (void)parametersWithProperties {
    
    NSMutableDictionary *mDic = [NSMutableDictionary dictionaryWithCapacity:10];
    [mDic setObject:_orderId forKey:@"orderNumber"];
    [mDic setObject:_payType forKey:@"type"];
    [mDic setObject:_payRes forKey:@"payRes"];
    [mDic setObject:_token forKey:@"token"];
    [mDic setObject:_orderToken forKey:@"orderToken"];
    self.parameters = mDic;
}

ResponserParserGenerate(ServiceOrderPayResResponse)

@end
