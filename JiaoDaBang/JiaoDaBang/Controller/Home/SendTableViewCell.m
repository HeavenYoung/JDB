//
//  SendTableViewCell.m
//  页面
//
//  Created by apple on 17/3/22.
//  Copyright © 2017年 Sunjiandong. All rights reserved.
//


#import "SendTableViewCell.h"

@implementation SendTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // cell 点击无效果
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        
        // 头名称
        self.title = [UILabel new];
        self.title.font = My_Font(15);
        self.title.textColor = RGB(151, 153, 154);
        [self.contentView addSubview:self.title];
        [self.title mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.contentView.mas_top).offset(10);
            make.left.equalTo(self.contentView.mas_left).offset(10);
            make.right.equalTo(self.contentView.mas_right).offset(-100);
            make.height.equalTo(@35);
        }];
        
        // 资金
        self.song = [UIButton new];
        self.song.layer.masksToBounds = YES;
        self.song.layer.cornerRadius = 8;
        [self.song setTitle:@"免费到达" forState:UIControlStateNormal];
        [self.song setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        self.song.backgroundColor = RGB(139, 189, 23);
        [self.contentView addSubview:self.song];
        [self.song mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self.contentView.mas_right).offset(-10);
            make.top.equalTo(self.contentView.mas_top).offset(10);
            make.height.equalTo(@35);
            make.width.equalTo(@90);
        }];
    }
    return self;
}



- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
