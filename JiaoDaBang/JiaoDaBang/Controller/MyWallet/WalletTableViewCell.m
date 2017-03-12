//
//  WalletTableViewCell.m
//  页面
//
//  Created by apple on 17/3/2.
//  Copyright © 2017年 Sunjiandong. All rights reserved.
//

#import "WalletTableViewCell.h"

@interface WalletTableViewCell()


@end

@implementation WalletTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // cell 点击无效果
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        // 图标
        self.iconImg = [UIImageView new];
        self.iconImg.backgroundColor = RGB(156 , 197, 28);
        [self.contentView addSubview:self.iconImg];
        [self.iconImg mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.contentView.mas_top).offset(20);
            make.left.equalTo(self.contentView.mas_left).offset(20);
            make.width.equalTo(@30);
            make.height.equalTo(@30);
        }];
        
        // 头名称
        self.title = [UILabel new];
        self.title.font = My_Font(15);
        self.title.textColor = RGB(151, 153, 154);
        [self.contentView addSubview:self.title];
        [self.title mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.contentView.mas_top).offset(22);
            make.left.equalTo(self.iconImg.mas_right).offset(15);
            make.height.equalTo(@20);
        }];
        
        // 资金
        self.money = [UILabel new];
        self.money.font = My_Font(15);
        self.money.textColor = RGB(151, 153, 154);
        [self.contentView addSubview:self.money];
        [self.money mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self.contentView.mas_right).offset(-10);
            make.top.equalTo(self.contentView.mas_top).offset(22);
            make.height.equalTo(@20);
        }];
    }
    return self;
}


- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
