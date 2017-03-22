//
//  ReleaseOrderResponse.m
//  JiaoDaBang
//
//  Created by Heaven on 20/03/2017.
//  Copyright © 2017 Heaven. All rights reserved.
//

#import "ReleaseOrderResponse.h"

@implementation ReleaseOrderResponse

- (void)parseResponseObject {
    
    NSDictionary *jsonObject = self.responseObject;
    
    NSInteger code = [[jsonObject objectForKey:@"state"] integerValue];
    
    if (code == CODE_SUCCESS) {
        
        NSDictionary *dataDic = [jsonObject objectForKeySafe:@"data"];
        if ([dataDic isKindOfClass:[NSDictionary class]]) {
            
            ReleaseData *releaseData = [[ReleaseData alloc] init];
            releaseData.orderid = [dataDic objectForKeySafe:@"orderid"];
            
            [self showSuccessInfo:releaseData];
            
        } else {
            
            [self showFailureInfo:NETWORK_ERROR_PARSE_FAILED];
            
        }
        
    } else {
        
        [self showFailureInfo:code];
    }
    
}


@end
