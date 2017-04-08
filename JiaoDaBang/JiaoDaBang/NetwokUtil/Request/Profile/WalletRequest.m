//
//  WalletRequest.m
//  JiaoDaBang
//
//  Created by ott001 on 2017/4/7.
//  Copyright © 2017年 Heaven. All rights reserved.
//

#import "WalletRequest.h"
#import "WalletResponse.h"

@interface WalletRequest()

@property (nonatomic, copy) NSString *userId;

@end

@implementation WalletRequest

- (instancetype)init{
    self = [super init];
    if (self) {
        self.URLString = @"getmymoney";
        self.httpMethod = @"POST";
    }
    return self;

}

- (void)setParametersWithUserId:(NSString *)userId{
    self.userId = userId;
}

- (void)parametersWithProperties {
    
    NSMutableDictionary *mDic = [NSMutableDictionary dictionaryWithCapacity:20];
    
    [mDic setObject:[Tools encryptWithPlainText:self.userId] forKey:@"userid"];
    self.parameters = mDic;
    
}

ResponserParserGenerate(WalletResponse)

@end
