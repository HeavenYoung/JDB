//
//  PersonalDataTableViewCell.m
//  页面
//
//  Created by apple on 17/3/1.
//  Copyright © 2017年 Sunjiandong. All rights reserved.
//
#import "PersonalDataTableViewCell.h"

@interface PersonalDataTableViewCell()

@end

@implementation PersonalDataTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // cell 点击无效果
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        
        // 开头标题
        self.title = [UILabel new];
        self.title.font = My_Font(15);
        [self.contentView addSubview:self.title];
        [self.title mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.contentView.mas_top).offset(22);
            make.left.equalTo(self.contentView.mas_left).offset(20);
            make.height.equalTo(@20);
        }];
        
        // 头像
        self.icon = [UIImageView new];
        self.icon.userInteractionEnabled = YES;
        self.icon.layer.masksToBounds = YES;
        self.icon.layer.cornerRadius = 25;
        [self.contentView addSubview:self.icon];
        [self.icon mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo(self.contentView.mas_bottom).offset(-7);
            make.right.equalTo(self.contentView.mas_right).offset(-10);
            make.height.equalTo(@50);
            make.width.equalTo(@50);
        }];
        
        // 昵称
        self.nickName = [UILabel new];
        self.nickName.font = My_Font(15);
        [self.contentView addSubview:self.nickName];
        [self.nickName mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.contentView.mas_top).offset(22);
            make.right.equalTo(self.contentView.mas_right).offset(-10);
            make.height.equalTo(@20);
        }];
        
        // 手机号
        self.phoneNum = [UILabel new];
        self.phoneNum.font = My_Font(15);
        [self.contentView addSubview:self.phoneNum];
        [self.phoneNum mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.contentView.mas_top).offset(22);
            make.right.equalTo(self.contentView.mas_right).offset(-10);
            make.height.equalTo(@20);
        }];
        
        // 性别
        self.sex = [UILabel new];
        self.sex.font = My_Font(15);
        [self.contentView addSubview:self.sex];
        [self.sex mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.contentView.mas_top).offset(22);
            make.right.equalTo(self.contentView.mas_right).offset(-50);
            make.height.equalTo(@20);
        }];
        
        // 学校
        self.schoolName = [UILabel new];
        self.schoolName.font = My_Font(15);
        [self.contentView addSubview:self.schoolName];
        [self.schoolName mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.contentView.mas_top).offset(22);
            make.right.equalTo(self.contentView.mas_right).offset(-10);
            make.height.equalTo(@20);
        }];
        
        // 地址
        self.address = [UILabel new];
        self.address.font = My_Font(15);
        [self.contentView addSubview:self.address];
        [self.address mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.contentView.mas_top).offset(22);
            make.right.equalTo(self.contentView.mas_right).offset(-10);
            make.height.equalTo(@20);
            make.width.equalTo(@80);
        }];
    }
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

@end
