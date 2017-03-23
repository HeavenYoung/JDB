//
//  UserUpdatePasswordRequest.m
//  JiaoDaBang
//
//  Created by Heaven on 22/03/2017.
//  Copyright © 2017 Heaven. All rights reserved.
//

#import "UserUpdatePasswordRequest.h"
#import "UserUpdatePasswordResponse.h"

@interface UserUpdatePasswordRequest()

@property (nonatomic, copy) NSString *userId;
@property (nonatomic, copy) NSString *password;
@property (nonatomic, copy) NSString *nPassword;

@end

@implementation UserUpdatePasswordRequest

- (instancetype)init {
    
    self = [super init];
    if (self) {
        self.URLString = @"updatepassword";
        self.httpMethod = @"POST";
    }
    return self;
}

- (void) setParametersWithUserId:(NSString *)userId password:(NSString *)password newPassword:(NSString *)newPassword {
    self.userId = userId;
    self.password = password;
    self.nPassword = newPassword;
}

- (void)parametersWithProperties {
    NSMutableDictionary *mDic = [NSMutableDictionary dictionaryWithCapacity:20];
    
    [mDic setObject:[Tools encryptWithPlainText:self.userId] forKey:@"userid"];
    [mDic setObject:[Tools encryptWithPlainText:self.password] forKey:@"password"];
    [mDic setObject:[Tools encryptWithPlainText:self.nPassword] forKey:@"newpassword"];
    
    self.parameters = mDic;
    
}

ResponserParserGenerate(UserUpdatePasswordResponse)

@end
