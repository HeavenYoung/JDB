//
//  UserAvatarResponse.m
//  JiaoDaBang
//
//  Created by Heaven on 20/03/2017.
//  Copyright © 2017 Heaven. All rights reserved.
//

#import "UserAvatarResponse.h"

@implementation UserAvatarResponse

- (void)parseResponseObject {
    
    NSDictionary *jsonObject = self.responseObject;
    NSInteger code = [[jsonObject objectForKey:@"state"] integerValue];
    
    if (code == CODE_SUCCESS) {
        NSDictionary *mDict = [jsonObject objectForKey:@"data"];
        
        if (mDict && [mDict isKindOfClass:[NSDictionary class]]) {
            
            NSString *avatarUrl = [mDict objectForKey:@"avatar"];
            
            [self showSuccessInfo:avatarUrl];
        } else {
            [self showFailureInfo:NETWORK_ERROR_UNKNOW];
        }
    } else {
        
        [self showFailureInfo:code];
    }
    
}

@end
