//
//  AppDelegate.m
//  JiaoDaBang
//
//  Created by Heaven on 2016/12/15.
//  Copyright © 2016年 Heaven. All rights reserved.
//

#import "AppDelegate.h"
#import "WXApiManager.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    self.window.rootViewController = [[MainViewController alloc] init];
    self.window.backgroundColor = [UIColor whiteColor];
    
    [self.window makeKeyAndVisible];

    return YES;

}


- (BOOL)application:(UIApplication *)application handleOpenURL:(NSURL *)url {
    return  [WXApi handleOpenURL:url delegate:[WXApiManager sharedManager]];
}

- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation {
    
    NSString *urlString = [url absoluteString];
    
    if ([urlString hasPrefix:WXAppId]) {
        [WXApi handleOpenURL:url delegate:[WXApiManager sharedManager]];
    }
    else if([urlString hasPrefix:AlipayScheme]) {
        //如果极简开发包不可用，会跳转支付宝钱包进行支付，需要将支付宝钱包的支付结果回传给开发包
        if ([url.host isEqualToString:@"safepay"]) {
            [[AlipaySDK defaultService] processOrderWithPaymentResult:url standbyCallback:^(NSDictionary *resultDic) {
                DLog(@"result = %@",resultDic);
                NSInteger resultCode = [[resultDic objectForKey:@"resultStatus"] integerValue];
                BOOL isSuccess = NO;
                if (9000 == resultCode) {
                    isSuccess = YES;
                }
                [self.MainViewController payResultHandler:isSuccess];
            }];
        }
        else if ([url.host isEqualToString:@"platformapi"]){
            //支付宝钱包快登授权返回authCode
            [[AlipaySDK defaultService] processAuthResult:url standbyCallback:^(NSDictionary *resultDic) {
                DLog(@"result = %@",resultDic);
            }];
        }
    }
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
