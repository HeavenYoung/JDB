//
//  AccountSecurityTableViewCell.m
//  页面
//
//  Created by apple on 17/3/3.
//  Copyright © 2017年 Sunjiandong. All rights reserved.
//


#import "AccountSecurityTableViewCell.h"

@interface AccountSecurityTableViewCell()


@end

@implementation AccountSecurityTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // cell 点击无效果
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        self.title = [UILabel new];
        self.title.font = My_Font(14);
        self.title.textColor = RGB(153, 154, 154);
        [self.contentView addSubview:self.title];
        [self.title mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.contentView.mas_left).offset(20);
            make.top.equalTo(self.contentView.mas_top).offset(22);
            make.height.equalTo(@21);
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
