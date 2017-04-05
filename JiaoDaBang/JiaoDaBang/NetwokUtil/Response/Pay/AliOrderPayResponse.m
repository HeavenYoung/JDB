//
//  AliOrderPayResponse.m
//  MiTang_Client
//
//  Created by OTT on 16/5/13.
//  Copyright © 2016年 Heaven. All rights reserved.
//

#import "AliOrderPayResponse.h"
#import "AliOrderPayData.h"

@implementation AliOrderPayResponse

- (void)parseResponseObject {
    
    NSDictionary *jsonObject = self.responseObject;
    NSInteger code = [[jsonObject objectForKey:@"state"] integerValue];    
    if (code == CODE_SUCCESS) {
        NSDictionary *mData = [jsonObject objectForKey:@"data"];
        
        if (mData && [mData isKindOfClass:[NSDictionary class]]) {
            
            AliOrderPayData *payData = [[AliOrderPayData alloc] init];
            payData.orderStr = [mData objectForKey:@"sign"];
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
