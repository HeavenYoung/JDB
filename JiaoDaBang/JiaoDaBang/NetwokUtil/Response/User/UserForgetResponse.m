//
//  UserForgetResponse.m
//  JiaoDaBang
//
//  Created by Heaven on 18/03/2017.
//  Copyright © 2017 Heaven. All rights reserved.
//

#import "UserForgetResponse.h"

@implementation UserForgetResponse

- (void)parseResponseObject {
    
    NSDictionary *jsonObject = self.responseObject;
    
    NSInteger code = [[jsonObject objectForKey:@"state"] integerValue];
    
    if (code == CODE_SUCCESS) {
        
        [self showSuccessInfo:self.responseObject];

    } else {
        
        [self showFailureInfo:code];
    }
    
}

@end
