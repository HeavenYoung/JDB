//
//  SettingCommonCell.h
//  JiaoDaBang
//
//  Created by ott001 on 2017/4/7.
//  Copyright © 2017年 Heaven. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SettingData : NSObject

@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *info;

@end

@interface SettingCommonCell : UITableViewCell

@property (nonatomic, strong) SettingData *settingData;

@end
