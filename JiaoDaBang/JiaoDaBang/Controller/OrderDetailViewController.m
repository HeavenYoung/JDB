//
//  OrderDetailViewController.m
//  JiaoDaBang
//
//  Created by 詹鹏翼 on 2017/4/7.
//  Copyright © 2017年 Heaven. All rights reserved.
//

#import "OrderDetailViewController.h"


#define LABEL_INITIAL_HEIGHT 35
#define FIRST_LABEL_X 20
#define FIRST_LABEL_HEIGHT 90

@interface OrderDetailViewController ()

@property (nonatomic, strong) OrderData *orderData;

@end

@implementation OrderDetailViewController

- (instancetype)initWithOrderData:(OrderData *)orderData {

    self = [super init];
    if (self) {
        self.orderData = orderData;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"订单详情";
    self.view.backgroundColor = [UIColor colorWithHexString:@"#fafafa"];
    [self setUI];
    // Do any additional setup after loading the view.
}

- (void)setUI {
    
    UIView *backView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 280)];
    backView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:backView];
    
    UIImageView *avatarView = [[UIImageView alloc] init];
    avatarView.backgroundColor = [UIColor randomColor];
    avatarView.userInteractionEnabled = YES;
    avatarView.layer.cornerRadius = 30;
    avatarView.layer.masksToBounds = YES;
    [backView addSubview:avatarView];
    [avatarView sd_setImageWithURL:[NSURL URLWithString:self.orderData.releaseAvatar]];
    [avatarView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@15);
        make.left.equalTo(@10);
        make.size.mas_equalTo(CGSizeMake(60, 60));
    }];

    UIImageView *sexView = [[UIImageView alloc] init];
    sexView.backgroundColor = [UIColor randomColor];
    sexView.userInteractionEnabled = YES;
    [backView addSubview:sexView];
    [sexView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(avatarView.mas_top).offset(10);
        make.left.equalTo(avatarView.mas_right).offset(20);
        make.size.mas_equalTo(CGSizeMake(12, 12));
    }];
    
    UILabel *nicknameLabel = [[UILabel alloc] init];
    nicknameLabel.font = [UIFont systemFontOfSize:16];
    NSString *nameString = self.orderData.releaseNickName ? self.orderData.releaseNickName : self.orderData.releaseUserName;
    nicknameLabel.text = nameString;
    nicknameLabel.textColor = [UIColor blackColor];
    [backView addSubview:nicknameLabel];
    [nicknameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(sexView.mas_centerY);
        make.left.equalTo(sexView.mas_right).offset(10);
    }];
    
    UILabel *profileLabel = [[UILabel alloc] initWithFrame:CGRectMake(FIRST_LABEL_X, FIRST_LABEL_HEIGHT, SCREEN_WIDTH/4, LABEL_INITIAL_HEIGHT)];
    profileLabel.backgroundColor = [UIColor whiteColor];
    profileLabel.text = @"求助内容";
    UILabel *profileLabelContent = [[UILabel alloc] initWithFrame:CGRectMake(FIRST_LABEL_X + SCREEN_WIDTH/4, FIRST_LABEL_HEIGHT, SCREEN_WIDTH * 0.75, LABEL_INITIAL_HEIGHT)];
    profileLabelContent.backgroundColor = [UIColor whiteColor];
    profileLabelContent.text = @"测试求助内容";
    
    UILabel *location = [[UILabel alloc] initWithFrame:CGRectMake(FIRST_LABEL_X, FIRST_LABEL_HEIGHT + LABEL_INITIAL_HEIGHT, SCREEN_WIDTH/4, LABEL_INITIAL_HEIGHT)];
    location.backgroundColor = [UIColor whiteColor];
    location.text = @"求助定位";
    UILabel *locationContent = [[UILabel alloc] initWithFrame:CGRectMake(FIRST_LABEL_X + SCREEN_WIDTH/4, FIRST_LABEL_HEIGHT + LABEL_INITIAL_HEIGHT, SCREEN_WIDTH * 0.75, LABEL_INITIAL_HEIGHT)];
    locationContent.backgroundColor = [UIColor whiteColor];
    locationContent.text = @"测试求助内容";
    
    UILabel *address = [[UILabel alloc] initWithFrame:CGRectMake(FIRST_LABEL_X, FIRST_LABEL_HEIGHT + 2*LABEL_INITIAL_HEIGHT, SCREEN_WIDTH/4, LABEL_INITIAL_HEIGHT)];
    address.backgroundColor = [UIColor whiteColor];
    address.text = @"送达地址";
    UILabel *addressContent = [[UILabel alloc] initWithFrame:CGRectMake(FIRST_LABEL_X + SCREEN_WIDTH/4, FIRST_LABEL_HEIGHT + 2*LABEL_INITIAL_HEIGHT, SCREEN_WIDTH * 0.75, LABEL_INITIAL_HEIGHT)];
    addressContent.backgroundColor = [UIColor whiteColor];
    addressContent.text = @"送达地址内容";
    
    UILabel *money = [[UILabel alloc] initWithFrame:CGRectMake(FIRST_LABEL_X, FIRST_LABEL_HEIGHT + 3*LABEL_INITIAL_HEIGHT, SCREEN_WIDTH/4, LABEL_INITIAL_HEIGHT)];
    money.backgroundColor = [UIColor whiteColor];
    money.text = @"金额";
    UILabel *moneyContent = [[UILabel alloc] initWithFrame:CGRectMake(FIRST_LABEL_X + SCREEN_WIDTH/4, FIRST_LABEL_HEIGHT + 3*LABEL_INITIAL_HEIGHT, SCREEN_WIDTH * 0.75, LABEL_INITIAL_HEIGHT)];
    moneyContent.backgroundColor = [UIColor whiteColor];
    moneyContent.text = @"金额内容";
    
    UILabel *memo = [[UILabel alloc] initWithFrame:CGRectMake(FIRST_LABEL_X, FIRST_LABEL_HEIGHT + 4*LABEL_INITIAL_HEIGHT, SCREEN_WIDTH/4, LABEL_INITIAL_HEIGHT)];
    memo.backgroundColor = [UIColor whiteColor];
    memo.text = @"备注";
    UILabel *memoContent = [[UILabel alloc] initWithFrame:CGRectMake(FIRST_LABEL_X + SCREEN_WIDTH/4, FIRST_LABEL_HEIGHT + 4*LABEL_INITIAL_HEIGHT, SCREEN_WIDTH * 0.75, LABEL_INITIAL_HEIGHT)];
    memoContent.backgroundColor = [UIColor whiteColor];
    memoContent.text = @"备注内容";
    
    [backView addSubview:profileLabel];
    [backView addSubview:profileLabelContent];
    [backView addSubview:location];
    [backView addSubview:locationContent];
    [backView addSubview:address];
    [backView addSubview:addressContent];
    [backView addSubview:money];
    [backView addSubview:moneyContent];
    [backView addSubview:memo];
    [backView addSubview:memoContent];
    
    profileLabelContent.text = self.orderData.orderTypeName;
    locationContent.text = [NSString stringWithFormat:@"%@%@",self.orderData.srcName,self.orderData.srcDetail];
    addressContent.text = [NSString stringWithFormat:@"%@%@",self.orderData.desName,self.orderData.desDetail];
    moneyContent.text = [NSString stringWithFormat:@"%@元" , self.orderData.money];
    memoContent.text = self.orderData.remark;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
