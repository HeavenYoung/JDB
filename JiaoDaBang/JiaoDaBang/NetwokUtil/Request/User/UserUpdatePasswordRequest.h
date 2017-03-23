//
//  UserUpdatePasswordRequest.h
//  JiaoDaBang
//
//  Created by Heaven on 22/03/2017.
//  Copyright © 2017 Heaven. All rights reserved.
//

#import "BaseRequest.h"

@interface UserUpdatePasswordRequest : BaseRequest

- (void)setParametersWithUserId:(NSString *)userId password:(NSString *)password newPassword:(NSString *)newPassword;

@end
