//
//  BillRequest.m
//  JiaoDaBang
//
//  Created by ott001 on 2017/4/8.
//  Copyright © 2017年 Heaven. All rights reserved.
//

#import "BillRequest.h"
#import "BillResponse.h"

@interface BillRequest()

@property (nonatomic, copy) NSString *userId;
@property (nonatomic, copy) NSString *page;

@end

@implementation BillRequest

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.URLString = @"getmybill";
        self.httpMethod = @"POST";
    }
    return self;}

- (void)setParametersWithUserId:(NSString *)userId page:(NSString *)page{
    self.userId = userId;
    self.page = page;
}

- (void)parametersWithProperties {
    
    NSMutableDictionary *mDic = [NSMutableDictionary dictionaryWithCapacity:20];
    
    [mDic setObject:[Tools encryptWithPlainText:self.userId] forKey:@"userid"];
    [mDic setObject:[Tools encryptWithPlainText:self.page] forKey:@"page"];
    self.parameters = mDic;
    
}

ResponserParserGenerate(BillResponse)


@end
