//
//  UserProfileUtil.h
//  MiTang_Client
//
//  Created by Heaven on 16/5/5.
//  Copyright © 2016年 Heaven. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MessageUserProfileUtil : NSObject

/*!
 *	@brief	通过环信ID去保存昵称和头像url到本地
 *
 *	@param 	username 环信Id
 *	@param 	nickName 昵称
 *  @param  avatarUrlPath 头像地址
 *
 */
+ (void)saveUserProfileWithUsername:(NSString *)username forNickName:(NSString *)nickName avatarURLPath:(NSString *)avatarURLPath;

/*!
 *	@brief	通过环信ID取本地的昵称
 *
 *	@param 	username 环信Id
 *
 */
+ (NSString *)getNickNameWithUsername:(NSString*)username;

/*!
 *	@brief	通过环信ID取本地的头像url
 *
 *	@param 	username 环信Id
 *
 */
+ (NSString *)getavatarURLPathWithUsername:(NSString*)username;

/*!
 *	@brief	移除本地的头像昵称，清缓存
 *
 *	@param 	username 环信Id
 *
 */
+ (void)removeUserProfileWithUsername:(NSString *)username;

/*!
 *	@brief	判断
 *
 *	@param 	username 环信Id
 *
 */
+ (BOOL)isExsistUserInfoWithUsername:(NSString *)username;


@end
