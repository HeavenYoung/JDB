//
//  BillTableViewCell.m
//  JiaoDaBang
//
//  Created by ott001 on 2017/4/9.
//  Copyright © 2017年 Heaven. All rights reserved.
//

#import "BillTableViewCell.h"

@interface BillTableViewCell ()

@property (nonatomic, weak) UILabel *typeLablel;
@property (nonatomic, weak) UILabel *timeLablel;
@property (nonatomic, weak) UILabel *moneyLablel;

@end

@implementation BillTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        [self placeSubView];
    }
    return self;
}

- (void)placeSubView{
    UILabel *typeLablel = [[UILabel alloc] init];
    typeLablel.font = [UIFont systemFontOfSize:16];
    typeLablel.textColor = [UIColor blackColor];
    [self.contentView addSubview:typeLablel];
    self.typeLablel = typeLablel;
    [typeLablel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@16);
        make.left.equalTo(@16);
    }];
    UILabel *timeLablel = [[UILabel alloc] init];
    timeLablel.font = [UIFont systemFontOfSize:16];
    timeLablel.textColor = [UIColor grayColor];
    [self.contentView addSubview:timeLablel];
    self.timeLablel = timeLablel;
    [timeLablel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(typeLablel.mas_bottom).offset(5);
        make.left.equalTo(@16);
    }];
    
    UILabel *moneyLablel = [[UILabel alloc] init];
    moneyLablel.font = [UIFont systemFontOfSize:16];
    moneyLablel.textColor = [UIColor orangeColor];
    [self.contentView addSubview:moneyLablel];
    self.moneyLablel = moneyLablel;
    [moneyLablel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(@(-16));
        make.centerY.equalTo(self.contentView.mas_centerY);
    }];
    
    UIView *lineView = [[UIView alloc] init];
    lineView.backgroundColor = [UIColor lightGrayColor];
    [self.contentView addSubview:lineView];
    [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.contentView.mas_right);
        make.left.equalTo(self.contentView.mas_left);
        make.bottom.equalTo(self.contentView.mas_bottom);
        make.height.equalTo(@(0.5));
    }];
}

- (void)setBillData:(BillData *)billData{
    _billData = billData;
    self.typeLablel.text = billData.orderType;
    self.timeLablel.text = billData.time;
    self.moneyLablel.text = billData.money;
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
