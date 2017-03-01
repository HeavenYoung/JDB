//
//  AliOrderPayRequest.h
//  MiTang_Client
//
//  Created by OTT on 16/5/13.
//  Copyright © 2016年 Heaven. All rights reserved.
//

#import "BaseRequest.h"

@interface AliOrderPayRequest : BaseRequest

- (void)setParametersOrderId:(NSString *)aorderId OrderName:(NSString *)aorderName orderDetail:(NSString *)aorderDetail fee:(CGFloat)afee token:(NSString *)atoken orderToken:(NSString *)aorderToken;

@end
