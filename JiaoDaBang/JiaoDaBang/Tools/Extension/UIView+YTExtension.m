//
//  UIView+YTExtension.m
//  MiTang_Client
//
//  Created by Heaven on 16/4/18.
//  Copyright © 2016年 Heaven. All rights reserved.
//

#import "UIView+YTExtension.h"

@implementation UIView (YTExtension)

@dynamic yt_width, yt_height,yt_posX, yt_posY, yt_centerPos, yt_top, yt_bottom, yt_right, yt_left, yt_brPos, yt_size;

- (float)yt_width
{
    return self.bounds.size.width;
}

- (float)yt_height
{
    return self.frame.size.height;
}

- (float)yt_posX
{
    return self.frame.origin.x;
}

- (float)yt_posY
{
    return self.frame.origin.y;
}

- (float)yt_top{
    return self.frame.origin.y;
}

- (float)yt_bottom{
    return self.frame.origin.y + self.frame.size.height;
}

- (float)yt_left{
    return self.yt_posX;
}

- (float)yt_right{
    return self.yt_brPos.x;
}

- (CGSize)yt_size{
    return CGSizeMake(self.yt_width, self.yt_height);
}

- (CGPoint)yt_brPos
{
    return CGPointMake([self yt_posX]+[self yt_width], [self yt_posY]+[self yt_height]);
}

- (float)yt_centerX
{
    return self.center.x;
}

- (void)setYt_centerX:(float)centerX
{
    CGPoint centerPoint  = self.center;
    centerPoint.x = centerX;
    self.center = centerPoint;
}

- (float)yt_centerY
{
    return self.center.y;
}

- (void)setYt_centerY:(float)centerY
{
    CGPoint centerPoint  = self.center;
    centerPoint.y = centerY;
    self.center = centerPoint;
}

- (CGPoint)yt_centerPos
{
    return CGPointMake([self yt_width]/2, [self yt_height]/2);
}

- (void)setYt_centerPos:(CGPoint)pos{
    self.frame = CGRectMake(pos.x - self.yt_width/2, pos.y - self.yt_height/2, self.yt_width, self.yt_height);
}

- (void)setYt_top:(float)top{
    [self setYt_posY:top];
}

- (void)setYt_bottom:(float)bottom
{
    CGRect frame = self.frame;
    frame.origin.y = bottom - frame.size.height;
    self.frame = frame;
}

- (void)setYt_width:(float)width
{
    self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, width, self.frame.size.height);
}

- (void)setYt_height:(float)height
{
    self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, self.frame.size.width, height);
}

- (void)setYt_posX:(float)posx
{
    self.frame = CGRectMake(posx, self.frame.origin.y, self.frame.size.width, self.frame.size.height);
}

- (void)setYt_left:(float)left{
    [self setYt_posX:left];
}

- (void)setYt_right:(float)right{
    [self setYt_posX:right-self.yt_width];
}

- (void)setYt_posY:(float)posy
{
    self.frame = CGRectMake(self.frame.origin.x, posy, self.frame.size.width, self.frame.size.height);
}

- (void)yt_centerToView:(UIView *)view
{
    [self setYt_posX:([view yt_width] - [self yt_width])/2];
    [self setYt_posY:([view yt_height] - [self yt_height])/2];
}

- (void)yt_centerToRect:(CGRect)rect{
    [self setYt_posX:(rect.size.width - [self yt_width])/2];
    [self setYt_posY:(rect.size.height - [self yt_height])/2];
    
}

@end
