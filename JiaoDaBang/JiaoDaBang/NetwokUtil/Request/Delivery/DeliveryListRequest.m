//
//  DeliveryListRequest.m
//  JiaoDaBang
//
//  Created by Heaven on 18/03/2017.
//  Copyright © 2017 Heaven. All rights reserved.
//

#import "DeliveryListRequest.h"
#import "DeliveryListResponse.h"

@interface DeliveryListRequest ()

@property (nonatomic, copy) NSString *userId;

@end

@implementation DeliveryListRequest

- (instancetype)init {

    self = [super init];
    if (self) {
        self.URLString = @"deliverylist";
        self.httpMethod = @"POST";
    }
    return self;
}

- (void)setParametersWithUserId:(NSString *)userId {

    self.userId = userId;
}

- (void)parametersWithProperties {

    NSMutableDictionary *mDic = [NSMutableDictionary dictionaryWithCapacity:10];
    
    NSString *userId = [Tools encryptWithPlainText:self.userId];
    
    [mDic setObject:userId forKey:@"userid"];
    
    self.parameters = mDic;

}

ResponserParserGenerate(DeliveryListResponse)

@end
