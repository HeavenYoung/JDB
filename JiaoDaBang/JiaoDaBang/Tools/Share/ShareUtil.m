//
//  ShareUtil.m
//  MiTang_Client
//
//  Created by OTT on 16/5/10.
//  Copyright © 2016年 Heaven. All rights reserved.
//

#import "ShareUtil.h"
#import "WXApiRequestHandler.h"

@implementation ShareUtil

+(void)shareInWXSession:(NSDictionary *)shareParams {
    
    NSString *tagName = @"WECHAT_TAG_JUMP_SHOWRANK";
    
    NSString *imageUrl = [shareParams objectForKey:@"shareImage"];
    UIImage *thumbImage = [UIImage imageNamed:@"Icon-60"];
    if (imageUrl && [imageUrl hasSuffix:@".jpg"]) {
        NSData *imageData = [NSData dataWithContentsOfURL:[NSURL URLWithString:imageUrl]];
        if ([UIImage imageWithData:imageData]) {
            thumbImage = [ShareUtil shareImageCutData:imageData];
        };
    };
    NSString *linkUrl = [shareParams objectForKey:@"linkUrl"];
    NSString *title = [shareParams objectForKey:@"title"];
    NSString *description = [NSString stringWithFormat:@"内容：%@\n觅糖为您提供购物正规品牌专卖店正品保障！一切围绕奢侈品的全球服务，满足你对奢侈品的一切需要!",[shareParams objectForKey:@"description"]];
    
    [WXApiRequestHandler sendLinkURL:linkUrl TagName:tagName Title:title Description:description ThumbImage:thumbImage InScene:WXSceneSession];
}

+(void)shareInWXTimeLine:(NSDictionary *)shareParams {
    
    NSString *tagName = @"WECHAT_TAG_JUMP_SHOWRANK";
    
    NSString *imageUrl = [shareParams objectForKey:@"shareImage"];
    UIImage *thumbImage = [UIImage imageNamed:@"Icon-60"];
    if (imageUrl && [imageUrl hasSuffix:@".jpg"]) {
        NSData *imageData = [NSData dataWithContentsOfURL:[NSURL URLWithString:imageUrl]];
        if ([UIImage imageWithData:imageData]) {
            thumbImage = [ShareUtil shareImageCutData:imageData];
        };
    };
    NSString *linkUrl = [shareParams objectForKey:@"linkUrl"];
    NSString *title = [shareParams objectForKey:@"title"];
    NSString *description = [shareParams objectForKey:@"description"];
    
    [WXApiRequestHandler sendLinkURL:linkUrl TagName:tagName Title:title Description:description ThumbImage:thumbImage InScene:WXSceneTimeline];
}

+(void)shareWelfareInWXSession:(NSDictionary *)shareParams {
    NSString *tagName = @"WECHAT_TAG_JUMP_SHOWRANK";
    UIImage *thumbImage = [shareParams objectForKey:@"shareImage"];
    NSString *linkUrl = [shareParams objectForKey:@"linkUrl"];
    NSString *title = [shareParams objectForKey:@"title"];
    NSString *description = [shareParams objectForKey:@"description"];
    
    [WXApiRequestHandler sendLinkURL:linkUrl TagName:tagName Title:title Description:description ThumbImage:thumbImage InScene:WXSceneSession];
}

+(void)shareWelfareInWXTimeLine:(NSDictionary *)shareParams {
    NSString *tagName = @"WECHAT_TAG_JUMP_SHOWRANK";
    UIImage *thumbImage = [shareParams objectForKey:@"shareImage"];
    NSString *linkUrl = [shareParams objectForKey:@"linkUrl"];
    NSString *title = [shareParams objectForKey:@"title"];
    NSString *description = [shareParams objectForKey:@"description"];

    [WXApiRequestHandler sendLinkURL:linkUrl TagName:tagName Title:title Description:description ThumbImage:thumbImage InScene:WXSceneTimeline];
}


+ (UIImage *)shareImageCutData:(NSData *)imageData
{
    UIImage *image = [UIImage imageWithData:imageData];
    if (imageData.length >4*1024*1024) {
        //4M以及以上
        image = [Tools imageCompressForWidth:image targetWidth:image.size.width/10];
    }
    else {
        image = [Tools imageCompressForWidth:image targetWidth:image.size.width/4];
    }
    imageData = UIImageJPEGRepresentation(image, 0.1);
    image = [UIImage imageWithData:imageData];
    if (imageData.length >32*1024) {
        imageData = UIImageJPEGRepresentation(image, 0.1);
    }
    return [UIImage imageWithData:imageData];
}


@end
