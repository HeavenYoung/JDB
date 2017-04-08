//
//  WalletResponse.m
//  JiaoDaBang
//
//  Created by ott001 on 2017/4/7.
//  Copyright © 2017年 Heaven. All rights reserved.
//

#import "WalletResponse.h"
#import "WalletData.h"

@implementation WalletResponse

- (void)parseResponseObject {
    
    NSDictionary *jsonObject = self.responseObject;
    
    NSInteger code = [[jsonObject objectForKey:@"state"] integerValue];
    if (code == CODE_SUCCESS) {
        NSDictionary *mData = [jsonObject objectForKey:@"data"];
        
        if (mData && [mData isKindOfClass:[NSDictionary class]]) {
            
            WalletData *walletData = [[WalletData alloc] init];
            walletData.money = [mData objectForKey:@"money"];
            [self showSuccessInfo:walletData];
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
