//
//  UserForgetCheckRequest.h
//  JiaoDaBang
//
//  Created by Heaven on 18/03/2017.
//  Copyright © 2017 Heaven. All rights reserved.
//

#import "BaseRequest.h"

@interface UserForgetCheckRequest : BaseRequest

- (void)setParametersWithPhoneNumber:(NSString *)phoneNumber password:(NSString *)password messageCode:(NSString *)messageCode;

@end
