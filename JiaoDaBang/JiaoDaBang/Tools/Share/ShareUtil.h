//
//  ShareUtil.h
//  MiTang_Client
//
//  Created by OTT on 16/5/10.
//  Copyright © 2016年 Heaven. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ShareUtil : NSObject

/*!
 *@brief 微信好友分享
 *
 *@param shareParams 分享参数
 */
+(void)shareInWXSession:(NSDictionary *)shareParams;

/*!
 *@brief 微信朋友圈分享
 *
 *@param shareParams 分享参数
 */
+(void)shareInWXTimeLine:(NSDictionary *)shareParams;

/*!
 *@brief 微信好友分享福利
 *
 *@param shareParams 分享参数
 */
+(void)shareWelfareInWXSession:(NSDictionary *)shareParams;

/*!
 *@brief 微信好友分享福利
 *
 *@param shareParams 分享参数
 */
+(void)shareWelfareInWXTimeLine:(NSDictionary *)shareParams;



@end
