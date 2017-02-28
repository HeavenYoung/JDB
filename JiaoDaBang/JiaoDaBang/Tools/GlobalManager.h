//
//  GlobalManager.h
//  PrivateTalk
//
//  Created by Heaven on 2016/12/13.
//  Copyright © 2016年 Heaven. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GlobalManager : NSObject

/**
 *  实例化单例
 *
 *  @return 全局管理工具
 */
+ (instancetype)sharedManager;

/**
 *  登录成功之后记录用户信息
 *
 *  @param userInfoData 用户信息模型
 */
- (void)loginSuccessedWithUserInfo:(UserInfoData *)userInfoData;

/**
 刷新用户信息

 @param userInfoData userInfoData
 */
- (void)refreshWithUserInfo:(UserInfoData *)userInfoData;

/**
 *  退出登录
 */
- (void)logout;

/**
 *  用户信息
 */
@property (nonatomic, strong, readonly) UserInfoData *userInfoData;
@property (nonatomic, assign, readonly) BOOL isLogin;
@property (nonatomic, copy, readonly) NSString *token;
@property (nonatomic, copy, readonly) NSString *username;
@property (nonatomic, assign, readonly) NSInteger userId;
@property (nonatomic, copy, readonly) NSURL *avatarUrl;
@property (nonatomic, strong) UIImage *localAvatarImage;
@property (nonatomic, copy) NSString *deviceId;
@property (nonatomic, copy, readonly) NSString *hxUserId;

@end
