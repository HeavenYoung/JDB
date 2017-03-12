//
//  NSString+Helper.h
//  真兑金融
//
//  Created by apple on 15/12/22.
//  Copyright © 2015年 zhendui. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Helper)

/**
 *  清空字符串中的空白字符
 *
 *  @return 清空空白字符串之后的字符串
 */
- (NSString *)trimString;

/**
 *  判断是否是手机号
 *
 *  @return 是不是
 */
- (BOOL)isMobilePhone;


/**
 *  是否空字符串
 *
 *  @return 如果字符串为nil或者长度为0返回YES
 */
- (BOOL)isEmptyString;

@end
