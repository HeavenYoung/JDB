//
//  AppraiseResponse.m
//  JiaoDaBang
//
//  Created by Heaven on 22/03/2017.
//  Copyright © 2017 Heaven. All rights reserved.
//

#import "AppraiseResponse.h"

@implementation AppraiseResponse

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
