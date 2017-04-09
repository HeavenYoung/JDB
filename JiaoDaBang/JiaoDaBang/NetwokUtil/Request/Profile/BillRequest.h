//
//  BillRequest.h
//  JiaoDaBang
//
//  Created by ott001 on 2017/4/8.
//  Copyright © 2017年 Heaven. All rights reserved.
//

#import "BaseRequest.h"

@interface BillRequest : BaseRequest

- (void)setParametersWithUserId:(NSString *)userId page:(NSString *)page;

@end
