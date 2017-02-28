//
//  UserProfileUtil.m
//  MiTang_Client
//
//  Created by Heaven on 16/5/5.
//  Copyright © 2016年 Heaven. All rights reserved.
//

#import "MessageUserProfileUtil.h"

@implementation MessageUserProfileUtil


+ (void)saveUserProfileWithUsername:(NSString *)username forNickName:(NSString *)nickName avatarURLPath:(NSString *)avatarURLPath {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    //设置保存的头像和昵称的key，加上环信ID字段标识
    NSString *nickNameKey = [NSString stringWithFormat:@"username_%@",username];
    NSString *avatarURLPathKey = [NSString stringWithFormat:@"avatarURLPath_%@",username];
    
    if (nickName) {
        [defaults setObject:nickName forKey:nickNameKey];
    }
    if (avatarURLPath) {
        [defaults setObject:avatarURLPath forKey:avatarURLPathKey];
    }
    [defaults synchronize];
    
    DLog(@"NSHomeDirectory()------------------%@",NSHomeDirectory());
}

+ (NSString *)getNickNameWithUsername:(NSString*)username {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSString *nickNameKey = [NSString stringWithFormat:@"username_%@",username];
    
    return [defaults objectForKey:nickNameKey];
}

+ (NSString *)getavatarURLPathWithUsername:(NSString*)username {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSString *avatarURLPathKey = [NSString stringWithFormat:@"avatarURLPath_%@",username];
    
    return [defaults objectForKey:avatarURLPathKey];
}

+ (void)removeUserProfileWithUsername:(NSString *)username {
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    NSString *nickNameKey = [NSString stringWithFormat:@"username_%@",username];
    NSString *avatarURLPathKey = [NSString stringWithFormat:@"avatarURLPath_%@",username];
    
    [defaults removeObjectForKey:nickNameKey];
    [defaults removeObjectForKey:avatarURLPathKey];
    [defaults synchronize];
}

+ (BOOL)isExsistUserInfoWithUsername:(NSString *)username {
    if ([MessageUserProfileUtil getNickNameWithUsername:username] && [MessageUserProfileUtil getavatarURLPathWithUsername:username]) {
        return YES;
    }
    return NO;
}

@end
