//
//  UserLoginRequest.m
//  JiaoDaBang
//
//  Created by Heaven on 2017/2/6.
//  Copyright © 2017年 Heaven. All rights reserved.
//

#import "UserLoginRequest.h"
#import "UserLoginResponse.h"

@interface UserLoginRequest ()

@property (nonatomic, copy) NSString *userName;
@property (nonatomic, copy) NSString *passWord;

@end

@implementation UserLoginRequest

- (instancetype)init {
    self = [super init];
    if (self) {
        self.httpMethod = @"POST";
        self.URLString = @"login";
    }
    return self;

}

- (void)setParametersWithUserName:(NSString *)userName passWord:(NSString *)password {

    self.userName = userName;
    self.passWord = password;
}

- (void)parametersWithProperties {
    
    NSMutableDictionary *mDic = [NSMutableDictionary dictionaryWithCapacity:10];
    
    NSString *userName = [NSString AES128ECBEncrypt:self.userName key:EncryptoKey];
    NSString *password = [NSString AES128ECBEncrypt:self.passWord key:EncryptoKey];

    [mDic setObject:userName forKey:@"phone_num"];
    [mDic setObject:password forKey:@"password"];
    
    self.parameters = mDic;
}

ResponserParserGenerate(UserLoginResponse)

@end
