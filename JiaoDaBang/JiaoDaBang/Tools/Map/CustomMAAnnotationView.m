//
//  CustomMAAnnotationView.m
//  JiaoDaBang
//
//  Created by ott001 on 2017/4/13.
//  Copyright © 2017年 Heaven. All rights reserved.
//

#import "CustomMAAnnotationView.h"

@interface CustomMAAnnotationView ()

@property (nonatomic, strong) UILabel *label;

@end

@implementation CustomMAAnnotationView

- (id)initWithAnnotation:(id<MAAnnotation>)annotation reuseIdentifier:(NSString *)reuseIdentifier {

    self = [super initWithAnnotation:annotation reuseIdentifier:reuseIdentifier];
    
    if (self) {
        
        self.bounds = CGRectMake(0, 0, 36, 36);
        
        [self placeSubveiws];
    }
    return self;
}

- (void)placeSubveiws {
    
    [self.imageView setFrame:CGRectMake(0, 0, 36, 36)];
    self.imageView.image = [UIImage imageNamed:@"map_bubble@2x"];
    self.imageView.yt_centerPos = self.yt_centerPos;
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 36, 36)];
    label.userInteractionEnabled = NO;
    label.textAlignment = NSTextAlignmentCenter;
    label.font = [UIFont systemFontOfSize:12];
    label.backgroundColor = [UIColor clearColor];
    label.textColor = [UIColor whiteColor];
    [self.imageView addSubview:label];
    self.label = label;
}

- (void)setCount:(NSString *)count {

    self.label.text = count;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
