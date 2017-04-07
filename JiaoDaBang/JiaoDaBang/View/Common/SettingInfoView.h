//
//  SettingInfoView.h
//  JiaoDaBang
//
//  Created by ott001 on 2017/4/7.
//  Copyright © 2017年 Heaven. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^SettingInfoBlock) ();

@interface SettingInfoView : UIView

- (instancetype)initWithFrame:(CGRect)frame titleString:(NSString *)titleString infoString:(NSString *)infoString settingBlock:(SettingInfoBlock)block;

@end
