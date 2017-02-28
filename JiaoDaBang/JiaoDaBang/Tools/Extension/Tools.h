//
//  Tools.h
//  MiTang_Client
//
//  Created by Heaven on 16/4/19.
//  Copyright © 2016年 Heaven. All rights reserved.
//  工具类

#import <Foundation/Foundation.h>

@interface Tools : NSObject

/**
 *  保存用户token
 *
 *  @param token token
 */
+ (void)saveToken:(NSString *)token;

/**
 *  获取用户toekn
 *
 *  @return token
 */
+ (NSString *)getToken;
/**
 *  删除用户token
 */
+ (void)deleteToken;

/**
 *  重新获取验证码的方法
 *
 *  @param sec             间隔的秒数
 *  @param completionBlock 间隔描述完成
 *  @param isRunBlock      正在倒计时
 */
+ (void)timerCountDown:(int)sec
       completionBlock:(void (^)())completionBlock
            isRunBlock:(void (^)(NSString *countDownSec))isRunBlock;

/**
 *  空判断
 */
+ (BOOL)iSNull:(id)object;

/**
 *  提示网络
 */
+ (void)alterWithNoNetwork;

+ (UIImage *)synLoadOrderImageWithURL:(NSURL *)url orderId:(NSString *)orderId;

+ (UIImage *)asynLoadOrderImageWithURL:(NSURL *)url orderId:(NSString *)orderId;

+ (void)saveImage:(UIImage *)image withFileName:(NSString *)imageName ofType:(NSString *)extension inDirectory:(NSString *)directoryPath;

+ (UIImage *)loadOrderImageOfOrderId:(NSString *)orderId InDirectory:(NSString *)directoryPath;

+ (NSData *)loadOrderImageDataOfOrderId:(NSString *)orderId InDirectory:(NSString *)directoryPath;

+ (UIImage *)imageCompressForWidth:(UIImage *)sourceImage targetWidth:(CGFloat)defineWidth;

+ (NSData *)imageCutData:(UIImage *)myimage;

@end
