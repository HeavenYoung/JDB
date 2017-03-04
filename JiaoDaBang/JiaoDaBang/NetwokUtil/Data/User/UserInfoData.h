//
//  UserInfoData.h
//  JiaoDaBang
//
//  Created by Heaven on 2017/2/8.
//  Copyright © 2017年 Heaven. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UserInfoData : NSObject

@property (nonatomic, copy) NSString *userId;
@property (nonatomic, copy) NSString *userName;
@property (nonatomic, copy) NSString *userPhoneNum;
@property (nonatomic, copy) NSString *userSchool;
@property (nonatomic, copy) NSString *userAvatar;
@property (nonatomic, copy) NSString *userSex;
@property (nonatomic, copy) NSString *userNickName;
@property (nonatomic, copy) NSString *userRealName;
@property (nonatomic, copy) NSString *userSchoolNum;
@property (nonatomic, copy) NSString *userClassName;
@property (nonatomic, assign) NSInteger userType;
@property (nonatomic, copy) NSString *userTypeName;
@property (nonatomic, assign) NSInteger userGroup;
@property (nonatomic, copy) NSString *userCreateTime;
@property (nonatomic, copy) NSString *userauthId;

@end