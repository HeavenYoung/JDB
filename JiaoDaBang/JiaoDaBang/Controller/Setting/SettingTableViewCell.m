//
//  SettingTableViewCell.m
//  页面
//
//  Created by apple on 17/3/2.
//  Copyright © 2017年 Sunjiandong. All rights reserved.
//

#import "SettingTableViewCell.h"

@interface SettingTableViewCell()

@end

@implementation SettingTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // cell 点击无效果
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        self.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        // 图标
        self.iconImg = [UIImageView new];
        self.iconImg.backgroundColor = RGB(221, 223, 224);
        [self.contentView addSubview:self.iconImg];
        [self.iconImg mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.contentView.mas_top).offset(22);
            make.left.equalTo(self.contentView.mas_left).offset(20);
            make.width.equalTo(@20);
            make.height.equalTo(@20);
        }];
        
        // 头名称
        self.title = [UILabel new];
        self.title.font = My_Font(15);
        [self.contentView addSubview:self.title];
        [self.title mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.contentView.mas_top).offset(22);
            make.left.equalTo(self.iconImg.mas_right).offset(15);
            make.height.equalTo(@20);
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
