//
//  MessageUtil.h
//  BlueChat
//
//  Created by Heaven on 16/4/15.
//  Copyright © 2016年 aaa. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "ConversationListController.h"
#import "ChatViewController.h"

#import "MainViewController.h"
#import "EMSDKFull.h"

#import "CallViewController.h"


@interface MessageUtil : NSObject<EMClientDelegate, EMChatManagerDelegate>

@property (nonatomic, weak) MainViewController *mainTabBarController;
@property (nonatomic, weak) ConversationListController *conversationListVC;
@property (nonatomic, weak) ChatViewController *chatVC;
@property (nonatomic, assign) EMConnectionState connectionState;
@property (nonatomic, strong) EMCallSession *callSession;
@property (nonatomic, strong) CallViewController *callController;

+ (instancetype)shareMessageManage;

//用户登录和注册
- (BOOL)userRegisterWithName:(NSString *)name password:(NSString *)password;
- (void)userLoginWithName:(NSString *)name password:(NSString *)password;
- (void)userlogoutWithName:(NSString *)name password:(NSString *)password;
- (BOOL)autoLoginWithName:(NSString *)name;

//联系其他用户
- (void)connectWithChatter:(NSString *)chatter;

//同步数据
- (void)asyncPushOptions;
- (void)asyncConversationFromDB;
- (void)makeCallWithUsername:(NSString *)aUsername isVideo:(BOOL)aIsVideo;
- (void)hangupCallWithReason:(EMCallEndReason)aReason;
- (void)answerCall;

- (void)asynSendOrderMessage:(NSString *)aOrderId ImageUrl:(NSURL *)aUrl withContent:(NSDictionary *)paramDic andChatter:(NSString *)aChatter;

- (BOOL)asynSendMessageImage:(UIImage *)aImage withContent:(NSDictionary *)paramDic andChatter:(NSString *)aChatter;

- (BOOL)isOrderConversationId:(NSString *)conversationId;

- (void)removeOrderConversationId:(NSString *)conversationId;

- (void)fetchChatterInfo:(NSString *)chatterName;

- (void)fetchChatterInfoIfNot:(NSString *)chatterName;

@end
