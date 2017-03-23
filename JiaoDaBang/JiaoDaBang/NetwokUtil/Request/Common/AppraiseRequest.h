//
//  AppraiseRequest.h
//  JiaoDaBang
//
//  Created by Heaven on 22/03/2017.
//  Copyright © 2017 Heaven. All rights reserved.
//

#import "BaseRequest.h"

@interface AppraiseRequest : BaseRequest

- (void)setParametersWithReleasedUserId:(NSString *)releaseuserId orderId:(NSString *)orderId AppraiseContent:(NSString *)appraiseContent AppraiseLevel:(NSString *)appraiseLevel AppraiseLevelId:(NSString *)appraiseLabelId;

@end
