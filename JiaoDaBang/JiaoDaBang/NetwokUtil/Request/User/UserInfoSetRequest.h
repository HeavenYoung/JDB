//
//  UserInfoSetRequest.h
//  JiaoDaBang
//
//  Created by Heaven on 20/03/2017.
//  Copyright © 2017 Heaven. All rights reserved.
//

#import "BaseRequest.h"

@interface UserInfoSetRequest : BaseRequest

- (void)setParametersWithUserId:(NSString *)userID sexString:(NSString *)sexString school:(NSString *)schoolStr nickName:(NSString *)nickName payPassWord:(NSString *)payPassWord aliAccount:(NSString *)aliAccount realName:(NSString *)realName;

@end
