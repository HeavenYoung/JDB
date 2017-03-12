//
//  EvaluateTableViewCell.m
//  页面
//
//  Created by apple on 17/3/1.
//  Copyright © 2017年 Sunjiandong. All rights reserved.
//
#import "EvaluateTableViewCell.h"

@interface EvaluateTableViewCell()
/*------图-------*/
// 头像
@property (nonatomic, strong) UIImageView *iconImg;
// 性别
@property (nonatomic, strong) UIImageView *sex;
// 接单标
@property (nonatomic, strong) UIImageView *documentsImg;
// 地点图标
@property (nonatomic, strong) UIImageView *placeIcon;
// 定位图标
@property (nonatomic, strong) UIImageView *positioningImg;
// 时间图标
@property (nonatomic, strong) UIImageView *timeImg;
// 解绑图标
@property (nonatomic, strong) UIImageView *unbundlingImg;
/*------字-------*/
// 昵称
@property (nonatomic, strong) UILabel *nickName;
// 接单数量
@property (nonatomic, strong) UILabel *documentsNumber;
// 标题
@property (nonatomic, strong) UILabel *title;
// 地点位置
@property (nonatomic, strong) UILabel *placeText;
// 定位名称
@property (nonatomic, strong) UILabel *positioningName;
// 时间
@property (nonatomic, strong) UILabel *time;
// 价钱
@property (nonatomic, strong) UILabel *money;
/*------按钮-------*/
// 联系对话
@property (nonatomic, strong) UIButton *dialogueBtn;
// 待评价
@property (nonatomic, strong) UIButton *evaluateBtn;
@end

@implementation EvaluateTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // cell 点击无效果
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        // 头像
        self.iconImg = [UIImageView new];
        self.iconImg.backgroundColor = RGB(221, 223, 224);
        [self.contentView addSubview:self.iconImg];
        self.iconImg.userInteractionEnabled = YES;
        self.iconImg.layer.masksToBounds = YES;
        self.iconImg.layer.cornerRadius = 30;
        [self.iconImg mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.contentView.mas_top).offset(25);
            make.left.equalTo(self.contentView.mas_left).offset(25);
            make.width.equalTo(@60);
            make.height.equalTo(@60);
        }];
        
        // 性别
        self.sex = [UIImageView new];
        self.sex.backgroundColor = RGB(156, 197, 28);
        [self.contentView addSubview:self.sex];
        [self.sex mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.iconImg.mas_bottom).offset(10);
            make.left.equalTo(self.contentView.mas_left).offset(30);
            make.width.equalTo(@20);
            make.height.equalTo(@20);
        }];
        
        // 接单标
        self.documentsImg = [UIImageView new];
        self.documentsImg.backgroundColor = RGB(156, 197, 28);
        [self.contentView addSubview:self.documentsImg];
        [self.documentsImg mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.sex.mas_bottom).offset(5);
            make.left.equalTo(self.contentView.mas_left).offset(30);
            make.width.equalTo(@20);
            make.height.equalTo(@20);
        }];
        
        // 昵称
        self.nickName = [UILabel new];
        self.nickName.text = @"昵称";
        self.nickName.font = My_Font(10);
        self.nickName.textColor = RGB(153, 154, 154);
        [self.contentView addSubview:self.nickName];
        [self.nickName mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.iconImg.mas_bottom).offset(10);
            make.left.equalTo(self.sex.mas_right).offset(5);
            make.height.equalTo(@20);
        }];
        
        // 接单数量
        self.documentsNumber = [UILabel new];
        self.documentsNumber.text = [NSString stringWithFormat:@"%@单",@"12"];
        self.documentsNumber.font = My_Font(10);
        self.documentsNumber.textColor = RGB(153, 154, 154);
        [self.contentView addSubview:self.documentsNumber];
        [self.documentsNumber mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.nickName.mas_bottom).offset(5);
            make.left.equalTo(self.sex.mas_right).offset(5);
            make.height.equalTo(@20);
        }];
        
        // 标题
        self.title = [UILabel new];
        self.title.text = @"帮我取快递";
        self.title.font = My_Font(17);
        [self.contentView addSubview:self.title];
        [self.title mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.contentView.mas_top).offset(32);
            make.left.equalTo(self.iconImg.mas_right).offset(20);
            make.height.equalTo(@20);
        }];
        
        // 地点图标
        self.placeIcon = [UIImageView new];
        [self.contentView addSubview:self.placeIcon];
        self.placeIcon.backgroundColor = RGB(156, 197, 28);
        [self.placeIcon mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.title.mas_bottom).offset(8);
            make.left.equalTo(self.iconImg.mas_right).offset(20);
            make.width.equalTo(@20);
            make.height.equalTo(@20);
        }];
        
        // 定位图标
        self.positioningImg = [UIImageView new];
        [self.contentView addSubview:self.positioningImg];
        self.positioningImg.backgroundColor = RGB(156, 197, 28);
        [self.positioningImg mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.placeIcon.mas_bottom).offset(8);
            make.left.equalTo(self.iconImg.mas_right).offset(20);
            make.width.equalTo(@20);
            make.height.equalTo(@20);
        }];
        
        // 时间图标
        self.timeImg = [UIImageView new];
        [self.contentView addSubview:self.timeImg];
        self.timeImg.backgroundColor = RGB(156, 197, 28);
        [self.timeImg mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.positioningImg.mas_bottom).offset(8);
            make.left.equalTo(self.iconImg.mas_right).offset(20);
            make.width.equalTo(@20);
            make.height.equalTo(@20);
        }];
        
        // 地点位置
        self.placeText = [UILabel new];
        self.placeText.text = [NSString stringWithFormat:@"定位地点：%@",@"北交大南门"];
        self.placeText.font = My_Font(10);
        self.placeText.textColor = RGB(153, 154, 154);
        [self.contentView addSubview:self.placeText];
        [self.placeText mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.title.mas_bottom).offset(8);
            make.left.equalTo(self.placeIcon.mas_right).offset(5);
            make.height.equalTo(@20);
        }];
        
        // 定位名称
        self.positioningName = [UILabel new];
        self.positioningName.text = @"北京交通大学第九教学楼";
        self.positioningName.font = My_Font(12);
        self.positioningName.textColor = RGB(153, 154, 154);
        [self.contentView addSubview:self.positioningName];
        [self.positioningName mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.placeText.mas_bottom).offset(8);
            make.left.equalTo(self.positioningImg.mas_right).offset(5);
            make.height.equalTo(@20);
        }];
        
        // 时间
        self.time = [UILabel new];
        self.time.text = @"发布时间 11.11日";
        self.time.font = My_Font(10);
        self.time.textColor = RGB(153, 154, 154);
        [self.contentView addSubview:self.time];
        [self.time mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.positioningName.mas_bottom).offset(8);
            make.left.equalTo(self.timeImg.mas_right).offset(5);
            make.height.equalTo(@20);
        }];
        
        // 判断加载钱或者解绑
        NSString *type = @"1";
        if ([type isEqualToString:@"1"]) {
            // 价钱
            self.money = [UILabel new];
            self.money.text = @"3元";
            self.money.font = My_Font(17);
            self.money.textColor = RGB(231, 134, 20);
            [self.contentView addSubview:self.money];
            [self.money mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.equalTo(self.contentView.mas_top).offset(32);
                make.right.equalTo(self.contentView.mas_right).offset(-10);
                make.height.equalTo(@20);
            }];
        }else {
            // 价钱
            self.unbundlingImg = [UIImageView new];
            self.unbundlingImg.backgroundColor = RGB(156, 197, 28);
            [self.contentView addSubview:self.unbundlingImg];
            [self.unbundlingImg mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.equalTo(self.contentView.mas_top).offset(32);
                make.right.equalTo(self.contentView.mas_right).offset(-10);
                make.height.equalTo(@30);
                make.width.equalTo(@60);
            }];
        }
        
        // 联系对话
        self.dialogueBtn = [UIButton new];
        self.dialogueBtn.backgroundColor = RGB(156, 197, 28);
        [self.contentView addSubview:self.dialogueBtn];
        [self.dialogueBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            NSString *type = @"1";
            if ([type isEqualToString:@"1"]) {
                make.top.equalTo(self.money.mas_bottom).offset(10);
            }else {
                make.top.equalTo(self.unbundlingImg.mas_bottom).offset(10);
            }
            make.right.equalTo(self.contentView.mas_right).offset(-10);
            make.height.equalTo(@30);
            make.width.equalTo(@30);
        }];
        
        // 待评价
        self.evaluateBtn = [UIButton new];
        self.evaluateBtn.backgroundColor = RGB(156, 197, 28);
        [self.evaluateBtn setTitle:@"待评价" forState:UIControlStateNormal];
        self.evaluateBtn.titleLabel.textColor = [UIColor whiteColor];
        self.evaluateBtn.titleLabel.font = My_Font(14);
        [self.contentView addSubview:self.evaluateBtn];
        self.evaluateBtn.userInteractionEnabled = YES;
        self.evaluateBtn.layer.masksToBounds = YES;
        self.evaluateBtn.layer.cornerRadius = 5;
        [self.evaluateBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo(self.contentView.mas_bottom).offset(-25);
            make.right.equalTo(self.contentView.mas_right).offset(-10);
            make.height.equalTo(@20);
            make.width.equalTo(@60);
        }];
    }
    return self;
}

// 模型赋值
//- (void)setXXXX:(XXXX *)XXXX {
//    _XXXX = XXXX;
//
//}


- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    // Configure the view for the selected state
}

@end
