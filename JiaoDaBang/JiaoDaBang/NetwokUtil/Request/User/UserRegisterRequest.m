//
//  UserRegisterRequest.m
//  JiaoDaBang
//
//  Created by Heaven on 2017/2/9.
//  Copyright © 2017年 Heaven. All rights reserved.
//

#import "UserRegisterRequest.h"
#import "UserRegisterResponse.h"

@interface UserRegisterRequest ()

@property (nonatomic, copy) NSString *phoneNumber;
@property (nonatomic, copy) NSString *passWord;
@property (nonatomic, copy) NSString *messageCode;

@end

@implementation UserRegisterRequest

- (instancetype)init {

    self = [super init];
    if (self) {
        self.URLString = @"registercheck";
        self.httpMethod = @"POST";
    }
    return self;
}

- (void)setParametersWithPhoneNumber:(NSString *)phoneNumber password:(NSString *)password messageCode:(NSString *)messageCode {

    self.phoneNumber = phoneNumber;
    self.passWord = password;
    self.messageCode = messageCode;
}

- (void)parametersWithProperties {

    NSMutableDictionary *mDic = [NSMutableDictionary dictionaryWithCapacity:10];
    [mDic setObjectSafe:self.phoneNumber forKey:@"username"];
    [mDic setObjectSafe:self.passWord forKey:@"password"];
    [mDic setObjectSafe:self.messageCode forKey:@"value"];

    self.parameters = mDic;
}

ResponserParserGenerate(UserRegisterResponse);

@end
