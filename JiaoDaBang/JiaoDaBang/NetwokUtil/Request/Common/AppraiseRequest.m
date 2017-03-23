//
//  AppraiseRequest.m
//  JiaoDaBang
//
//  Created by Heaven on 22/03/2017.
//  Copyright © 2017 Heaven. All rights reserved.
//

#import "AppraiseRequest.h"
#import "AppraiseResponse.h"

@interface AppraiseRequest()

@property (nonatomic, copy) NSString *releaseuserId;
@property (nonatomic, copy) NSString *orderId;
@property (nonatomic, copy) NSString *appraiseContent;
@property (nonatomic, copy) NSString *appraiseLevel;
@property (nonatomic, copy) NSString *appraiseLabelId;

@end

@implementation AppraiseRequest

- (instancetype)init {
    
    self = [super init];
    if (self) {
        self.URLString = @"appraise";
        self.httpMethod = @"POST";
    }
    return self;
}

- (void)setParametersWithReleasedUserId:(NSString *)releaseuserId orderId:(NSString *)orderId AppraiseContent:(NSString *)appraiseContent AppraiseLevel:(NSString *)appraiseLevel AppraiseLevelId:(NSString *)appraiseLabelId{
    
    self.releaseuserId = releaseuserId;
    self.orderId = orderId;
    self.appraiseContent = appraiseContent;
    self.appraiseLevel = appraiseLevel;
    self.appraiseLabelId = appraiseLabelId;
}

- (void)parametersWithProperties {
    NSMutableDictionary *mDic = [NSMutableDictionary dictionaryWithCapacity:20];
    
    [mDic setObject:[Tools encryptWithPlainText:self.releaseuserId] forKey:@"releaseuserid"];
    [mDic setObject:[Tools encryptWithPlainText:self.orderId] forKey:@"orderid"];
    [mDic setObject:[Tools encryptWithPlainText:self.appraiseContent] forKey:@"appraisecontent"];
    [mDic setObject:[Tools encryptWithPlainText:self.appraiseLevel] forKey:@"appraiselevel"];
    [mDic setObject:[Tools encryptWithPlainText:self.appraiseLabelId] forKey:@"appraiselabelid"];
    
    self.parameters = mDic;
    
}

ResponserParserGenerate(AppraiseResponse)

@end
