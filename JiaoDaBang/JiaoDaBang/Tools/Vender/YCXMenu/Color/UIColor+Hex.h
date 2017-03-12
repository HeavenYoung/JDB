//
//  UIColor+Hex.h
//  YiYiTan
//
//  Created by sunyang on 15/12/15.
//  Copyright © 2015年 Beijing Bodi Health & Technology Co.,Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (Hex)

// 十六进制转换为UIColor
+ (UIColor *) colorWithHexString:(NSString *)color;

// 十六进制转换为UIColor，带alpha
+ (UIColor *) colorWithHexString:(NSString *)color alpha:(CGFloat)alpha;

@end
