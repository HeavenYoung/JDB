//
//  FeedbackRequest.h
//  JiaoDaBang
//
//  Created by ott001 on 2017/4/5.
//  Copyright © 2017年 Heaven. All rights reserved.
//

#import "BaseRequest.h"

@interface FeedbackRequest : BaseRequest

- (void)setParametersWithUserId:(NSString *)userId content:(NSString *)content;

@end
