//
//  AppDelegate.h
//  JiaoDaBang
//
//  Created by Heaven on 2016/12/15.
//  Copyright © 2016年 Heaven. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MainViewController.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate, EMChatManagerDelegate>
{
    EMConnectionState _connectionState;
}

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) MainViewController *MTMainViewController;


@end

