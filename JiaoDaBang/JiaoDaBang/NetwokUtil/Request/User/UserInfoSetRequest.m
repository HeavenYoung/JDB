//
//  UserInfoSetRequest.m
//  JiaoDaBang
//
//  Created by Heaven on 20/03/2017.
//  Copyright © 2017 Heaven. All rights reserved.
//

#import "UserInfoSetRequest.h"
#import "UserInfoSetResponse.h"

@interface UserInfoSetRequest ()

@property (nonatomic, copy) NSString *userId;
@property (nonatomic, copy) NSString *valueString;
@property (nonatomic, copy) NSString *keyString;

@property (nonatomic, copy) NSString *userNameString;
@property (nonatomic, copy) NSString *aliAccountString;

@end

@implementation UserInfoSetRequest

- (instancetype)init {

    self = [super init];
    if (self) {
        self.httpMethod = @"POST";
        self.URLString = @"setuserinfo";
    }
    return self;
}

- (void)setParametersWithUserId:(NSString *)userID valueString:(NSString *)valueString keyString:(NSString *)keyString {
    self.userId = userID;
    self.valueString = valueString;
    self.keyString = keyString;
}

- (void)setParametersWithUserId:(NSString *)userID userNameString:(NSString *)userNameString aliAccountString:(NSString *)aliAccountString {

    self.userId = userID;
    self.userNameString = userNameString;
    self.aliAccountString = aliAccountString;
}

- (void)parametersWithProperties {

    NSMutableDictionary *mDic = [NSMutableDictionary dictionaryWithCapacity:20];
   
    if (self.userNameString !=nil && self.aliAccountString != nil) {
        
        [mDic setObject:[Tools encryptWithPlainText:self.userId] forKey:@"userid"];
        [mDic setObject:[Tools encryptWithPlainText:self.userNameString] forKey:@"realname"];
        [mDic setObject:[Tools encryptWithPlainText:self.aliAccountString] forKey:@"aliaccount"];

    } else {
        
        [mDic setObject:[Tools encryptWithPlainText:self.valueString] forKey:self.keyString];
        [mDic setObject:[Tools encryptWithPlainText:self.userId] forKey:@"userid"];
    }
    
    
//    [mDic setObject:[Tools encryptWithPlainText:self.userId] forKey:@"userid"];
//    [mDic setObject:[Tools encryptWithPlainText:self.sexString] forKey:@"sex"];
//    [mDic setObject:[Tools encryptWithPlainText:self.schoolStr] forKey:@"school"];
//    [mDic setObject:[Tools encryptWithPlainText:self.nickName] forKey:@"nickname"];
//    [mDic setObject:[Tools encryptWithPlainText:self.payPassWord] forKey:@"paypwd"];
//    [mDic setObject:[Tools encryptWithPlainText:self.aliAccount] forKey:@"aliaccount"];
//    [mDic setObject:[Tools encryptWithPlainText:self.realName] forKey:@"realname"];
    
    self.parameters = mDic;
}

ResponserParserGenerate(UserInfoSetResponse)

@end
