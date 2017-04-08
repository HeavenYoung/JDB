//
//  WithdrawRequest.m
//  JiaoDaBang
//
//  Created by ott001 on 2017/4/8.
//  Copyright © 2017年 Heaven. All rights reserved.
//

#import "WithdrawRequest.h"
#import "WithDrawResponse.h"

@interface WithdrawRequest()

@property (nonatomic, copy) NSString *userId;
@property (nonatomic, copy) NSString *payPassword;
@property (nonatomic, copy) NSString *money;

@end

@implementation WithdrawRequest

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.URLString = @"transtoali;
        self.httpMethod = @"POST";
    }
    return self;}

- (void)setParametersWithUserId:(NSString *)userId payPassword:(NSString *)payPassword money:(NSString *)money{
    self.userId = userId;
    self.payPassword = payPassword;
    self.money = money;
}

- (void)parametersWithProperties {
    
    NSMutableDictionary *mDic = [NSMutableDictionary dictionaryWithCapacity:20];
    
    [mDic setObject:[Tools encryptWithPlainText:self.userId] forKey:@"userid"];
    [mDic setObject:[Tools encryptWithPlainText:self.payPassword] forKey:@"paypwd"];
    [mDic setObject:[Tools encryptWithPlainText:self.money] forKey:@"money"];
    self.parameters = mDic;
    
}

ResponserParserGenerate(WithDrawResponse)

@end
