//
//  RightButtonNew.m
//  button
//
//  Created by apple on 16/12/19.
//  Copyright © 2016年 Sunjiandong. All rights reserved.
//

#import "RightButtonNew.h"
#import "UIView+Extension.h"

@implementation RightButtonNew

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        //设置文字居中
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    self.imageView.width = 55;
    self.imageView.height = 55;
    self.imageView.layer.masksToBounds = YES;
    self.imageView.layer.cornerRadius = self.imageView.width * 0.5;
    self.imageView.x = (self.width - self.imageView.width) * 0.5;
    self.imageView.y = 0;
    self.titleLabel.width = self.width;
    self.titleLabel.height = (self.height - self.imageView.height) + 8;
    self.titleLabel.x = 0;
    self.titleLabel.y = self.imageView.height+10;
    
}


@end
