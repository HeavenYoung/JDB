//
//  AppDelegate+EaseMob.h
//  BlueChat
//
//  Created by Heaven on 16/4/20.
//  Copyright © 2016年 aaa. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate (EaseMob)

- (void)easemobApplication:(UIApplication *)application
didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
                    appkey:(NSString *)appkey
              apnsCertName:(NSString *)apnsCertName
               otherConfig:(NSDictionary *)otherConfig;


@end
