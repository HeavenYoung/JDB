//
//  GetOrderListRequest.h
//  JiaoDaBang
//
//  Created by Heaven on 20/03/2017.
//  Copyright © 2017 Heaven. All rights reserved.
//

#import "BaseRequest.h"

@interface GetOrderListRequest : BaseRequest

- (void)setParametersWithUserId:(NSString *)userId acceptUserId:(NSString *)userId page:(NSString *)page action:(NSString *)action;

@end
