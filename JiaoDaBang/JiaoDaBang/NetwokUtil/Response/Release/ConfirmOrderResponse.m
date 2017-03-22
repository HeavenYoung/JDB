//
//  ConfirmOrderResponse.m
//  JiaoDaBang
//
//  Created by Heaven on 22/03/2017.
//  Copyright © 2017 Heaven. All rights reserved.
//

#import "ConfirmOrderResponse.h"

@implementation ConfirmOrderResponse

- (void)parseResponseObject {
    
    NSDictionary *jsonObject = self.responseObject;
    NSInteger code = [[[jsonObject objectForKey:@"status"] objectForKey:@"code"] integerValue];
    
    if (code == CODE_SUCCESS) {
        
        [self showSuccessInfo:self.responseObject];
    } else {
        
        [self showFailureInfo:NETWORK_ERROR_UNKNOW];
    }
} else {
    
    [self showFailureInfo:code];
}

}

@end
