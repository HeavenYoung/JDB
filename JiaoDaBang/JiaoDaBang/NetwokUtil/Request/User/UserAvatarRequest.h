//
//  UserAvatarRequest.h
//  JiaoDaBang
//
//  Created by Heaven on 20/03/2017.
//  Copyright © 2017 Heaven. All rights reserved.
//

#import "BaseRequest.h"

@interface UserAvatarRequest : BaseRequest

- (void)setParametersWithUserId:(NSString *)userID ImageData:(NSData *)data;

@end
