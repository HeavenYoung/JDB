//
//  UserAvatarRequest.m
//  JiaoDaBang
//
//  Created by Heaven on 20/03/2017.
//  Copyright © 2017 Heaven. All rights reserved.
//

#import "UserAvatarRequest.h"
#import "UserAvatarResponse.h"

@interface UserAvatarRequest ()

@property (nonatomic, strong) NSString *userId;
@property (nonatomic, strong) NSData *data;

@end

@implementation UserAvatarRequest

- (instancetype)init {
    
    self = [super init];
    if (self) {
        self.URLString = @"setavatar";
        self.httpMethod = @"POST-UPLOAD";
    }
    return self;
}

- (void)setParametersWithUserId:(NSString *)userID ImageData:(NSData *)data {

    self.userId = userID;
    self.data = data;
}

- (void)parametersWithProperties {

    NSMutableDictionary *mDic = [NSMutableDictionary dictionaryWithCapacity:20];
    
    [mDic setObject:[Tools encryptWithPlainText:self.userId] forKey:@"userid"];
    [mDic setObject:self.data forKey:@"avatar"];
    
    self.parameters = mDic;

}

ResponserParserGenerate(UserAvatarResponse)

@end
