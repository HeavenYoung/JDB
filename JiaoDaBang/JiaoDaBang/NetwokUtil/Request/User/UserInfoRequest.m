//
//  UserInfoRequest.m
//  JiaoDaBang
//
//  Created by Heaven on 18/03/2017.
//  Copyright © 2017 Heaven. All rights reserved.
//

#import "UserInfoRequest.h"
#import "UserInfoResponse.h"

@interface UserInfoRequest ()

@property (nonatomic, copy) NSString *userId;

@end

@implementation UserInfoRequest

- (instancetype)init {

    self = [super init];
    if (self) {
        self.URLString = @"getuserinfo";

        self.httpMethod = @"POST";
    }
    return self;
}

- (void)setParametersWithUserId:(NSString *)userId {

    self.userId = userId;
}

- (void)parametersWithProperties {
    NSMutableDictionary *mDic = [NSMutableDictionary dictionaryWithCapacity:10];
    
    NSString *userId = [NSString AES128ECBEncrypt:self.userId key:EncryptoKey];
    
    [mDic setObject:userId forKey:@"userid"];
    
    self.parameters = mDic;

}

ResponserParserGenerate(UserInfoResponse)

@end
