//
//  UserInfoSetResponse.m
//  JiaoDaBang
//
//  Created by Heaven on 20/03/2017.
//  Copyright © 2017 Heaven. All rights reserved.
//

#import "UserInfoSetResponse.h"

@implementation UserInfoSetResponse

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
