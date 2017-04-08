//
//  PublishInfoView.m
//  JiaoDaBang
//
//  Created by Heaven on 08/04/2017.
//  Copyright © 2017 Heaven. All rights reserved.
//

#import "PublishInfoView.h"

@interface PublishInfoView ()

@end

@implementation PublishInfoView

- (instancetype)initWithFrame:(CGRect)frame {

    self = [super initWithFrame:frame];
    if (self) {
        
        [self placeSubviews];
    }
    return self;
}

- (void)placeSubviews {

    
    
    // 按钮
    UIButton *submitBtn = [UIButton buttonWithTitle:@"发布"
                                        normalColor:CustomGreen
                                   highlightedColor:CustomGreen
                                          titleFont:[UIFont systemFontOfSize:16]
                                          imageName:nil
                                      backImageName:nil
                                             target:self
                                             action:@selector(submitBtnDidClicked)];
    submitBtn.frame = CGRectMake(10, 30, SCREEN_WIDTH - 20, 40);
    submitBtn.backgroundColor = [UIColor lightTextColor];
    submitBtn.layer.cornerRadius = 5.0;
    submitBtn.layer.masksToBounds = YES;
    [self addSubview:submitBtn];
}

- (void)submitBtnDidClicked {

    
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
