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

@property (nonatomic, strong) NSString *userId;
@property (nonatomic, strong) NSString *sexString;
@property (nonatomic, strong) NSString *schoolStr;
@property (nonatomic, strong) NSString *nickName;
@property (nonatomic, strong) NSString *payPassWord;
@property (nonatomic, strong) NSString *aliAccount;
@property (nonatomic, strong) NSString *realName;

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

- (void)setParametersWithUserId:(NSString *)userID sexString:(NSString *)sexString school:(NSString *)schoolStr nickName:(NSString *)nickName payPassWord:(NSString *)payPassWord aliAccount:(NSString *)aliAccount realName:(NSString *)realName {

    self.userId = userID;
    self.sexString = sexString;
    self.schoolStr = schoolStr;
    self.nickName = nickName;
    self.payPassWord = payPassWord;
    self.aliAccount = aliAccount;
    self.realName = realName;
}

- (void)parametersWithProperties {

    NSMutableDictionary *mDic = [NSMutableDictionary dictionaryWithCapacity:20];
    
    [mDic setObject:[Tools encryptWithPlainText:self.userId] forKey:@"userid"];
    [mDic setObject:[Tools encryptWithPlainText:self.sexString] forKey:@"sex"];
    [mDic setObject:[Tools encryptWithPlainText:self.schoolStr] forKey:@"school"];
    [mDic setObject:[Tools encryptWithPlainText:self.nickName] forKey:@"nickname"];
    [mDic setObject:[Tools encryptWithPlainText:self.payPassWord] forKey:@"paypwd"];
    [mDic setObject:[Tools encryptWithPlainText:self.aliAccount] forKey:@"aliaccount"];
    [mDic setObject:[Tools encryptWithPlainText:self.realName] forKey:@"realname"];
    
    self.parameters = mDic;
}

ResponserParserGenerate(UserInfoSetResponse)

@end
