//
//  WithdrawRequest.h
//  JiaoDaBang
//
//  Created by ott001 on 2017/4/8.
//  Copyright © 2017年 Heaven. All rights reserved.
//

#import "BaseRequest.h"

@interface WithdrawRequest : BaseRequest

- (void)setParametersWithUserId:(NSString *)userId payPassword:(NSString *)payPassword money:(NSString *)money;

@end
