//
//  ReleaseOrderRequest.h
//  JiaoDaBang
//
//  Created by Heaven on 20/03/2017.
//  Copyright © 2017 Heaven. All rights reserved.
//

#import "BaseRequest.h"

@interface ReleaseOrderRequest : BaseRequest

- (void)setParametersWithUserId:(NSString *)userId orderType:(NSString *)orderType orderTypeName:(NSString *)orderTypeName srcId:(NSString *)srcId srcDetail:(NSString *)srcDetail desId:(NSString *)desId desDetail:(NSString *)desDetail money:(NSString *)money remark:(NSString *)remark mainType:(NSString *)maintype deliveryId:(NSString *)deliveryId;

@end
