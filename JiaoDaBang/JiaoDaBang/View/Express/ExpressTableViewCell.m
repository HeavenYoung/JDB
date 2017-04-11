//
//  ExpressTableViewCell.m
//  JiaoDaBang
//
//  Created by ott001 on 2017/4/10.
//  Copyright © 2017年 Heaven. All rights reserved.
//

#import "ExpressTableViewCell.h"

@interface ExpressTableViewCell()

@property (nonatomic, weak) UILabel *typeLablel;
@property (nonatomic, weak) UILabel *noLablel;
@property (nonatomic, weak) UIButton *stateBtn;

@end

@implementation ExpressTableViewCell

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
    UILabel *noLablel = [[UILabel alloc] init];
    noLablel.font = [UIFont systemFontOfSize:16];
    noLablel.textColor = [UIColor grayColor];
    [self.contentView addSubview:noLablel];
    self.noLablel = noLablel;
    [noLablel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(typeLablel.mas_bottom).offset(5);
        make.left.equalTo(@16);
    }];
    
    UIButton *stateBtn = [UIButton buttonWithTitle:@"免费派送"
                                       normalColor:CustomGreen
                                  highlightedColor:CustomGreen
                                         titleFont:[UIFont systemFontOfSize:14]
                                         imageName:nil
                                     backImageName:nil
                                            target:self
                                            action:@selector(sendExpress)];
    stateBtn.titleEdgeInsets = UIEdgeInsetsMake(0, 5, 0, 5);
    [self.contentView addSubview:stateBtn];
    self.stateBtn = stateBtn;
    [stateBtn mas_makeConstraints:^(MASConstraintMaker *make) {
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

- (void)setDeliveryInfoData:(DeliveryInfoData *)deliveryInfoData{
    _deliveryInfoData = deliveryInfoData;
    self.typeLablel.text = deliveryInfoData.deliverytype;
    self.noLablel.text = deliveryInfoData.deliveryid;
    
    
    if([deliveryInfoData.stateid isEqualToString:@"0"]){
        [self.stateBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        self.stateBtn.backgroundColor = CustomGreen;
        self.stateBtn.titleLabel.text = @"免费派送";
    }else{
        [self.stateBtn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        self.stateBtn.titleLabel.text = deliveryInfoData.state;
        self.stateBtn.backgroundColor = [UIColor whiteColor];
    }
}

- (void)sendExpress{
    
    if ([self.delegate respondsToSelector:@selector(sendExpress:)]) {
        [self.delegate sendExpress:self.deliveryInfoData];
    }
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
