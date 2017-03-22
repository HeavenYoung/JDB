//
//  MessageUtil.m
//  BlueChat
//
//  Created by Heaven on 16/4/15.
//  Copyright © 2016年 aaa. All rights reserved.
//

#import "MessageUtil.h"
#import "AppDelegate.h"
#import "EMSDKFull.h"
#import "MBProgressHUD.h"
#import "UserProfileManager.h"
//#import "ChatterInfoRequest.h"
//#import "ChatterInfoData.h"
//#import "ChatterSellerInfoRequest.h"

@interface MessageUtil ()<EMCallManagerDelegate>
{
    NSTimer *_callTimer;
}

@property (nonatomic, strong) NSMutableDictionary *orderMessageDic;

@end

@implementation MessageUtil

static MessageUtil *messageManager = nil;

+ (instancetype)shareMessageManage {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (!messageManager) {
            messageManager = [[MessageUtil alloc]init];
        }
    });
    
    return messageManager;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        self.connectionState = EMConnectionConnected;
        self.orderMessageDic = [[NSMutableDictionary alloc]initWithCapacity:10];
        //注册实用工具类回调
        [[EMClient sharedClient] addDelegate:self delegateQueue:nil];
        //消息代理
        [[EMClient sharedClient].chatManager addDelegate:self delegateQueue:nil];
        //实时通讯代理
        [[EMClient sharedClient].callManager addDelegate:self delegateQueue:nil];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(makeCall:) name:KNOTIFICATION_CALL object:nil];
    }
    
    return self;
}

- (void)dealloc {
    [[EMClient sharedClient] removeDelegate:self];
    [[EMClient sharedClient].chatManager removeDelegate:self];
    [[EMClient sharedClient].callManager removeDelegate:self];
}

- (void)setMainTabBarController:(MainViewController *)mainTabBarController {
    _mainTabBarController = mainTabBarController;
    _conversationListVC = mainTabBarController.chatListVC;
    [self asyncConversationFromDB];
//    [self asyncPushOptions];
}


#pragma mark - 用户登录

- (BOOL)userRegisterWithName:(NSString *)name password:(NSString *)password {
    EMError *error = [[EMClient sharedClient] registerWithUsername:name password:@"123456"];
    if (!error) {
        DLog(@"注册成功");
        return YES;
    }
    return NO;
}

- (void)userLoginWithName:(NSString *)name password:(NSString *)password {
    EMError *error = [[EMClient sharedClient] loginWithUsername:name password:@"123456"];
    if (!error) {
        [[EMClient sharedClient].options setIsAutoLogin:NO];
        //发送自动登陆状态通知
        [[NSNotificationCenter defaultCenter] postNotificationName:KNOTIFICATION_LOGINCHANGE object:@YES];
    }
}

- (BOOL)autoLoginWithName:(NSString *)name {
    EMError *error = [[EMClient sharedClient] loginWithUsername:name password:@"123456"];
    if (!error) {
        [[EMClient sharedClient].options setIsAutoLogin:NO];
        [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"hxUserHasRegisted"];
        //发送自动登陆状态通知
        [[NSNotificationCenter defaultCenter] postNotificationName:KNOTIFICATION_LOGINCHANGE object:@YES];
        return YES;
    }
    else {
        BOOL isRegisted = [[NSUserDefaults standardUserDefaults] boolForKey:@"hxUserHasRegisted"];
        if (!isRegisted) {
            BOOL isRegistSuccess = [self userRegisterWithName:name password:@"123456"];
            if (isRegistSuccess) {
                [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"hxUserHasRegisted"];
            }
            else {
                return NO;
            }
        }
        else {
            [self userRegisterWithName:name password:@"123456"];
        }
        
        //登录
        EMError *error = [[EMClient sharedClient] loginWithUsername:name password:@"123456"];
        if (!error) {
            [[EMClient sharedClient].options setIsAutoLogin:NO];
            //发送自动登陆状态通知
            [[NSNotificationCenter defaultCenter] postNotificationName:KNOTIFICATION_LOGINCHANGE object:@YES];
            return YES;
        }
        else {
            return NO;
        }
    }
}

- (void)userlogoutWithName:(NSString *)name password:(NSString *)password {
    EMError *error = [[EMClient sharedClient] logout:YES];
    if (!error) {
        if (self.conversationListVC) {
            [_conversationListVC refreshDataSource];
        }
        DLog(@"退出成功");
    }
}


#pragma mark - 联系其他用户

- (void)connectWithChatter:(NSString *)chatter {
    
    if (!_mainTabBarController) {
        AppDelegate *adelegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
        _mainTabBarController = adelegate.MainViewController;
    }
    
    
    UIViewController *vc = self.mainTabBarController.selectedViewController;
    ChatViewController *chatController = [[ChatViewController alloc]initWithConversationChatter:chatter conversationType:EMConversationTypeChat];
    chatController.title = chatter;
    chatController.hidesBottomBarWhenPushed = YES;
    
    if ([vc isKindOfClass:[UINavigationController class]]) {
        [(UINavigationController *)vc pushViewController:chatController animated:YES];
    }
    else
        [vc.navigationController pushViewController:chatController animated:YES];
    
}

- (void)asyncPushOptions
{
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        EMError *error = nil;
        [[EMClient sharedClient] getPushOptionsFromServerWithError:&error];
    });
}

- (void)asyncConversationFromDB
{
    __weak typeof(self) weakself = self;
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        NSArray *array = [[EMClient sharedClient].chatManager loadAllConversationsFromDB];
        [array enumerateObjectsUsingBlock:^(EMConversation *conversation, NSUInteger idx, BOOL *stop){
            if(conversation.latestMessage == nil){
                [[EMClient sharedClient].chatManager deleteConversation:conversation.conversationId deleteMessages:NO];
            }
        }];
        dispatch_async(dispatch_get_main_queue(), ^{
            if (weakself.conversationListVC) {
                [weakself.conversationListVC refreshDataSource];
            }
            
            if (weakself.mainTabBarController) {
                [weakself.mainTabBarController setupUnreadMessageCount];
            }
        });
    });
}


#pragma mark - EMClientDelegate

//登录状态变化
- (void)didConnectionStateChanged:(EMConnectionState)connectionState
{
    [self.mainTabBarController networkChanged:connectionState];
}

//自动登录后回调
- (void)didAutoLoginWithError:(EMError *)error
{
    if (error) {
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:nil message:@"自动登录失败，请重新登录" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
        alertView.tag = 100;
        [alertView show];
    } else if([[EMClient sharedClient] isConnected]){
        UIView *view = [UIApplication sharedApplication].keyWindow;//self.mainTabBarController.view;
        [MBProgressHUD showHUDAddedTo:view animated:YES];
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
            BOOL flag = [[EMClient sharedClient] dataMigrationTo3];
            if (flag) {
                [self asyncConversationFromDB];
            }
            dispatch_async(dispatch_get_main_queue(), ^{
//                [MBProgressHUD hideAllHUDsForView:view animated:YES];
                [MBProgressHUD hideHUDForView:view animated:YES];
            });
        });
    }
}

//账号在其他设备上登录后回调
- (void)didLoginFromOtherDevice
{
    [self _clearHelper];
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:NSLocalizedString(@"prompt", @"Prompt") message:NSLocalizedString(@"loginAtOtherDevice", @"your login account has been in other places") delegate:self cancelButtonTitle:NSLocalizedString(@"ok", @"OK") otherButtonTitles:nil, nil];
    [alertView show];
    [[NSNotificationCenter defaultCenter] postNotificationName:NOTIFCATION_USER_LOGOUT object:nil];
}

//当前登录账号已经被从服务器端删除时会收到该回调
- (void)didRemovedFromServer
{
    [self _clearHelper];
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:NSLocalizedString(@"prompt", @"Prompt") message:NSLocalizedString(@"loginUserRemoveFromServer", @"your account has been removed from the server side") delegate:self cancelButtonTitle:NSLocalizedString(@"ok", @"OK") otherButtonTitles:nil, nil];
    [alertView show];
    [[NSNotificationCenter defaultCenter] postNotificationName:KNOTIFICATION_LOGINCHANGE object:@NO];
}


#pragma mark - EMChatManagerDelegate

//会话列表发生变化
- (void)didUpdateConversationList:(NSArray *)aConversationList
{
    if (self.mainTabBarController) {
        [_mainTabBarController setupUnreadMessageCount];
    }
    
    if (self.conversationListVC) {
        [_conversationListVC refreshDataSource];
    }
}

//收到Cmd透传消息
- (void)didReceiveCmdMessages:(NSArray *)aCmdMessages
{
    if (self.mainTabBarController) {
        [_mainTabBarController showHint:NSLocalizedString(@"receiveCmd", @"receive cmd message")];
    }
}

//收到消息
- (void)didReceiveMessages:(NSArray *)aMessages
{
    BOOL isRefreshCons = YES;
    for(EMMessage *message in aMessages){
        BOOL needShowNotification = (message.chatType != EMChatTypeChat) ? [self _needShowNotification:message.conversationId] : YES;
        if (needShowNotification) {
#if !TARGET_IPHONE_SIMULATOR
            UIApplicationState state = [[UIApplication sharedApplication] applicationState];
            switch (state) {
                case UIApplicationStateActive:
                    [self.mainTabBarController playSoundAndVibration];
                    break;
                case UIApplicationStateInactive:
                    [self.mainTabBarController playSoundAndVibration];
                    break;
                case UIApplicationStateBackground:
                    [self.mainTabBarController showNotificationWithMessage:message];
                    break;
                default:
                    break;
            }
#endif
        }
        
        if (_chatVC == nil) {
            _chatVC = [self _getCurrentChatView];
        }
        BOOL isChatting = NO;
        if (_chatVC) {
            isChatting = [message.conversationId isEqualToString:_chatVC.conversation.conversationId];
        }
        if (_chatVC == nil || !isChatting) {
            if (self.conversationListVC) {
                [_conversationListVC refresh];
            }
            
            if (self.mainTabBarController) {
                [_mainTabBarController setupUnreadMessageCount];
            }
            return;
        }
        
        if (isChatting) {
            isRefreshCons = NO;
        }
    }
    
    if (isRefreshCons) {
        if (self.conversationListVC) {
            [_conversationListVC refresh];
        }
        
        if (self.mainTabBarController) {
            [_mainTabBarController setupUnreadMessageCount];
        }
    }
}


#pragma mark - EMCallManagerDelegate

- (void)didReceiveCallIncoming:(EMCallSession *)aSession
{
    if(_callSession && _callSession.status != EMCallSessionStatusDisconnected){
        [[EMClient sharedClient].callManager endCall:aSession.sessionId reason:EMCallEndReasonBusy];
    }
    
    if ([[UIApplication sharedApplication] applicationState] != UIApplicationStateActive) {
        [[EMClient sharedClient].callManager endCall:aSession.sessionId reason:EMCallEndReasonFailed];
    }
    
    _callSession = aSession;
    if(_callSession){
        [self _startCallTimer];
        
        _callController = [[CallViewController alloc] initWithSession:_callSession isCaller:NO status:NSLocalizedString(@"call.finished", "Establish call finished")];
        _callController.modalPresentationStyle = UIModalPresentationOverFullScreen;
        [_mainTabBarController presentViewController:_callController animated:NO completion:nil];
    }
}

- (void)didReceiveCallConnected:(EMCallSession *)aSession
{
    if ([aSession.sessionId isEqualToString:_callSession.sessionId]) {
        _callController.statusLabel.text = NSLocalizedString(@"call.finished", "Establish call finished");
        
        AVAudioSession *audioSession = [AVAudioSession sharedInstance];
        [audioSession setCategory:AVAudioSessionCategoryPlayAndRecord error:nil];
        [audioSession setActive:YES error:nil];
    }
}

- (void)didReceiveCallAccepted:(EMCallSession *)aSession
{
    if ([[UIApplication sharedApplication] applicationState] != UIApplicationStateActive) {
        [[EMClient sharedClient].callManager endCall:aSession.sessionId reason:EMCallEndReasonFailed];
    }
    
    if ([aSession.sessionId isEqualToString:_callSession.sessionId]) {
        [self _stopCallTimer];
        
        NSString *connectStr = aSession.connectType == EMCallConnectTypeRelay ? @"Relay" : @"Direct";
        _callController.statusLabel.text = [NSString stringWithFormat:@"%@ %@",NSLocalizedString(@"call.speak", @"Can speak..."), connectStr];
        _callController.timeLabel.hidden = NO;
        [_callController startTimer];
        _callController.cancelButton.hidden = NO;
        _callController.rejectButton.hidden = YES;
        _callController.answerButton.hidden = YES;
    }
}

- (void)didReceiveCallTerminated:(EMCallSession *)aSession reason:(EMCallEndReason)aReason error:(EMError *)aError
{
    if ([aSession.sessionId isEqualToString:_callSession.sessionId]) {
        [self _stopCallTimer];
        
        _callSession = nil;
        
        [_callController close];
        _callController = nil;
        
        if (aReason != EMCallEndReasonHangup) {
            NSString *reasonStr = @"";
            switch (aReason) {
                case EMCallEndReasonNoResponse:
                {
                    reasonStr = NSLocalizedString(@"call.noResponse", @"NO response");
                }
                    break;
                case EMCallEndReasonDecline:
                {
                    reasonStr = NSLocalizedString(@"call.rejected", @"Reject the call");
                }
                    break;
                case EMCallEndReasonBusy:
                {
                    reasonStr = NSLocalizedString(@"call.in", @"In the call...");
                }
                    break;
                case EMCallEndReasonFailed:
                {
                    reasonStr = NSLocalizedString(@"call.connectFailed", @"Connect failed");
                }
                    break;
                default:
                    break;
            }
            
            if (aError) {
                UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Error" message:aError.errorDescription delegate:nil cancelButtonTitle:NSLocalizedString(@"ok", @"OK") otherButtonTitles:nil, nil];
                [alertView show];
            }
            else{
                UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:nil message:reasonStr delegate:nil cancelButtonTitle:NSLocalizedString(@"ok", @"OK") otherButtonTitles:nil, nil];
                [alertView show];
            }
        }
    }
}

- (void)didReceiveCallNetworkChanged:(EMCallSession *)aSession status:(EMCallNetworkStatus)aStatus
{
    if ([aSession.sessionId isEqualToString:_callSession.sessionId]) {
        [_callController setNetwork:aStatus];
    }
}

#pragma mark - public

- (void)makeCall:(NSNotification*)notify
{
    if (notify.object) {
        [self makeCallWithUsername:[notify.object valueForKey:@"chatter"] isVideo:[[notify.object objectForKey:@"type"] boolValue]];
    }
}

- (void)_startCallTimer
{
    _callTimer = [NSTimer scheduledTimerWithTimeInterval:50 target:self selector:@selector(_cancelCall) userInfo:nil repeats:NO];
}

- (void)_stopCallTimer
{
    if (_callTimer == nil) {
        return;
    }
    
    [_callTimer invalidate];
    _callTimer = nil;
}

- (void)_cancelCall
{
    [self hangupCallWithReason:EMCallEndReasonNoResponse];
    
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:nil message:NSLocalizedString(@"call.autoHangup", @"No response and Hang up") delegate:self cancelButtonTitle:NSLocalizedString(@"ok", @"OK") otherButtonTitles:nil, nil];
    [alertView show];
}

- (void)makeCallWithUsername:(NSString *)aUsername
                     isVideo:(BOOL)aIsVideo
{
    if ([aUsername length] == 0) {
        return;
    }
    
    if (aIsVideo) {
        _callSession = [[EMClient sharedClient].callManager makeVideoCall:aUsername error:nil];
    }
    else{
        _callSession = [[EMClient sharedClient].callManager makeVoiceCall:aUsername error:nil];
    }
    
    if(_callSession){
        [self _startCallTimer];
        
        _callController = [[CallViewController alloc] initWithSession:_callSession isCaller:YES status:NSLocalizedString(@"call.connecting", @"Connecting...")];
        //        _callController.modalPresentationStyle = UIModalPresentationOverFullScreen;
        //        AppDelegate *delegate = [UIApplication sharedApplication].delegate;
        //        [delegate.navigationController presentViewController:_callController animated:NO completion:nil];
        [_mainTabBarController presentViewController:_callController animated:NO completion:nil];
    }
    else{
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:nil message:NSLocalizedString(@"call.initFailed", @"Establish call failure") delegate:nil cancelButtonTitle:NSLocalizedString(@"ok", @"OK") otherButtonTitles:nil, nil];
        [alertView show];
    }
    
}

- (void)hangupCallWithReason:(EMCallEndReason)aReason
{
    [self _stopCallTimer];
    
    if (_callSession) {
        [[EMClient sharedClient].callManager endCall:_callSession.sessionId reason:EMCallEndReasonHangup];
    }
    
    _callSession = nil;
    [_callController close];
    _callController = nil;
}

- (void)answerCall
{
    if (_callSession) {
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
            EMError *error = [[EMClient sharedClient].callManager answerCall:_callSession.sessionId];
            if (error) {
                dispatch_async(dispatch_get_main_queue(), ^{
                    if (error.code == EMErrorNetworkUnavailable) {
                        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:nil message:NSLocalizedString(@"network.disconnection", @"Network disconnection") delegate:nil cancelButtonTitle:NSLocalizedString(@"ok", @"OK") otherButtonTitles:nil, nil];
                        [alertView show];
                    }
                    else{
                        [self hangupCallWithReason:EMCallEndReasonFailed];
                    }
                });
            }
        });
    }
}


#pragma mark - private

- (BOOL)_needShowNotification:(NSString *)fromChatter
{
    BOOL ret = YES;
    NSArray *igGroupIds = [[EMClient sharedClient].groupManager getAllIgnoredGroupIds];
    for (NSString *str in igGroupIds) {
        if ([str isEqualToString:fromChatter]) {
            ret = NO;
            break;
        }
    }
    return ret;
}

- (ChatViewController*)_getCurrentChatView
{
    NSMutableArray *viewControllers = [NSMutableArray arrayWithArray:_mainTabBarController.navigationController.viewControllers];
    ChatViewController *chatViewContrller = nil;
    for (id viewController in viewControllers)
    {
        if ([viewController isKindOfClass:[ChatViewController class]])
        {
            chatViewContrller = viewController;
            break;
        }
    }
    return chatViewContrller;
}

- (void)_clearHelper
{
//    self.mainTabBarController = nil;
    self.conversationListVC = nil;
    self.chatVC = nil;
    [[EMClient sharedClient] logout:NO];
    
    [self hangupCallWithReason:EMCallEndReasonFailed];
}

- (void)asynSendOrderMessage:(NSString *)aOrderId ImageUrl:(NSURL *)aUrl withContent:(NSDictionary *)paramDic andChatter:(NSString *)aChatter  {
    
    UIImage *orderImage = [Tools synLoadOrderImageWithURL:aUrl orderId:aOrderId];
    if (!orderImage) {
        orderImage = [UIImage imageNamed:@"serviceMsgIcon"];
    }
    
    EMMessage *message = [EaseSDKHelper sendImageMessageWithImage:orderImage
                                          to:aChatter
                                 messageType:EMChatTypeChat
                                  messageExt:paramDic];
    
    __weak typeof(self) weakself = self;
    [[EMClient sharedClient].chatManager asyncSendMessage:message progress:nil completion:^(EMMessage *aMessage, EMError *aError) {
        [_orderMessageDic setObject:@(1) forKey:aChatter];
        [weakself asyncConversationFromDB];
        [weakself didSendOrderMessage:aChatter];
        
        if (weakself.mainTabBarController) {
            
            UIApplicationState state = [[UIApplication sharedApplication] applicationState];
            switch (state) {
                case UIApplicationStateActive:
                    [weakself.mainTabBarController playSoundAndVibration];
                    break;
                case UIApplicationStateInactive:
                    [weakself.mainTabBarController playSoundAndVibration];
                    break;
                case UIApplicationStateBackground:
                    [weakself.mainTabBarController showNotificationWithMessage:message];
                    break;
                default:
                    break;
            }
        }
    }];

}

- (BOOL)asynSendMessageImage:(UIImage *)aImage withContent:(NSDictionary *)paramDic andChatter:(NSString *)aChatter {
    
    if (!aImage || !aChatter || aChatter.length <=0) {
        return NO;
    }
    
    EMMessage *message = [EaseSDKHelper sendImageMessageWithImage:aImage to:aChatter messageType:EMChatTypeChat messageExt:paramDic];
    
    __weak typeof(self) weakself = self;
    [[EMClient sharedClient].chatManager asyncSendMessage:message progress:nil completion:^(EMMessage *aMessage, EMError *aError) {
        [_orderMessageDic setObject:@(1) forKey:aChatter];
        [weakself asyncConversationFromDB];
        [weakself didSendOrderMessage:aChatter];
        
        if (weakself.mainTabBarController) {
            
            UIApplicationState state = [[UIApplication sharedApplication] applicationState];
            switch (state) {
                case UIApplicationStateActive:
                    [weakself.mainTabBarController playSoundAndVibration];
                    break;
                case UIApplicationStateInactive:
                    [weakself.mainTabBarController playSoundAndVibration];
                    break;
                case UIApplicationStateBackground:
                    [weakself.mainTabBarController showNotificationWithMessage:message];
                    break;
                default:
                    break;
            }
        }
    }];
    
    return YES;
}

- (void)didSendOrderMessage:(NSString *)chatter {
    
    if (!_mainTabBarController) {
        AppDelegate *adelegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
        _mainTabBarController = adelegate.MainViewController;
    }
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        if (_mainTabBarController.selectedIndex == 3) {
            
            if ([_mainTabBarController.selectedViewController isKindOfClass:[UINavigationController class]]) {
                UINavigationController *navigation = (UINavigationController *)_mainTabBarController.selectedViewController;
                if ([navigation.topViewController isKindOfClass:[ChatViewController class]]) {
                    return;
                }
                else {
                    navigation.topViewController.tabBarItem.badgeValue = nil;
                }
            }
        }
        else {
            if (_conversationListVC) {
                
                NSInteger badgeValue = [_conversationListVC.tabBarItem.badgeValue integerValue];
                if (badgeValue <=0) {
                    dispatch_async(dispatch_get_main_queue(), ^{
                        _conversationListVC.tabBarItem.badgeValue = @"1";
                    });
                    
                }
            }
        }
    });
}

- (BOOL)isOrderConversationId:(NSString *)conversationId {
    if ([_orderMessageDic objectForKey:conversationId]) {
        return YES;
    }
    return NO;
}

- (void)removeOrderConversationId:(NSString *)conversationId {
    [_orderMessageDic removeObjectForKey:conversationId];
}

- (void)fetchChatterInfoIfNot:(NSString *)chatterName {
    if (![MessageUserProfileUtil isExsistUserInfoWithUsername:chatterName]) {
        [self fetchChatterInfo:chatterName];
    }
}

- (void)fetchChatterInfo:(NSString *)chatterName {
    
    NSString *keyWord = @"s";
    if ([chatterName hasPrefix:@"c"]) {
        return;
    }
    NSString *chatterId = [chatterName substringFromIndex:[keyWord length]];
    
    if (!chatterId) {
        return;
    }
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
//        ChatterInfoRequest *request = [[ChatterInfoRequest alloc]init];
//        [request setParametersWithSellerId:chatterId];
//        [request setSuccessBlock:^(id object, id responseObject) {
//            ChatterInfoData *infoData = (ChatterInfoData *)object;
//            [MessageUserProfileUtil saveUserProfileWithUsername:chatterName forNickName:infoData.chatterName avatarURLPath:infoData.headPortraitUrl];
//        }];
//        [request setFailureBlock:^(NSInteger errorCode, id responseObject) {
//            
//        }];
//        [request sendRequest];
        
//        ChatterSellerInfoRequest *request = [[ChatterSellerInfoRequest alloc]init];
//        [request setParametersWithSellerMobile:chatterId];
//        [request setSuccessBlock:^(id object, id responseObject) {
//            ChatterInfoData *infoData = (ChatterInfoData *)object;
//            [MessageUserProfileUtil saveUserProfileWithUsername:chatterName forNickName:infoData.chatterName avatarURLPath:infoData.headPortraitUrl];
//        }];
//        [request setFailureBlock:^(NSInteger errorCode, id responseObject) {
//            
//        }];
//        [request sendRequest];
    });
}


@end
