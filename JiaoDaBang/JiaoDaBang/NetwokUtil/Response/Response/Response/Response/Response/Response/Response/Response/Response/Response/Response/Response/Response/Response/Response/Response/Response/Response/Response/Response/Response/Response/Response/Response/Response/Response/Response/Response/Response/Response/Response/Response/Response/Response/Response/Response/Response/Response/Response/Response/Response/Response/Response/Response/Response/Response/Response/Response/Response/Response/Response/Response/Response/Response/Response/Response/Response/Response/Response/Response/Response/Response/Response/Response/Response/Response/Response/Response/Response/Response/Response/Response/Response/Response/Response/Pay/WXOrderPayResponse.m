//
//  OrderPayResponse.m
//  MiTang_Client
//
//  Created by OTT on 16/5/12.
//  Copyright © 2016年 Heaven. All rights reserved.
//

#import "WXOrderPayResponse.h"
#import "WXOrderPayData.h"

@implementation WXOrderPayResponse

- (void)parseResponseObject {
    
    NSDictionary *jsonObject = self.responseObject;
    NSInteger code = [[[jsonObject objectForKey:@"status"] objectForKey:@"code"] integerValue];
    
    if (code == CODE_SUCCESS) {
        NSDictionary *mData = [jsonObject objectForKey:@"data"];
        
        if (mData && [mData isKindOfClass:[NSDictionary class]]) {
            
            WXOrderPayData *payData = [[WXOrderPayData alloc] init];
            payData.appid = [mData objectForKey:@"appid"];
            payData.partnerid = [mData objectForKey:@"partnerid"];
            payData.prepayid = [mData objectForKey:@"prepayid"];
            payData.package = [mData objectForKey:@"package"];
            payData.noncestr = [mData objectForKey:@"noncestr"];
            payData.timestamp = [mData objectForKey:@"timestamp"];
            payData.sign =  [mData objectForKey:@"sign"];
            payData.callbackUrl = [mData objectForKey:@"backurl"];
            
            [self showSuccessInfo:payData];
        }
        else {
            [self showFailureInfo:NETWORK_ERROR_UNKNOW];
        }
    }
    else {
        [self showFailureInfo:code];
    }
}


@end
