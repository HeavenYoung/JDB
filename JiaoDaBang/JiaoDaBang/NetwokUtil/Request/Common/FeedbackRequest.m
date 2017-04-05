//
//  FeedbackRequest.m
//  JiaoDaBang
//
//  Created by ott001 on 2017/4/5.
//  Copyright © 2017年 Heaven. All rights reserved.
//

#import "FeedbackRequest.h"
#import "FeedbackResponse.h"

@interface FeedbackRequest()

@property (nonatomic, copy) NSString *userId;
@property (nonatomic, copy) NSString *content;

@end

@implementation FeedbackRequest

- (instancetype)init {
    
    self = [super init];
    if (self) {
        self.URLString = @"advice";
        self.httpMethod = @"POST";
    }
    return self;
}

- (void)setParametersWithUserId:(NSString *)userId content:(NSString *)content{
    self.userId = userId;
    self.content = content;
}

- (void)parametersWithProperties {
    NSMutableDictionary *mDic = [NSMutableDictionary dictionaryWithCapacity:20];
    
    [mDic setObject:[Tools encryptWithPlainText:self.userId] forKey:@"userid"];
    [mDic setObject:[Tools encryptWithPlainText:self.content] forKey:@"content"];
    
    self.parameters = mDic;
    
}

ResponserParserGenerate(FeedbackResponse)

@end
