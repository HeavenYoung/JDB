//
//  ServiceOrderPayResRequest.h
//  MiTang_Client
//
//  Created by OTT on 16/6/27.
//  Copyright © 2016年 Heaven. All rights reserved.
//

#import "BaseRequest.h"

@interface ServiceOrderPayResRequest : BaseRequest

- (void)setParametersOrderId:(NSString *)aorderId payType:(NSString *)type payRes:(NSString *)res token:(NSString *)atoken orderToken:(NSString *)aorderToken;

@end
