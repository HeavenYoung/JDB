//
//  UserForgetRequest.m
//  JiaoDaBang
//
//  Created by Heaven on 18/03/2017.
//  Copyright © 2017 Heaven. All rights reserved.
//

#import "UserForgetRequest.h"
#import "UserForgetResponse.h"

@interface UserForgetRequest ()

@property (nonatomic, copy) NSString *phoneNumber;

@end

@implementation UserForgetRequest

- (instancetype)init {

    self = [super init];
    if (self) {
        self.URLString = @"forget";
        self.httpMethod = @"POST";
    }
    return self;
}

- (void)setParametersWithPhoneNumber:(NSString *)phoneNumber {
    
    self.phoneNumber = phoneNumber;
}

- (void)parametersWithProperties {

    NSMutableDictionary *mDic = [NSMutableDictionary dictionaryWithCapacity:10];
    
    NSString *phoneNumber = [Tools encryptWithPlainText:self.phoneNumber];

    [mDic setObjectSafe:phoneNumber forKey:@"phone_num"];
    
    self.parameters = mDic;
}

ResponserParserGenerate(UserForgetResponse);

@end
