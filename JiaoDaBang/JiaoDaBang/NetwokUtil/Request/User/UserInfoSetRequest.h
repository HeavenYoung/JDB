//
//  UserInfoSetRequest.h
//  JiaoDaBang
//
//  Created by Heaven on 20/03/2017.
//  Copyright © 2017 Heaven. All rights reserved.
//

#import "BaseRequest.h"

@interface UserInfoSetRequest : BaseRequest

- (void)setParametersWithUserId:(NSString *)userID valueString:(NSString *)valueString keyString:(NSString *)keyString;

- (void)setParametersWithUserId:(NSString *)userID userNameString:(NSString *)userNameString aliAccountString:(NSString *)aliAccountString;


@end
