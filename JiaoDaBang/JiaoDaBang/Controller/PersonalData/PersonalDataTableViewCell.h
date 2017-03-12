//
//  PersonalDataTableViewCell.h
//  页面
//
//  Created by apple on 17/3/1.
//  Copyright © 2017年 Sunjiandong. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PersonalDataTableViewCell : UITableViewCell
// 开头标题
@property (nonatomic, strong) UILabel *title;
// 头像
@property (nonatomic, strong) UIImageView *icon;
// 昵称
@property (nonatomic, strong) UILabel *nickName;
// 手机号
@property (nonatomic, strong) UILabel *phoneNum;
// 性别
@property (nonatomic, strong) UILabel *sex;
// 学校名称
@property (nonatomic, strong) UILabel *schoolName;
// 地址
@property (nonatomic, strong) UILabel *address;
@end
