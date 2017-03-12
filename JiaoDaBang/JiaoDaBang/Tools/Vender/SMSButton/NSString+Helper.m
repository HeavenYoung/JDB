//
//  NSString+Helper.m
//  真兑金融
//
//  Created by apple on 15/12/22.
//  Copyright © 2015年 zhendui. All rights reserved.
//

#import "NSString+Helper.h"

@implementation NSString (Helper)

#pragma mark 清空字符串中的空白字符
- (NSString *)trimString
{
    return [self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
}

// 检验是否是手机号
- (BOOL)isMobilePhone
{
    NSString *regex = @"^((13[0-9])|(147)|(15[^4,\\D])|(17[0,1-9])|(18[0,1-9]))\\d{8}$";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    BOOL isMatch = [pred evaluateWithObject:self];
    return isMatch;
}

// 判断字符的长度
- (BOOL)isEmptyString
{
    
    return (self.length == 0);
}

@end
