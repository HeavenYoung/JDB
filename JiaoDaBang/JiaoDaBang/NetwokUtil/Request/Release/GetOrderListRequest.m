//
//  GetOrderListRequest.m
//  JiaoDaBang
//
//  Created by Heaven on 20/03/2017.
//  Copyright © 2017 Heaven. All rights reserved.
//

#import "GetOrderListRequest.h"
#import "GetOrderListResponse.h"

@interface GetOrderListRequest ()

@property (nonatomic, copy) NSString *userId;
@property (nonatomic, copy) NSString *acceptUserId;
@property (nonatomic, copy) NSString *page;
@property (nonatomic, copy) NSString *action;

@end

@implementation GetOrderListRequest

- (instancetype)init {
    
    self = [super init];
    if (self) {
        
        self.URLString = @"getorder";
        self.httpMethod = @"POST";
    }
    return self;
}

- (void)setParametersWithUserId:(NSString *)userId acceptUserId:(NSString *)acceptUserId page:(NSString *)page action:(NSString *) {

    self.userId = userId;
    self.acceptUserId = acceptUserId;
    self.page = page;
    self.action = action;
}

- (void)parametersWithProperties {
    NSMutableDictionary *mDic = [NSMutableDictionary dictionaryWithCapacity:20];
    
    [mDic setObject:[Tools encryptWithPlainText:self.userId] forKey:@"releaseuserid"];
    [mDic setObject:[Tools encryptWithPlainText:self.acceptUserId] forKey:@"acceptuserid"];
    [mDic setObject:[Tools encryptWithPlainText:self.page] forKey:@"page"];
    [mDic setObject:[Tools encryptWithPlainText:self.action] forKey:@"action"];
    
    self.parameters = mDic;

}

ResponserParserGenerate(GetOrderListResponse)

@end
