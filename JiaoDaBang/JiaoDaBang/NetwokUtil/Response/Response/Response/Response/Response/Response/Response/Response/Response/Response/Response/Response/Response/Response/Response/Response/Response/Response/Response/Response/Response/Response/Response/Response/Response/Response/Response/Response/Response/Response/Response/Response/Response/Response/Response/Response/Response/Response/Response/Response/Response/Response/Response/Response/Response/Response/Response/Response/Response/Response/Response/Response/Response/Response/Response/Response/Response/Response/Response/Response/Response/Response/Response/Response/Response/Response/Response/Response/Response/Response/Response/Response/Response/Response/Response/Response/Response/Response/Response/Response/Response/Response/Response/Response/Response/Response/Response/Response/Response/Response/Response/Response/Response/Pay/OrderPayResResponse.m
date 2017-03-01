//
//  OrderPayResResponse.m
//  MiTang_Client
//
//  Created by OTT on 16/5/21.
//  Copyright © 2016年 Heaven. All rights reserved.
//

#import "OrderPayResResponse.h"

@implementation OrderPayResResponse

- (void)parseResponseObject {
    
    NSDictionary *jsonObject = self.responseObject;
    NSInteger code = [[[jsonObject objectForKey:@"status"] objectForKey:@"code"] integerValue];
    
    if (code == CODE_SUCCESS) {
        
        if (jsonObject && [jsonObject isKindOfClass:[NSDictionary class]]) {
            
            [self showSuccessInfo:jsonObject];
        } else {
            
            [self showFailureInfo:NETWORK_ERROR_UNKNOW];
        }
    } else {
        
        [self showFailureInfo:code];
    }
    
}

@end
