//
//  GetOrderByIdRequest.m
//  JiaoDaBang
//
//  Created by Heaven on 20/03/2017.
//  Copyright © 2017 Heaven. All rights reserved.
//

#import "GetOrderByIdRequest.h"
#import "GetOrderByIdResponse.h"

@interface GetOrderByIdRequest ()

@property (nonatomic, copy) NSString *userId;
@property (nonatomic, copy) NSString *orderId;

@end

@implementation GetOrderByIdRequest


- (instancetype)init {

    self = [super init];
    if (self) {
        
        self.URLString = @"getorderbyid";
        self.httpMethod = @"POST";
    }
    return self;
}

- (void)setParametersWithUserId:(NSString *)userId orderId:(NSString *)orderId {

    self.userId = userId;
    self.orderId = orderId;
}

- (void)parametersWithProperties {

    NSMutableDictionary *mDic = [NSMutableDictionary dictionaryWithCapacity:20];
    
    [mDic setObject:[Tools encryptWithPlainText:self.userId] forKey:@"releaseuserid"];
    [mDic setObject:[Tools encryptWithPlainText:self.orderId] forKey:@"orderid"];
    
    self.parameters = mDic;
}

ResponserParserGenerate(GetOrderByIdResponse)

@end
