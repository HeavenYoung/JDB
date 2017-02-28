//
//  MainViewController.h
//  JiaoDaBang
//
//  Created by Heaven on 2016/12/15.
//  Copyright © 2016年 Heaven. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MainViewController : UITabBarController
{
    EMConnectionState _connectionState;
}

@property (strong, nonatomic) ConversationListController *chatListVC;

- (void)setupUnreadMessageCount;

- (void)networkChanged:(EMConnectionState)connectionState;

- (void)didReceiveLocalNotification:(UILocalNotification *)notification;

- (void)playSoundAndVibration;

- (void)showNotificationWithMessage:(EMMessage *)message;

- (void)payResultHandler:(BOOL)isSuccess;

- (void)HandleHxMessage:(NSDictionary *)pushInfo;

@end
