//
//  OrderPayRequest.h
//  MiTang_Client
//
//  Created by OTT on 16/5/12.
//  Copyright © 2016年 Heaven. All rights reserved.
//

#import "BaseRequest.h"

@interface WXOrderPayRequest : BaseRequest

- (void)setParametersOrderId:(NSString *)aorderId goodsName:(NSString *)agoodName price:(CGFloat)aprice token:(NSString *)atoken orderToken:(NSString *)aorderToken;

@end
