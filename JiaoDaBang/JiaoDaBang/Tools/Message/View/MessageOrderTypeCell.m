//
//  MessageOrderTypeCell.m
//  MiTang_Client
//
//  Created by Heaven on 16/4/27.
//  Copyright © 2016年 Heaven. All rights reserved.
//

#import "MessageOrderTypeCell.h"
#import "Masonry.h"

@interface MessageOrderTypeCell ()<UIGestureRecognizerDelegate>

@property(nonatomic, assign) EMMessageBodyType messageType;
@property(nonatomic, strong) UIImageView *orderImageView;
@property(nonatomic, strong) UILabel *orderTitleLabel;
@property(nonatomic, strong) UILabel *orderIdLabel;
@property(nonatomic, strong) UILabel *orderDetailLabel;
@property(nonatomic, strong) UILabel *orderTimeLabel;
@property(nonatomic, strong) UIImageView *orderView;

@property(nonatomic, strong) NSString *orderId;
@property(nonatomic, strong) UITapGestureRecognizer *tapRecognizer;
@property(nonatomic, strong) UITapGestureRecognizer *tapRecognizer2;


@end

@implementation MessageOrderTypeCell

- (void)awakeFromNib {
    // Initialization code
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier model:(id<IMessageModel>)model {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        _messageType = model.bodyType;
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        [self configSubviewsWithType:_messageType isSender:model.isSender model:model];
    }
    
    return self;
}

- (UIImageView *)orderImageView {
    if (_orderImageView == nil) {
        _orderImageView = [[UIImageView alloc]init];
        _orderImageView.contentMode = UIViewContentModeScaleToFill;
        _orderImageView.layer.cornerRadius = 3;
        _orderImageView.layer.masksToBounds = YES;
        _orderImageView.userInteractionEnabled = YES;
        _orderImageView.backgroundColor = [UIColor clearColor];
    }
    
    return _orderImageView;
}

- (UILabel *)orderTitleLabel {
    if (_orderTitleLabel == nil) {
        _orderTitleLabel = [[UILabel alloc]init];
        _orderTitleLabel.font = [UIFont systemFontOfSize:16];
        _orderTitleLabel.userInteractionEnabled = YES;
    }
    
    return _orderTitleLabel;
}

- (UILabel *)orderIdLabel {
    if (_orderIdLabel == nil) {
        _orderIdLabel = [[UILabel alloc]init];
        _orderIdLabel.font = [UIFont systemFontOfSize:14];
        _orderIdLabel.textColor = [UIColor grayColor];
        _orderIdLabel.userInteractionEnabled = YES;
    }
    
    return _orderIdLabel;
}

- (UILabel *)orderDetailLabel {
    if (_orderDetailLabel == nil) {
        _orderDetailLabel = [[UILabel alloc]init];
        _orderDetailLabel.numberOfLines = 2;
        _orderDetailLabel.font = [UIFont systemFontOfSize:14];
        _orderDetailLabel.textColor = [UIColor grayColor];
        _orderDetailLabel.userInteractionEnabled = YES;
    }
    
    return _orderDetailLabel;
}

- (UILabel *)orderTimeLabel {
    if (_orderTimeLabel == nil) {
        _orderTimeLabel = [[UILabel alloc]init];
        _orderTimeLabel.font = [UIFont systemFontOfSize:14];
        _orderTimeLabel.textColor = [UIColor grayColor];
        _orderTimeLabel.userInteractionEnabled = YES;
    }
    
    return _orderTimeLabel;
}

- (void)configSubviewsWithType:(EMMessageBodyType)messageType
                      isSender:(BOOL)isSender
                         model:(id<IMessageModel>)model
{
    UIImage *image = model.image;
    if (!image) {
        image = model.thumbnailImage;
        if (!image) {
            [self.orderImageView sd_setImageWithURL:[NSURL URLWithString:model.fileURLPath] placeholderImage:[UIImage imageNamed:model.failImageName]];
        }
        else {
            self.orderImageView.image = image;
        }
    }
    else {
        self.orderImageView.image = image;
    }
    
    NSString *orderTitle = [model.message.ext objectForKey:@"orderTitle"];
    NSString *orderId = [model.message.ext objectForKey:@"orderId"];
    NSString *orderDetail = [model.message.ext objectForKey:@"orderDetail"];
    NSString *orderTime = [model.message.ext objectForKey:@"orderTime"];
    
    self.orderId = orderId;
    self.orderTitleLabel.text = orderTitle;
    self.orderIdLabel.text = [NSString stringWithFormat:@"订单编号: %@",orderId];
    self.orderDetailLabel.text = [NSString stringWithFormat:@"内容: %@",orderDetail];
    self.orderTimeLabel.text = [NSString stringWithFormat:@"交易时间: %@",orderTime];
    
    self.orderView = [[UIImageView alloc]init];
//    [self.orderView setBackgroundColor:RGBACOLOR(239, 239, 239, 1)];
//    self.orderView.layer.cornerRadius = 3;
//    self.orderView.layer.masksToBounds = YES;
    self.orderView.userInteractionEnabled = YES;
    self.orderView.image = [UIImage imageNamed:@"NavBot_bg"];
    self.orderView.layer.shadowOffset = CGSizeMake(0, 2);
    self.orderView.layer.shadowRadius = 2;
    self.orderView.layer.shadowColor = [UIColor blackColor].CGColor;
    self.orderView.layer.shadowOpacity = 0.5;
    
    
    [self.orderView addSubview:self.orderImageView];
    [self.orderView addSubview:self.orderTitleLabel];
    [self.orderView addSubview:self.orderIdLabel];
    [self.orderView addSubview:self.orderDetailLabel];
    [self.orderView addSubview:self.orderTimeLabel];
    
    [self.contentView addSubview:self.orderView];
    
    self.tapRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(orderImageViewTap:)];
    [self.orderImageView addGestureRecognizer:self.tapRecognizer];
    
    self.tapRecognizer2 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(orderImageViewTap:)];
    [self.orderDetailLabel addGestureRecognizer:self.tapRecognizer2];
    
    [self cellViewLayout];
}


- (void)updateConstraints
{
    [self cellViewLayout];
    [super updateConstraints];
}

-(void)cellViewLayout
{
    __weak typeof(self) weakSelf = self;
    
    [self.orderView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.contentView.mas_top).with.offset(30);
        make.left.equalTo(weakSelf.contentView).with.offset(10);
        make.bottom.equalTo(weakSelf.contentView.mas_bottom).with.offset(-30);
        make.right.equalTo(weakSelf.contentView.mas_right).with.offset(-10);
    }];
    
    [self.orderImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.orderView.mas_top).with.offset(10);
        make.left.equalTo(weakSelf.orderView.mas_left).with.offset(10);
        make.bottom.equalTo(weakSelf.orderView.mas_bottom).with.offset(-10);
        make.width.mas_equalTo(90);
    }];
    
    [self.orderTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.orderView.mas_top).with.offset(10);
        make.left.equalTo(weakSelf.orderView.mas_left).with.offset(110);
        make.right.equalTo(weakSelf.orderView.mas_right);
        make.height.mas_equalTo(20);
    }];
    
    [self.orderIdLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.orderView.mas_top).with.offset(40);
        make.left.equalTo(weakSelf.orderView.mas_left).with.offset(110);
        make.right.equalTo(weakSelf.orderView.mas_right);
        make.height.mas_equalTo(18);
    }];
    
    [self.orderDetailLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.orderView.mas_top).with.offset(58);
        make.left.equalTo(weakSelf.orderView.mas_left).with.offset(110);
        make.right.equalTo(weakSelf.orderView.mas_right);
        make.height.mas_equalTo(34);
    }];
    
    [self.orderTimeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.orderView.mas_top).with.offset(92);
        make.left.equalTo(weakSelf.orderView.mas_left).with.offset(110);
        make.bottom.equalTo(weakSelf.orderView.mas_bottom).with.offset(-10);
        make.right.equalTo(weakSelf.orderView.mas_right);
    }];
}

- (void)orderImageViewTap:(UITapGestureRecognizer *)tapRecognizer
{
    if (!self.orderId) {
        return;
    }
    
    if ([_delegate respondsToSelector:@selector(presentMessageDetailForOrder:)]) {
        [_delegate presentMessageDetailForOrder:self.orderId];
    }
}

@end
