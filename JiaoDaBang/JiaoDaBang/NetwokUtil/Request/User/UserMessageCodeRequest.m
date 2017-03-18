//
//  UserMessageCodeRequest.m
//  JiaoDaBang
//
//  Created by Heaven on 2017/2/9.
//  Copyright © 2017年 Heaven. All rights reserved.
//

#import "UserMessageCodeRequest.h"
#import "UserMessageCodeResponse.h"

@interface UserMessageCodeRequest ()

@property (nonatomic, copy) NSString *phoneNumber;

@end

@implementation UserMessageCodeRequest

- (instancetype)init {
    
    self = [super init];
    if (self) {
        self.URLString = @"register";
        self.httpMethod = @"POST";
    }
    return self;
}

- (void)setParametersWithPhoneNumber:(NSString *)phoneNumber {
    
    self.phoneNumber = phoneNumber;
    
    [self parametersWithProperties];
}

- (void)parametersWithProperties {
    
    NSMutableDictionary *mDic = [NSMutableDictionary dictionaryWithCapacity:10];
    NSString *phoneNumber = [NSString AES128ECBEncrypt:self.phoneNumber key:EncryptoKey];
    
    [mDic setObject:phoneNumber forKey:@"username"];
    
    self.parameters = mDic;
    
}

ResponserParserGenerate(UserMessageCodeResponse);

@end
