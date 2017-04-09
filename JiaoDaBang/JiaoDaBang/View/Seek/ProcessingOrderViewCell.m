//
//  ProcessingOrderViewCell.m
//  JiaoDaBang
//
//  Created by Heaven on 08/04/2017.
//  Copyright © 2017 Heaven. All rights reserved.
//

#import "ProcessingOrderViewCell.h"

@interface ProcessingOrderViewCell ()

@property (nonatomic, strong) UIImageView *avatarView;
@property (nonatomic, strong) UIImageView *sexView;
@property (nonatomic, strong) UILabel *nickNameLabel;
@property (nonatomic, strong) UILabel *schoolLabel;
@property (nonatomic, strong) UILabel *orderTypeLabel;
@property (nonatomic, strong) UILabel *srcNameLabel;
@property (nonatomic, strong) UILabel *srcDesLabel;
@property (nonatomic, strong) UILabel *creatTimeLabel;
@property (nonatomic, strong) UIImageView *iconView;
@property (nonatomic, strong) UILabel *moneyLabel;
@property (nonatomic, strong) UIButton *statusButton;
@property (nonatomic, strong) UIButton *chatButton;
@property (nonatomic, strong) UIView *squareView1;
@property (nonatomic, strong) UIView *squareView2;
@property (nonatomic, strong) UIView *squareView3;
@property (nonatomic, strong) UIView *squareView4;

@end

@implementation ProcessingOrderViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {

    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {

        self.backgroundColor = [UIColor whiteColor];
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        [self placeSubviews];
    }
    return self;
}

- (void)placeSubviews {

    UIImageView *avatarView = [[UIImageView alloc] init];
    avatarView.backgroundColor = [UIColor randomColor];
    avatarView.userInteractionEnabled = YES;
    avatarView.layer.cornerRadius = 30;
    avatarView.layer.masksToBounds = YES;
    [self.contentView addSubview:avatarView];
    self.avatarView = avatarView;
    [avatarView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@5);
        make.left.equalTo(@10);
        make.size.mas_equalTo(CGSizeMake(60, 60));
    }];
    
    UIImageView *sexView = [[UIImageView alloc] init];
    sexView.backgroundColor = [UIColor randomColor];
    sexView.userInteractionEnabled = YES;
    [self.contentView addSubview:sexView];
    [sexView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(avatarView.mas_bottom).offset(10);
        make.left.equalTo(@5);
        make.size.mas_equalTo(CGSizeMake(12, 12));
    }];
    self.sexView = sexView;
    
    UILabel *nicknameLabel = [[UILabel alloc] init];
    nicknameLabel.font = [UIFont systemFontOfSize:12];
    nicknameLabel.text = @"交大帮TEAM";
    nicknameLabel.textColor = [UIColor blackColor];
    [self.contentView addSubview:nicknameLabel];
    [nicknameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(avatarView.mas_bottom).offset(10);
        make.left.equalTo(sexView.mas_right).offset(3);
        make.width.equalTo(@80);
    }];
    self.nickNameLabel = nicknameLabel;
    
    UILabel *schoolLabel = [[UILabel alloc] init];
    schoolLabel.font = [UIFont systemFontOfSize:10];
    schoolLabel.text = @"BJTU";
    schoolLabel.textColor = [UIColor grayColor];
    [self.contentView addSubview:schoolLabel];
    [schoolLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(nicknameLabel.mas_bottom).offset(10);
        make.left.equalTo(nicknameLabel.mas_left);
        make.width.equalTo(@70);
    }];
    self.schoolLabel = schoolLabel;

    UIView *lineView = [[UIView alloc] init];
    lineView.backgroundColor = [UIColor lightGrayColor];
    [self.contentView addSubview:lineView];
    [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(schoolLabel.mas_bottom).offset(25);
        make.left.equalTo(self.contentView.mas_left);
        make.right.equalTo(self.contentView.mas_right);
        make.height.equalTo(@0.5);
    }];
    
    CGFloat margin = SCREEN_WIDTH / 12;
    
    UIView *squareView1 = [[UIView alloc] init];
    squareView1.backgroundColor = CustomGreen;
    squareView1.layer.cornerRadius = 10;
    squareView1.layer.masksToBounds = YES;
    [self.contentView addSubview:squareView1];
    self.squareView1 = squareView1;
    [squareView1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@(margin));
        make.centerY.equalTo(lineView.mas_centerY);
        make.size.mas_equalTo(CGSizeMake(margin, 20));
    }];
    
    UIView *squareView2 = [[UIView alloc] init];
    squareView2.backgroundColor = [UIColor whiteColor];
    squareView2.layer.cornerRadius = 10;
    squareView2.layer.borderWidth = 0.5;
    squareView2.layer.borderColor = [UIColor lightGrayColor].CGColor;
    squareView2.layer.masksToBounds = YES;
    [self.contentView addSubview:squareView2];
    self.squareView2 = squareView2;
    [squareView2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@(4*margin));
        make.centerY.equalTo(lineView.mas_centerY);
        make.size.mas_equalTo(CGSizeMake(margin, 20));
    }];
    
    UIView *squareView3 = [[UIView alloc] init];
    squareView3.backgroundColor = [UIColor whiteColor];
    squareView3.layer.cornerRadius = 10;
    squareView3.layer.borderWidth = 0.5;
    squareView3.layer.borderColor = [UIColor lightGrayColor].CGColor;
    squareView3.layer.masksToBounds = YES;
    [self.contentView addSubview:squareView3];
    self.squareView3 = squareView1;
    [squareView3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@(7*margin));
        make.centerY.equalTo(lineView.mas_centerY);
        make.size.mas_equalTo(CGSizeMake(margin, 20));
    }];

    UIView *squareView4 = [[UIView alloc] init];
    squareView4.backgroundColor = [UIColor whiteColor];
    squareView4.layer.cornerRadius = 10;
    squareView4.layer.borderWidth = 0.5;
    squareView4.layer.borderColor = [UIColor lightGrayColor].CGColor;
    squareView4.layer.masksToBounds = YES;
    [self.contentView addSubview:squareView4];
    self.squareView4 = squareView4;
    [squareView4 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@(10*margin));
        make.centerY.equalTo(lineView.mas_centerY);
        make.size.mas_equalTo(CGSizeMake(margin, 20));
    }];
    
    UILabel *tipLabel1 = [[UILabel alloc] init];
    tipLabel1.font = [UIFont systemFontOfSize:14];
    tipLabel1.text = @"已发布";
    [self.contentView addSubview:tipLabel1];
    [tipLabel1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(squareView1.mas_bottom).offset(5);
        make.centerX.equalTo(squareView1.mas_centerX);
    }];
    
    UILabel *tipLabel2 = [[UILabel alloc] init];
    tipLabel2.font = [UIFont systemFontOfSize:14];
    tipLabel2.text = @"已接单";
    [self.contentView addSubview:tipLabel2];
    [tipLabel2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(squareView2.mas_bottom).offset(5);
        make.centerX.equalTo(squareView2.mas_centerX);
    }];

    UILabel *tipLabel3 = [[UILabel alloc] init];
    tipLabel3.font = [UIFont systemFontOfSize:14];
    tipLabel3.text = @"进行中";
    [self.contentView addSubview:tipLabel3];
    [tipLabel3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(squareView3.mas_bottom).offset(5);
        make.centerX.equalTo(squareView3.mas_centerX);
    }];

    UILabel *tipLabel4 = [[UILabel alloc] init];
    tipLabel4.font = [UIFont systemFontOfSize:14];
    tipLabel4.text = @"已完成";
    [self.contentView addSubview:tipLabel4];
    [tipLabel4 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(squareView4.mas_bottom).offset(5);
        make.centerX.equalTo(squareView4.mas_centerX);
    }];
    
    UILabel *orderTypeLabel = [[UILabel alloc] init];
    orderTypeLabel.font = [UIFont systemFontOfSize:16];
    orderTypeLabel.text = @"哈哈哈";
    orderTypeLabel.textColor = [UIColor blackColor];
    [self.contentView addSubview:orderTypeLabel];
    [orderTypeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@5);
        make.left.equalTo(avatarView.mas_right).offset(25);
    }];
    self.orderTypeLabel = orderTypeLabel;

    UIImageView *srcNameView = [[UIImageView alloc] init];
    srcNameView.backgroundColor = [UIColor randomColor];
    srcNameView.userInteractionEnabled = YES;
    [self.contentView addSubview:srcNameView];
    [srcNameView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(orderTypeLabel.mas_bottom).offset(15);
        make.left.equalTo(orderTypeLabel.mas_left);
        make.size.mas_equalTo(CGSizeMake(12, 12));
    }];

    UILabel *srcNameLabel = [[UILabel alloc] init];
    srcNameLabel.font = [UIFont systemFontOfSize:14];
    srcNameLabel.text = @"srcName";
    srcNameLabel.textColor = [UIColor blackColor];
    [self.contentView addSubview:srcNameLabel];
    [srcNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(srcNameView.mas_centerY);
        make.left.equalTo(srcNameView.mas_right).offset(10);
    }];
    self.srcNameLabel = srcNameLabel;
    
    UIImageView *srcDesView = [[UIImageView alloc] init];
    srcDesView.backgroundColor = [UIColor randomColor];
    srcDesView.userInteractionEnabled = YES;
    [self.contentView addSubview:srcDesView];
    [srcDesView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(srcNameView.mas_bottom).offset(15);
        make.left.equalTo(orderTypeLabel.mas_left);
        make.size.mas_equalTo(CGSizeMake(12, 12));
    }];
    
    UILabel *srcDesLabel = [[UILabel alloc] init];
    srcDesLabel.font = [UIFont systemFontOfSize:14];
    srcDesLabel.text = @"srcDes";
    srcDesLabel.textColor = [UIColor blackColor];
    [self.contentView addSubview:srcDesLabel];
    [srcDesLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(srcDesView.mas_centerY);
        make.left.equalTo(srcDesView.mas_right).offset(10);
    }];
    self.srcDesLabel = srcDesLabel;
    
    UIImageView *creatTimeView = [[UIImageView alloc] init];
    creatTimeView.backgroundColor = [UIColor randomColor];
    creatTimeView.userInteractionEnabled = YES;
    [self.contentView addSubview:creatTimeView];
    [creatTimeView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(srcDesView.mas_bottom).offset(15);
        make.left.equalTo(orderTypeLabel.mas_left);
        make.size.mas_equalTo(CGSizeMake(12, 12));
    }];
    
    UILabel *creatTimeLabel = [[UILabel alloc] init];
    creatTimeLabel.font = [UIFont systemFontOfSize:14];
    creatTimeLabel.text = @"2017-4-48 12:39";
    creatTimeLabel.textColor = [UIColor blackColor];
    [self.contentView addSubview:creatTimeLabel];
    [creatTimeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(creatTimeView.mas_centerY);
        make.left.equalTo(creatTimeView.mas_right).offset(10);
    }];
    self.creatTimeLabel = creatTimeLabel;

    UILabel *moneyLabel = [[UILabel alloc] init];
    moneyLabel.textColor = [UIColor orangeColor];
    moneyLabel.font = [UIFont systemFontOfSize:16];
    moneyLabel.text = @"0.1";
    [self.contentView addSubview:moneyLabel];
    [moneyLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(orderTypeLabel.mas_centerY);
        make.right.equalTo(self.contentView.mas_right).offset(-15);
    }];
    self.moneyLabel = moneyLabel;

    UIImageView *iconView = [[UIImageView alloc] init];
    iconView.backgroundColor = [UIColor randomColor];
    iconView.userInteractionEnabled = YES;
    [self.contentView addSubview:iconView];
    [iconView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@15);
        make.right.equalTo(self.contentView.mas_right).offset(-20);
        make.size.mas_equalTo(CGSizeMake(50, 25));
    }];
    self.iconView = iconView;
    
    // 按钮
    UIButton *chatButton = [UIButton buttonWithTitle:@"聊天"
                                           normalColor:CustomGreen
                                      highlightedColor:CustomGreen
                                             titleFont:[UIFont systemFontOfSize:12]
                                             imageName:nil
                                         backImageName:nil
                                                target:self
                                                action:@selector(submitBtnDidClicked)];
    [self addSubview:chatButton];
    [chatButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.contentView.mas_right).offset(-10);
        make.centerY.equalTo(srcDesLabel.mas_centerY);
    }];
    self.chatButton = chatButton;
    
    // 按钮
    UIButton *statusButton = [UIButton buttonWithTitle:@" 发布 "
                                        normalColor:CustomGreen
                                   highlightedColor:CustomGreen
                                          titleFont:[UIFont systemFontOfSize:14]
                                          imageName:nil
                                      backImageName:nil
                                             target:self
                                             action:@selector(submitBtnDidClicked)];
    statusButton.backgroundColor = [UIColor lightTextColor];
    statusButton.layer.cornerRadius = 3.0;
    statusButton.layer.borderWidth = 0.5;
    statusButton.layer.borderColor = CustomGreen.CGColor;
    statusButton.layer.masksToBounds = YES;
    [self addSubview:statusButton];
    [statusButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.contentView.mas_right).offset(-10);
        make.centerY.equalTo(creatTimeLabel.mas_centerY);
    }];
    self.statusButton = statusButton;
    
    UIView *breakLineView = [[UIView alloc] initWithFrame:CGRectMake(0, 185, SCREEN_WIDTH, 5)];
    breakLineView.backgroundColor = [UIColor colorWithHexString:@"#fafafa"];
    [self.contentView addSubview:breakLineView];
}

- (void)setOrderData:(OrderData *)orderData {
    _orderData = orderData;
    
    self.statusButton.enabled = YES;
    self.chatButton.hidden = NO;
    
    self.orderTypeLabel.text = orderData.orderType;
    self.srcNameLabel.text = orderData.srcName;
    self.srcDesLabel.text = orderData.srcDetail;
    self.creatTimeLabel.text = orderData.createTime;
    
    // 支付
    if ([orderData.stateId isEqualToString:@"0"]) {
        [self.statusButton setTitle:@"支付" forState:UIControlStateNormal];
    } else if ([orderData.stateId isEqualToString:@"1"]) {
        [self.statusButton setTitle:@"修改" forState:UIControlStateNormal];
    } else if ([orderData.stateId isEqualToString:@"2"] || [orderData.stateId isEqualToString:@"3"]) {
        [self.statusButton setTitle:@"确认收货" forState:UIControlStateNormal];
    } else if ([orderData.stateId isEqualToString:@"4"]) {
        [self.statusButton setTitle:@"评价" forState:UIControlStateNormal];
    } else if ([orderData.stateId isEqualToString:@"5"]) {
        [self.statusButton setTitle:@"已评价" forState:UIControlStateNormal];
        self.statusButton.enabled = NO;
    }

    // 头像 01 自己头像 不能聊天
    if ([orderData.stateId isEqualToString:@"0"] || [orderData.stateId isEqualToString:@"1"]) {
        self.chatButton.hidden = YES;
        
        NSString *nameString = orderData.releaseNickName ? orderData.releaseNickName : orderData.releaseUserName;
        self.nickNameLabel.text = nameString;
        self.schoolLabel.text = orderData.releaseSchool;
        [self.avatarView sd_setImageWithURL:[NSURL URLWithString:orderData.releaseAvatar]];
    } else {
    
        NSString *nameString = orderData.acceptNickName ? orderData.acceptNickName : orderData.acceptUserName;
        self.nickNameLabel.text = nameString;
        self.schoolLabel.text = orderData.releaseSchool;
        [self.avatarView sd_setImageWithURL:[NSURL URLWithString:orderData.acceptAvatar]];
    }
    
    if ([orderData.mainType isEqualToString:@"0"]) {
        self.iconView.hidden = YES;
        self.moneyLabel.hidden = NO;
    } else {
        self.iconView.hidden = NO;
        self.moneyLabel.hidden = YES;
    }
}

- (void)submitBtnDidClicked {

    if ([self.delegate respondsToSelector:@selector(confirmOrder:)]) {
        [self.delegate confirmOrder:self.orderData];
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
