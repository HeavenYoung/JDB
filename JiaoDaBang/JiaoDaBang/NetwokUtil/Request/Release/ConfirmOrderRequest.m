//
//  ConfirmOrderRequest.m
//  JiaoDaBang
//
//  Created by Heaven on 22/03/2017.
//  Copyright © 2017 Heaven. All rights reserved.
//

#import "ConfirmOrderRequest.h"
#import "ConfirmOrderResponse.h"

@interface ConfirmOrderRequest ()

@property (nonatomic, copy) NSString *userId;
@property (nonatomic, copy) NSString *orderId;

@end

@implementation ConfirmOrderRequest

- (instancetype)init {

    self = [super init];
    if (self) {
        self.URLString = @"confirm";
        self.httpMethod = @"POST";
    }
    return self;
}

- (void)setParametersWithReleasedUserId:(NSString *)userId orderId:(NSString *)orderId {

    self.userId = userId;
    self.orderId = orderId;
}

- (void)parametersWithProperties {
    NSMutableDictionary *mDic = [NSMutableDictionary dictionaryWithCapacity:20];
    
    [mDic setObject:[Tools encryptWithPlainText:self.userId] forKey:@"releaseuserid"];
    [mDic setObject:[Tools encryptWithPlainText:self.orderId] forKey:@"orderid"];
    
    self.parameters = mDic;

}

ResponserParserGenerate(ConfirmOrderResponse)

@end

