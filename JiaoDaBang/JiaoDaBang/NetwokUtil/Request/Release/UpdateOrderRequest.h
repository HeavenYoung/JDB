//
//  UpdateOrderRequest.h
//  JiaoDaBang
//
//  Created by Heaven on 22/03/2017.
//  Copyright © 2017 Heaven. All rights reserved.
//

#import "BaseRequest.h"

@interface UpdateOrderRequest : BaseRequest

- (void)setParametersWithReleasedUserId:(NSString *)releaseuserId orderId:(NSString *)orderId orderType:(NSString *)orderType orderTypeName:(NSString *)orderTypeName srcId:(NSString *)srcId srcDetail:(NSString *)srcDetail desId:(NSString *)desId desDetail:(NSString *)desDetail remark:(NSString *)remark;

@end
