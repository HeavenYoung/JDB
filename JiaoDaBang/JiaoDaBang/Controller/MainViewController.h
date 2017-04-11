//
//  MainViewController.h
//  JiaoDaBang
//
//  Created by Heaven on 2016/12/15.
//  Copyright © 2016年 Heaven. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MainViewController : UITabBarController


- (void)setupUnreadMessageCount;


- (void)didReceiveLocalNotification:(UILocalNotification *)notification;

- (void)playSoundAndVibration;

- (void)payResultHandler:(BOOL)isSuccess;

- (void)HandleHxMessage:(NSDictionary *)pushInfo;

@end
