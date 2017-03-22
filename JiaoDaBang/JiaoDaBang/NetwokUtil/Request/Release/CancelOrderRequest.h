//
//  CancelOrderRequest.h
//  JiaoDaBang
//
//  Created by Heaven on 22/03/2017.
//  Copyright © 2017 Heaven. All rights reserved.
//

#import "BaseRequest.h"

@interface CancelOrderRequest : BaseRequest

- (void)setParametersWithReleasedUserId:(NSString *)userId orderId:(NSString *)orderId;


@end
