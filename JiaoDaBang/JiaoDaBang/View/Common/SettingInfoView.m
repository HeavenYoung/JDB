//
//  SettingInfoView.m
//  JiaoDaBang
//
//  Created by ott001 on 2017/4/7.
//  Copyright © 2017年 Heaven. All rights reserved.
//

#import "SettingInfoView.h"

@interface SettingInfoView ()

@property (nonatomic, copy) SettingInfoBlock settingInfoBlcok;
@property (nonatomic, copy) NSString *titleString;
@property (nonatomic, copy) NSString *infoString;
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *infoLabel;
@end

@implementation SettingInfoView

- (instancetype)initWithFrame:(CGRect)frame titleString:(NSString *)titleString infoString:(NSString *)infoString settingBlock:(SettingInfoBlock)block {

    self = [super initWithFrame:frame];
    if (self) {
        
        self.titleString = titleString;
        self.infoString = infoString;
        self.settingInfoBlcok = block;
        
        [self placeSubviews];
        [self addGesture];
    }
    return self;
}

- (void)placeSubviews {

    UILabel *titleLabel = [[UILabel alloc] init];
    titleLabel.textColor = [UIColor blackColor];
    titleLabel.text = self.titleString;
    titleLabel.font = [UIFont systemFontOfSize:16];
    [self.contentView addSubview:titleLabel];
    self.titleLabel = titleLabel;
    
    UILabel *infoLabel = [[UILabel alloc] init];
    infoLabel.textColor = [UIColor blackColor];
    infoLabel.text = self.infoString;
    infoLabel.font = [UIFont systemFontOfSize:16];
    [self.contentView addSubview:infoLabel];
    self.infoLabel = infoLabel;
    
    [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.contentView.mas_centerY);
        make.left.equalTo(self.contentView.mas_left).offset(10);
    }];
    
    [infoLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.contentView.mas_centerY);
        make.right.equalTo(self.contentView.mas_right).offset(-10);
    }];
}

- (void)addGesture {

    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapJump)];
    
    [self addGestureRecognizer:tap];
}

- (void)tapJump {
    
    if (self.settingInfoBlcok) {
        
        self.settingInfoBlcok();
    }
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
