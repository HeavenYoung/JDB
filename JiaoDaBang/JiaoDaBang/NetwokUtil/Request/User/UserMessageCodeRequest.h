//
//  UserMessageCodeRequest.h
//  JiaoDaBang
//
//  Created by Heaven on 2017/2/9.
//  Copyright © 2017年 Heaven. All rights reserved.
//

#import "BaseRequest.h"

@interface UserMessageCodeRequest : BaseRequest

- (void)setParametersWithPhoneNumber:(NSString *)phoneNumber;

@end
