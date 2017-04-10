//
//  SeekViewController.m
//  JiaoDaBang
//
//  Created by Heaven on 2016/12/15.
//  Copyright © 2016年 Heaven. All rights reserved.
//

#import "SeekViewController.h"
#import "PublishInfoView.h"
#import "ProcessingOrderView.h"
#import "CompletedOrderView.h"
#import "OrderDetailViewController.h"

@interface SeekViewController () <UIScrollViewDelegate, ProcessingOrderViewDelegate, CompletedOrderViewDelegate>

@property (nonatomic, weak) UIButton *seekBtn;
@property (nonatomic, weak) UIButton *processingBtn;
@property (nonatomic, weak) UIButton *completedBtn;

@property (nonatomic, weak) UIView *titleUnderlineView;
@property (nonatomic, weak) UIButton *selectedButton;
@property (nonatomic, weak) UIScrollView *scrollView;
@property (nonatomic, strong) NSMutableArray *buttonsArray;

@property (nonatomic, weak) PublishInfoView *publishInfoView;

@end

@implementation SeekViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor colorWithHexString:@"#fafafa"];

    [self setupButtons];
    
    [self setupScrollView];
}

- (void)setupButtons {

    UIView *buttonView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 60)];
    buttonView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:buttonView];
    
    UIButton *seekBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [seekBtn addTarget:self action:@selector(chooseCurrentView:) forControlEvents:UIControlEventTouchUpInside];
    seekBtn.tag = 0;
    [seekBtn setFrame:CGRectMake(0, 0, SCREEN_WIDTH/3, 60)];
    seekBtn.titleLabel.font = [UIFont systemFontOfSize:14];
    [seekBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [seekBtn setTitleColor:CustomGreen forState:UIControlStateHighlighted];
    [seekBtn setTitleColor:CustomGreen forState:UIControlStateSelected];
    [seekBtn setTitle:@"发布求助" forState:UIControlStateNormal];
    seekBtn.selected = YES;
    [buttonView addSubview:seekBtn];
    self.seekBtn = seekBtn;
    self.selectedButton = seekBtn;
    
    UIButton *processingBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [processingBtn addTarget:self action:@selector(chooseCurrentView:) forControlEvents:UIControlEventTouchUpInside];
    processingBtn.tag = 1;
    [processingBtn setFrame:CGRectMake(SCREEN_WIDTH/3, 0, SCREEN_WIDTH/3, 60)];
    processingBtn.titleLabel.font = [UIFont systemFontOfSize:14];
    [processingBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [processingBtn setTitleColor:CustomGreen forState:UIControlStateHighlighted];
    [processingBtn setTitleColor:CustomGreen forState:UIControlStateSelected];
    [processingBtn setTitle:@"正在进行" forState:UIControlStateNormal];
    [buttonView addSubview:processingBtn];
    self.processingBtn = processingBtn;
    
    UIButton *completedBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [completedBtn addTarget:self action:@selector(chooseCurrentView:) forControlEvents:UIControlEventTouchUpInside];
    completedBtn.tag = 2;
    [completedBtn setFrame:CGRectMake((SCREEN_WIDTH/3)*2, 0,SCREEN_WIDTH/3, 60)];
    completedBtn.titleLabel.font = [UIFont systemFontOfSize:14];
    [completedBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [completedBtn setTitleColor:CustomGreen forState:UIControlStateHighlighted];
    [completedBtn setTitleColor:CustomGreen forState:UIControlStateSelected];
    [completedBtn setTitle:@"已完成" forState:UIControlStateNormal];
    [buttonView addSubview:completedBtn];
    self.completedBtn = completedBtn;
    
    [self.buttonsArray addObject:seekBtn];
    [self.buttonsArray addObject:processingBtn];
    [self.buttonsArray addObject:completedBtn];
    
    // 标题底部的指示线
    UIView *titleUnderlineView = [[UIView alloc] initWithFrame:CGRectMake(0, 59, SCREEN_WIDTH/3, 1)];
    titleUnderlineView.backgroundColor = CustomGreen;
    [buttonView addSubview:titleUnderlineView];
    self.titleUnderlineView = titleUnderlineView;

}

- (void)setupScrollView {
    
    // 不要自动调整scrollView的inset
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 60, SCREEN_WIDTH, SCREEN_HEIGHT-60-69-44)];
    scrollView.delegate = self;
    scrollView.pagingEnabled = YES;
    scrollView.showsHorizontalScrollIndicator = NO;
    scrollView.showsVerticalScrollIndicator = NO;
    scrollView.contentSize = CGSizeMake(SCREEN_WIDTH*3, 0);
    [self.view addSubview:scrollView];
    self.scrollView = scrollView;
    
    PublishInfoView *publishInfoView = [[PublishInfoView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT-60-69-44)];
    [self.scrollView addSubview:publishInfoView];
    
    ProcessingOrderView *processOrderVeiw = [[ProcessingOrderView alloc] initWithFrame:CGRectMake(SCREEN_WIDTH, 0, SCREEN_WIDTH, SCREEN_HEIGHT-60-69-44)];
    processOrderVeiw.delegate = self;
    [self.scrollView addSubview:processOrderVeiw];
    
    CompletedOrderView *completedOrderView = [[CompletedOrderView alloc] initWithFrame:CGRectMake(SCREEN_WIDTH*2, 0, SCREEN_WIDTH, SCREEN_HEIGHT-60-69-44)];
    completedOrderView.delegate = self;
    [self.scrollView addSubview:completedOrderView];
}

- (void)jumptoDetailWithOrderData:(OrderData *)order {

    OrderDetailViewController *detailVC = [[OrderDetailViewController alloc] initWithOrderData:order];
    [self.navigationController pushViewController:detailVC animated:YES];
}

- (void)chooseCurrentView:(UIButton *)sender {

    // 修改按钮状态
    self.selectedButton.selected = NO;
    sender.selected = YES;
    self.selectedButton = sender;
    
    // 移动底部下划线
    [UIView animateWithDuration:0.25 animations:^{
        [self.titleUnderlineView setFrame:CGRectMake(sender.tag*(SCREEN_WIDTH/3), 59, SCREEN_WIDTH/3, 1)];
    }];
    
    // 让scrollView滚动到对应的位置(不要去修改contentOffset的y值)
    CGPoint offset = self.scrollView.contentOffset;
    offset.x = sender.tag * self.scrollView.yt_width;
    [self.scrollView setContentOffset:offset animated:YES];
}

#pragma mark - <UIScrollViewDelegate>
/**
 *  滚动完毕就会调用（如果不是人为拖拽scrollView导致滚动完毕，才会调用这个方法）
 */
- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView {
    int index = scrollView.contentOffset.x / SCREEN_WIDTH;
}

/**
 *  滚动完毕就会调用（如果是人为拖拽scrollView导致滚动完毕，才会调用这个方法）
 */
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    int index = scrollView.contentOffset.x / SCREEN_WIDTH;
    // 点击对应的按钮
    [self chooseCurrentView:self.buttonsArray[index]];
    
    // 添加子控制器的view
    [self scrollViewDidEndScrollingAnimation:scrollView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSMutableArray *)buttonsArray {

    if (_buttonsArray == nil) {
        _buttonsArray = [[NSMutableArray alloc] init];
    }
    return _buttonsArray;
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
