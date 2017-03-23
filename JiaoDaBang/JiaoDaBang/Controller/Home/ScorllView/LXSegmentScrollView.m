//
//  LXSegmentScrollView.m
//  LiuXSegment
//
//  Created by liuxin on 16/5/17.
//  Copyright © 2016年 liuxin. All rights reserved.
//


#import "LXSegmentScrollView.h"
#import "LiuXSegmentView.h"

@interface LXSegmentScrollView()<UIScrollViewDelegate>

@property (strong,nonatomic)UIScrollView *bgScrollView;
@property (strong,nonatomic)LiuXSegmentView *segmentToolView;
@property (assign,nonatomic) NSInteger arrayCount;

@end

@implementation LXSegmentScrollView


-(instancetype)initWithFrame:(CGRect)frame
                  titleArray:(NSArray *)titleArray
            contentViewArray:(NSArray *)contentViewArray{
    if (self = [super initWithFrame:frame]) {
        self.arrayCount = contentViewArray.count;
        [self addSubview:self.bgScrollView];
        _segmentToolView=[[LiuXSegmentView alloc] initWithFrame:CGRectMake(0, 0, MAIN_SCREEN_WIDTH, 44) titles:titleArray clickBlick:^void(NSInteger index) {
            // 回调输出
//            NSLog(@"-----%ld",index);
            [_bgScrollView setContentOffset:CGPointMake(MAIN_SCREEN_WIDTH*(index-1), 0)];
        }];
        [self addSubview:_segmentToolView];
        for (int i=0;i<contentViewArray.count; i++ ) {
            UIView *contentView = (UIView *)contentViewArray[i];
            contentView.frame=CGRectMake(MAIN_SCREEN_WIDTH * i, _segmentToolView.bounds.size.height, MAIN_SCREEN_WIDTH, 180);
            [_bgScrollView addSubview:contentView];
        }
    }
    return self;
}

-(UIScrollView *)bgScrollView{
    if (!_bgScrollView) {
        _bgScrollView=[[UIScrollView alloc] initWithFrame:CGRectMake(0, _segmentToolView.frame.size.height, MAIN_SCREEN_WIDTH, self.bounds.size.height-_segmentToolView.bounds.size.height)];
        _bgScrollView.contentSize=CGSizeMake(MAIN_SCREEN_WIDTH * self.arrayCount, self.bounds.size.height-_segmentToolView.bounds.size.height);
//        _bgScrollView.backgroundColor=[UIColor brownColor];
        _bgScrollView.showsVerticalScrollIndicator=NO;
        _bgScrollView.showsHorizontalScrollIndicator=NO;
        _bgScrollView.delegate=self;
        _bgScrollView.bounces=NO;
        _bgScrollView.pagingEnabled=YES;
    }
    return _bgScrollView;
}



-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    if (scrollView==_bgScrollView)
    {
        NSInteger p=_bgScrollView.contentOffset.x/MAIN_SCREEN_WIDTH;
        _segmentToolView.defaultIndex=p+1;
        
    }
    
}

@end
