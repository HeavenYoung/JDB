//
//  UserLoginRequest.h
//  JiaoDaBang
//
//  Created by Heaven on 2017/2/6.
//  Copyright © 2017年 Heaven. All rights reserved.
//

#import "BaseRequest.h"

@interface UserLoginRequest : BaseRequest

- (void)setParametersWithUserName:(NSString *)userName passWord:(NSString *)password;

@end
