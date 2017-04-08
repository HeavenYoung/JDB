//
//  WithDrawResponse.m
//  JiaoDaBang
//
//  Created by ott001 on 2017/4/8.
//  Copyright © 2017年 Heaven. All rights reserved.
//

#import "WithDrawResponse.h"

@implementation WithDrawResponse

- (void)parseResponseObject {
    
    NSDictionary *jsonObject = self.responseObject;
    
    NSInteger code = [[jsonObject objectForKey:@"state"] integerValue];
    
    if (code == CODE_SUCCESS) {
        
        [self showSuccessInfo:self.responseObject];
    }  else {
        
        [self showFailureInfo:code];
        
    }
    
    
}
@end
