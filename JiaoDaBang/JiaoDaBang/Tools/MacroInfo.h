//
//  MacroInfo.h
//  JiaoDaBang
//
//  Created by Heaven on 2017/1/9.
//  Copyright © 2017年 Heaven. All rights reserved.
//

#ifndef MacroInfo_h
#define MacroInfo_h


#import "WXApi.h"
#import "WXApiRequestHandler.h"
#import <AlipaySDK/AlipaySDK.h>
#import "MBProgressHUD.h"
#import "PayManager.h"
#import "YTNavigationController.h"
#import "ShareUtil.h"
#import "WXApiManager.h"


/** 屏幕判断参数 */
#define SCREEN_HEIGHT_ORIGINAL [UIScreen mainScreen].bounds.size.height
#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height
#define VERTICAL_SCREEN_WIDTH MIN([UIScreen mainScreen].bounds.size.width,[UIScreen mainScreen].bounds.size.height)
#define VERTICAL_SCREEN_HEIGHT MAX([UIScreen mainScreen].bounds.size.width,[UIScreen mainScreen].bounds.size.height)

#define iPhone5 CGSizeEqualToSize(CGSizeMake(640, 1136), [[UIScreen mainScreen] currentMode].size)
#define iPhone6 CGSizeEqualToSize(CGSizeMake(750, 1334), [[UIScreen mainScreen] currentMode].size)
#define iPhone6p CGSizeEqualToSize(CGSizeMake(1242, 2208), [[UIScreen mainScreen] currentMode].size)
#define iPhone35inch CGSizeEqualToSize(CGSizeMake(640, 960), [[UIScreen mainScreen] currentMode].size)

#define IS_IPHONE_5 ( fabs( ( double )[ [ UIScreen mainScreen ] bounds ].size.height - ( double )568 ) < DBL_EPSILON )

/** 公共字体参数 */
#define PlaceTextFont [UIFont systemFontOfSize:14]
#define PlaceTextColor [UIColor whiteColor]
#define CustomGreen RGBACOLOR(157, 213, 7, 1)

#define RGBACOLOR(r,g,b,a) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:(a)]

/** 网络参数*/
#define kBaseServerURL        @"http://59.110.62.75/think/"

/** 加密 */
#define EncryptoKey          @"56A0741C0955CBC9"

/**  */

/** 配置参数 */
#define kHXappKey           @"bluepane2016#bluepane"
#define kApnsCertName       @"mt-buyer-push-dev-cert"


#define kUserID             @"userId"
#define kUserAccount        @"useraccount"
#define kUserPassword       @"userpassword"


/********* 微信 BEGIN *********/

#define WXAppId @"wx6f6d78031f9f2ed4"
#define WXMchId @"1311358901"

/********* 微信 END   *********/

/********* 支付宝 BEGIN *********/

#define AlipayScheme @"mitangAlipay2088021871280216"

/********* 支付宝 END   *********/

/********* NOTIFICATION BEGIN *********/

#define NOTIFCATION_USER_STATUSCHANGE           @"userStatusChange"        //用户登录状态发生
#define NOTIFCATION_USER_SETTINGLOGOUT           @"userSettingLogout"        //用户在设置界面登出

#define NOTIFCATION_USERHEAD_INFOCHANGE         @"userInfoChange"
#define NOTIFCATION_USER_LOGOUT                 @"userLogout"

#define kPayResponseNotification @"kPayResponseNotification"
#define kPayMessageNotification @"kPayMessageNotification"
#define kMessageToOrderNotification @"kMessageToOrderNotification"
#define kCallPayResultHandleNotification @"kCallPayResultHandleNotification"

/********* NOTIFICATION END   *********/

#endif /* MacroInfo_h */
