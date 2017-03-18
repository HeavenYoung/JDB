//
//  UserForgetCheckRequest.m
//  JiaoDaBang
//
//  Created by Heaven on 18/03/2017.
//  Copyright © 2017 Heaven. All rights reserved.
//

#import "UserForgetCheckRequest.h"
#import "UserForgetCheckResponse.h"

@interface UserForgetCheckRequest ()

@property (nonatomic, copy) NSString *phoneNumber;
@property (nonatomic, copy) NSString *passWord;
@property (nonatomic, copy) NSString *messageCode;

@end

@implementation UserForgetCheckRequest

- (instancetype)init {
    
    self = [super init];
    if (self) {
        self.URLString = @"forgetcheck";
        self.httpMethod = @"POST";
    }
    return self;
}

- (void)setParametersWithPhoneNumber:(NSString *)phoneNumber password:(NSString *)password messageCode:(NSString *)messageCode{
    
    self.phoneNumber = phoneNumber;
    
    [self parametersWithProperties];
}

- (void)parametersWithProperties {
    
    NSMutableDictionary *mDic = [NSMutableDictionary dictionaryWithCapacity:10];
    NSString *phoneNumber = [NSString AES128ECBEncrypt:self.phoneNumber key:EncryptoKey];
    NSString *passWord = [NSString AES128ECBEncrypt:self.passWord key:EncryptoKey];
    NSString *messageCode = [NSString AES128ECBEncrypt:self.messageCode key:EncryptoKey];
    
    [mDic setObjectSafe:phoneNumber forKey:@"phone_num"];
    [mDic setObjectSafe:passWord forKey:@"password"];
    [mDic setObjectSafe:messageCode forKey:@"value"];
    
    self.parameters = mDic;
    
}

ResponserParserGenerate(UserForgetCheckResponse);

@end
