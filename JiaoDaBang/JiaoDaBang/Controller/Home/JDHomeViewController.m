//
//  JDHomeViewController.m
//  页面
//
//  Created by apple on 17/3/18.
//  Copyright © 2017年 Sunjiandong. All rights reserved.
//

#import "MJExtension.h"

#import "JDHomeViewController.h"
#import "SDCycleScrollView.h"
#import "LXSegmentScrollView.h"
#import "SendTableViewCell.h"
// 自定义按钮 上下
#import "RightButtonNew.h"
#import "SDCycleScrollView.h"
// 主页条目的类型
typedef NS_ENUM(NSInteger, ItemType1) {
    ItemTypeQuKuaiDi          = 0,  // 取快递
    ItemTypeMaiLingShi        = 1,  // 买零食
    ItemTypeZhaoPaiDui        = 2,  // 找排队
    ItemTypeZhanZuoWei        = 3,  // 占座位
    ItemTypeZhaoFuZhu         = 4,  // 找辅导
    ItemTypeZhaoXueShen       = 5,  // 找学生
    ItemTypeGongYi            = 6,  // 公益
    ItemTypeQiTa              = 7   // 其他
};
// 主页条目的类型
typedef NS_ENUM(NSInteger, ItemType2) {
    ItemTypeQukuaidi          = 0,  // 取快递
    ItemTypeMailingshi        = 1,  // 买零食
    ItemTypeBangPaiDui        = 2,  // 帮排队
    ItemTypeBangZuoWei        = 3,  // 帮座位
    ItemTypeBangFuZhu         = 4,  // 帮辅导
    ItemTypeBangLaoShi        = 5,  // 帮老师
    ItemTypeGongYiBang        = 6,  // 帮公益
    ItemTypeQiTaBang          = 7   // 帮其他
};
static NSString *kCellIdentifier = @"Cell";
CGFloat const kScrollAspectRatio = 1 / 1.8; // 轮播图高宽比
@interface JDHomeViewController ()<SDCycleScrollViewDelegate,UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) SDCycleScrollView *cycleView;
// 导航
@property (nonatomic, strong) LXSegmentScrollView *scrollView;
// 导航子页面
@property (nonatomic, strong) UIView *view1;
@property (nonatomic, strong) UIView *view2;
@property (nonatomic, strong) UITableView *tableView3;
// 帮助子按钮
@property (nonatomic, strong) RightButtonNew *helpButton1;
// 按钮字
@property (nonatomic, strong) NSArray *btnText1;
// 按钮图
@property (nonatomic, strong) NSArray *btnIcon1;
// 帮人子按钮
@property (nonatomic, strong) RightButtonNew *helpButton2;
// 按钮字
@property (nonatomic, strong) NSArray *btnText2;
// 按钮图
@property (nonatomic, strong) NSArray *btnIcon2;
// 快递直达头部的数量
@property (nonatomic, strong) UILabel *arriveLabel;
// 底部tableView
@property (nonatomic, strong) UITableView *tableViews;

@property (nonatomic, strong) NSArray *dataListArray;

// 底层滚动
@property (nonatomic, strong) UIScrollView *scrollView11;

@end

@implementation JDHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//    self.view.backgroundColor = [UIColor grayColor];
    // 底部滚动
    _scrollView11 = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, MAIN_SCREEN_WIDTH, MAIN_SCREEN_HEIGHT)];
    _scrollView11.contentSize = CGSizeMake(self.view.frame.size.width,MAIN_SCREEN_HEIGHT+45);
    [self.view addSubview:_scrollView11];
    
    [self loadData];
}

- (void)loadData {

    // Request
    HomeBannerListRequest *homeBannerListRequest = [[HomeBannerListRequest alloc] init];
    [homeBannerListRequest setSuccessBlock:^(id object, id responseObject) {
        DLog(@"------首页轮播列表数据请求成功");
        
        HomeBannerInfoData *homeBannerInfo = (HomeBannerInfoData *)object;
        
        [self addLoadFigureWithWithBannerInfo:homeBannerInfo];

        [self addLoadSrorllView];

    }];
    [homeBannerListRequest setFailureBlock:^(NSInteger errorCode, id responseObject) {
        DLog(@"------首页轮播列表数据请求失败");
    }];
    [homeBannerListRequest sendRequest];
    
    NewsListRequest *neswListRequest = [[NewsListRequest alloc] init];
    [neswListRequest setSuccessBlock:^(id object, id responseObject) {
        
        DLog(@"------新闻列表数据请求成功");
        NewsListData *listData = (NewsListData *)object;
        self.dataListArray = listData.dataListArray;
        [self setupTableView];
        // 需要刷新对应的tableView
        [self.tableViews reloadData];
    }];
    [neswListRequest setFailureBlock:^(NSInteger errorCode, id responseObject) {
        
        DLog(@"------新闻列表数据失败");
        
    }];
    [neswListRequest sendRequest];

}

// 加载轮播图
- (void)addLoadFigureWithWithBannerInfo:(HomeBannerInfoData *)homeBannerInfo {
    _cycleView = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, 0, MAIN_SCREEN_WIDTH, MAIN_SCREEN_WIDTH * kScrollAspectRatio) delegate:self placeholderImage:nil];
    _cycleView.pageDotColor = [UIColor whiteColor];
    _cycleView.currentPageDotColor = [UIColor blackColor];
    [_scrollView11 addSubview:_cycleView];
    // 轮播图数据赋值
    
    NSMutableArray *cycleUrlArray = [[NSMutableArray alloc] init];
    [homeBannerInfo.bannerDataArray enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        BannerInfoData *infoData = (BannerInfoData *)obj;
        [cycleUrlArray addObject:infoData.bannerUrl];
    }];
    self.cycleView.imageURLStringsGroup = cycleUrlArray.copy;
}

#pragma mark - SDCycleScrollView Delegate
- (void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didSelectItemAtIndex:(NSInteger)index {
    
}

- (void)setupTableView {

    self.tableViews = [[UITableView alloc] initWithFrame:CGRectMake(0, 440, MAIN_SCREEN_WIDTH, MAIN_SCREEN_HEIGHT)];
    self.tableViews.showsVerticalScrollIndicator = NO;
    self.tableViews.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.tableViews registerClass:[UITableViewCell class] forCellReuseIdentifier:kCellIdentifier];
    self.tableViews.delegate = self;
    self.tableViews.dataSource = self;
    [_scrollView11 addSubview:self.tableViews];
}

// 导航
- (void)addLoadSrorllView {
    NSMutableArray *array = [NSMutableArray array];
    for (int i =0; i<3; i++) {
        if (i == 0) {
            self.view1 = [[UIView alloc] init];
            self.view1.backgroundColor = [UIColor whiteColor];
            [array addObject:self.view1];
            //总列数
            int _totalColumns = 4;
            CGFloat _appW = 45;
            CGFloat _appH = 45;
            CGFloat margin = (MAIN_SCREEN_WIDTH - (_totalColumns * 50)) / (_totalColumns + 1);
            for (int index = 0; index < 8; index++) {
                //创建按钮
                _helpButton1 = [RightButtonNew new];
                _helpButton1.tag = index;
                // 图片循环加载 （替换）
                [_helpButton1 setImage:[UIImage imageNamed:self.btnIcon1[index]] forState:UIControlStateNormal];
                // 文字循环
                [_helpButton1 setTitle:self.btnText1[index] forState:UIControlStateNormal];
                _helpButton1.titleLabel.font = [UIFont boldSystemFontOfSize:10];
                [_helpButton1 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
                [_helpButton1 addTarget:self action:@selector(helpButtonONEClick:) forControlEvents:UIControlEventTouchUpInside];
                //行号
                int row = index / 4;
                //列号
                int col = index % 4;
                CGFloat appX = margin + col * (_appW + margin);
                CGFloat appY = 10 + row * (_appH + margin);
                _helpButton1.frame = CGRectMake(appX, appY, _appW, _appH);
                [self.view1 addSubview:_helpButton1];
            }
        }
        if (i == 1) {
            self.view2 = [[UIView alloc] init];
            self.view2.backgroundColor = [UIColor whiteColor];
            [array addObject:self.view2];
            //总列数
            int _totalColumns = 4;
            CGFloat _appW = 45;
            CGFloat _appH = 45;
            CGFloat margin = (MAIN_SCREEN_WIDTH - (_totalColumns * 50)) / (_totalColumns + 1);
            for (int index = 0; index < 8; index++) {
                //创建按钮
                _helpButton2 = [RightButtonNew new];
                _helpButton2.tag = index;
                // 图片循环加载 （替换）
                [_helpButton2 setImage:[UIImage imageNamed:self.btnIcon2[index]] forState:UIControlStateNormal];
                // 文字循环
                [_helpButton2 setTitle:self.btnText2[index] forState:UIControlStateNormal];
                _helpButton2.titleLabel.font = [UIFont boldSystemFontOfSize:10];
                [_helpButton2 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
                [_helpButton2 addTarget:self action:@selector(helpButtonTOWClick:) forControlEvents:UIControlEventTouchUpInside];
                //行号
                int row = index / 4;
                //列号
                int col = index % 4;
                CGFloat appX = margin + col * (_appW + margin);
                CGFloat appY = 10 + row * (_appH + margin);
                _helpButton2.frame = CGRectMake(appX, appY, _appW, _appH);
                [self.view2 addSubview:_helpButton2];
            }
        }
        if (i == 2) {
            self.tableView3 = [[UITableView alloc] initWithFrame:[UIScreen mainScreen].bounds];
            [self.tableView3 registerClass:[SendTableViewCell class] forCellReuseIdentifier:@"SendTableViewCell"];
            self.tableView3.showsVerticalScrollIndicator = NO;
            self.tableView3.separatorStyle = UITableViewCellSeparatorStyleNone;
            _tableView3.delegate = self;
            _tableView3.dataSource = self;
            [array addObject:_tableView3];
        }
    }

    // 初始化导航
    _scrollView = [[LXSegmentScrollView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(self.cycleView.frame), MAIN_SCREEN_WIDTH, 240) titleArray:@[@"求助",@"帮人",@"快递直送"] contentViewArray:array];
    [_scrollView11 addSubview:_scrollView];
}

// view1 中的按钮点击事件
- (void)helpButtonONEClick:(UIButton *)sender {
    if (sender.tag == ItemTypeQuKuaiDi) {
        NSLog(@"1");
    }else if (sender.tag == ItemTypeMaiLingShi) {
        NSLog(@"2");
    }else if (sender.tag == ItemTypeZhaoPaiDui) {
        NSLog(@"3");
    }else if (sender.tag == ItemTypeZhanZuoWei) {
        NSLog(@"4");
    }else if (sender.tag == ItemTypeZhaoFuZhu) {
        NSLog(@"5");
    }else if (sender.tag == ItemTypeZhaoXueShen) {
        NSLog(@"6");
    }else if (sender.tag == ItemTypeGongYi) {
        NSLog(@"7");
    }else if (sender.tag == ItemTypeQiTa) {
        NSLog(@"8");
    }
}

// view2 中的按钮点击事件
- (void)helpButtonTOWClick:(UIButton *)sender {
    if (sender.tag == ItemTypeQukuaidi) {
        NSLog(@"10");
    }else if (sender.tag == ItemTypeMailingshi) {
        NSLog(@"20");
    }else if (sender.tag == ItemTypeBangPaiDui) {
        NSLog(@"30");
    }else if (sender.tag == ItemTypeBangZuoWei) {
        NSLog(@"40");
    }else if (sender.tag == ItemTypeBangFuZhu) {
        NSLog(@"50");
    }else if (sender.tag == ItemTypeBangLaoShi) {
        NSLog(@"60");
    }else if (sender.tag == ItemTypeGongYiBang) {
        NSLog(@"70");
    }else if (sender.tag == ItemTypeQiTaBang) {
        NSLog(@"80");
    }
}

/*
 
 */
#pragma  mark tableviewdatasourceDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (tableView == self.tableView3) {
        return 3;
    }else {
        
        // 新闻列表行数
        return self.dataListArray.count;
    }
    
}

//- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
//    return 60;
//}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    if (tableView == self.tableView3) {
        return 50;
    }else {
        return 0;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (tableView == self.tableView3) {
        SendTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"SendTableViewCell" forIndexPath:indexPath];
        cell.selectionStyle = UITableViewCellSeparatorStyleNone;
        cell.title.text = @"ffffffffffff";
        return cell;
    }else {
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kCellIdentifier forIndexPath:indexPath];
        cell.selectionStyle = UITableViewCellSeparatorStyleNone;
        // 新闻列表模型赋值
        NewsInfoData *listData = [NewsInfoData mj_objectWithKeyValues:self.dataListArray[indexPath.row]];
        cell.textLabel.text = listData.title;
        return cell;
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (tableView == self.tableView3) {
        // 快递直达点击监听
        DLog(@"第：%@条快递直达",indexPath);
        
    }else {
        
        // 新闻列表模型赋值
        NewsInfoData *listData = [NewsInfoData mj_objectWithKeyValues:self.dataListArray[indexPath.row]];
        DLog(@"第：%@条新闻",listData.newsId);
        
    }
    
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    
    if (tableView == self.tableView3) {
        UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, MAIN_SCREEN_WIDTH, 50)];
        headerView.backgroundColor = [UIColor whiteColor];
        // 图片
        UIImageView *icon = [UIImageView new];
        icon.backgroundColor = RGB(156, 197, 28);
        [headerView addSubview:icon];
        [icon mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(headerView.mas_left).offset(8);
            make.top.equalTo(headerView.mas_top).offset(10);
            make.height.equalTo(@30);
            make.width.equalTo(@40);
        }];
        // 您有N个包囊到达学校的数量
        _arriveLabel = [UILabel new];
        // 赋值str
        NSString *str = @"5";
        _arriveLabel.text = [NSString stringWithFormat:@"您有%@个包裹到达学校！",str];
        [headerView addSubview:_arriveLabel];
        [_arriveLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(icon.mas_right).offset(5);
            make.top.equalTo(headerView.mas_top).offset(10);
            make.height.equalTo(@30);
        }];
        
        // 更多按钮
        UIButton *more = [UIButton new];
        [more setTitle:@"更多 >" forState:UIControlStateNormal];
        [more setTitleColor:RGB(146, 230, 73) forState:UIControlStateNormal];
        [more addTarget:self action:@selector(moreButtonClick:) forControlEvents:UIControlEventTouchUpInside];
        [headerView addSubview:more];
        [more mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(headerView.mas_right).offset(-10);
            make.top.equalTo(headerView.mas_top).offset(10);
            make.height.equalTo(@30);
            make.width.equalTo(@80);
        }];
        return headerView;
    }else {
        UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 0, 0)];
        return headerView;
    }
}

// 更多点击事件
- (void)moreButtonClick:(UIButton *)sender {
    NSLog(@"更多··············");
}

/*-------求助-------*/
- (NSArray *)btnText1 {
    if (!_btnText1) {
        _btnText1 = @[@"取快递",@"买零食",@"找排队",@"占座位",@"找辅导",@"找学生",@"公益之窗",@"其它"];
    }
    return _btnText1;
}
- (NSArray *)btnIcon1 {
    if (!_btnIcon1) {
        _btnIcon1 = @[@"weixin",@"weixin",@"weixin",@"weixin",@"weixin",@"weixin",@"weixin",@"weixin"];
    }
    return _btnIcon1;
}
/*-------帮人-------*/
- (NSArray *)btnText2 {
    if (!_btnText2) {
        _btnText2 = @[@"取快递",@"买零食",@"帮排队",@"帮占位",@"帮辅导",@"帮老师",@"公益之窗",@"其它"];
    }
    return _btnText2;
}
- (NSArray *)btnIcon2 {
    if (!_btnIcon2) {
        _btnIcon2 = @[@"weixin",@"weixin",@"weixin",@"weixin",@"weixin",@"weixin",@"weixin",@"weixin"];
    }
    return _btnIcon2;
}


@end
