//
//  Tools.m
//  MiTang_Client
//
//  Created by Heaven on 16/4/19.
//  Copyright © 2016年 Heaven. All rights reserved.
//

#import "Tools.h"

#define CachesFolder [NSSearchPathForDirectoriesInDomains(NSCachesDirectory,NSUserDomainMask, YES) objectAtIndex:0]
#define OrderImagePathName @"orderImage"
#define OrderImagePath() [CachesFolder stringByAppendingPathComponent:OrderImagePathName]

@implementation Tools

+ (void)saveToken:(NSString *)token {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:token forKey:@"user_token"];
    [defaults synchronize];
}

+ (NSString *)getToken {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    return  [defaults objectForKey:@"user_token"] ? [defaults objectForKey:@"user_token"] : @"0";
}

+ (void)deleteToken {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults removeObjectForKey:@"user_token"];
}


/**
 *  重新获取验证码的方法
 *
 *  @param sec             间隔的秒数
 *  @param completionBlock 间隔描述完成
 *  @param isRunBlock      正在倒计时
 */
+ (void)timerCountDown:(int)sec
       completionBlock:(void (^)())completionBlock
            isRunBlock:(void (^)(NSString *countDownSec))isRunBlock
{
    __block int timeout = sec; //倒计时时间
    
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    
    dispatch_source_t _timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0,queue);
    
    dispatch_source_set_timer(_timer,dispatch_walltime(NULL, 0),1.0*NSEC_PER_SEC, 0); //没秒执行
    
    dispatch_source_set_event_handler(_timer, ^{
        
        if(timeout<=0){ //倒计时结束，关闭
            
            dispatch_source_cancel(_timer);
#if !OS_OBJECT_USE_OBJC
            dispatch_release(_timer);
#endif
            dispatch_async(dispatch_get_main_queue(), ^{
                
                completionBlock();
            });
            
        }else{
            
            NSString *strTime = [NSString stringWithFormat:@"重发(%.2d S)",timeout];
            
            dispatch_async(dispatch_get_main_queue(), ^{
                isRunBlock(strTime);
            });
            
            timeout--;
        }
        
    });
    
    dispatch_resume(_timer);
}

+ (BOOL)isEmptyInput:(NSString *)txt{
    if(txt == nil){
        return YES;
    }
    txt = [txt stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    return [txt isEqualToString:@""];
}

#pragma mark - 空判断
+ (BOOL)iSNull:(id)object
{
    if (([object isEqual:[NSNull null]]) || (object == nil) || (object == NULL)) {
        return YES;
    }
    if ([object isKindOfClass:[NSString class]]) {
        return [self isEmptyInput:object];
    }
    return NO;
}

+ (void)alterWithNoNetwork {

    UIAlertView *alter = [[UIAlertView alloc] initWithTitle:@"提示"
                                                    message:@"请您检查网络"
                                                    delegate:self
                                                    cancelButtonTitle:nil
                                                    otherButtonTitles:@"确定", nil];
    
    [alter show];
}

+ (UIImage *)synLoadOrderImageWithURL:(NSURL *)url orderId:(NSString *)orderId {
    
    NSData *resultData = [NSData dataWithContentsOfURL:url];
    UIImage *loadImg = [UIImage imageWithData:resultData];
    NSFileManager *fileManager = [NSFileManager defaultManager];
    
    if (![fileManager isExecutableFileAtPath:OrderImagePath()]) {
        [fileManager createDirectoryAtPath:OrderImagePath() withIntermediateDirectories:YES attributes:nil error:nil];
    }
    [UIImagePNGRepresentation(loadImg) writeToFile:[OrderImagePath() stringByAppendingPathComponent:[NSString stringWithFormat:@"%@.png", orderId]] options:NSAtomicWrite error:nil];
    
    return loadImg;
}

+ (UIImage *)asynLoadOrderImageWithURL:(NSURL *)url orderId:(NSString *)orderId {
    __block UIImage *loadImg = nil;
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_group_t group = dispatch_group_create();
    dispatch_group_async(group, queue, ^{
        NSData *resultData = [NSData dataWithContentsOfURL:url];
        loadImg = [UIImage imageWithData:resultData];
    });
    dispatch_group_notify(group, dispatch_get_main_queue(), ^{
        NSFileManager *fileManager = [NSFileManager defaultManager];
        if (![fileManager isExecutableFileAtPath:OrderImagePath()]) {
            [fileManager createDirectoryAtPath:OrderImagePath() withIntermediateDirectories:YES attributes:nil error:nil];
        }
        [UIImagePNGRepresentation(loadImg) writeToFile:[OrderImagePath() stringByAppendingPathComponent:[NSString stringWithFormat:@"%@.png", orderId]] options:NSAtomicWrite error:nil];
    });
    
    return loadImg;
}

+ (void)saveImage:(UIImage *)image withFileName:(NSString *)imageName ofType:(NSString *)extension inDirectory:(NSString *)directoryPath {
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    if (![fileManager isExecutableFileAtPath:directoryPath]) {
        [fileManager createDirectoryAtPath:directoryPath withIntermediateDirectories:YES attributes:nil error:nil];
    }
    
    if ([[extension lowercaseString] isEqualToString:@"png"]) {
        [UIImagePNGRepresentation(image) writeToFile:[directoryPath stringByAppendingPathComponent:[NSString stringWithFormat:@"%@.%@", imageName, @"png"]] options:NSAtomicWrite error:nil];
    }
    else if ([[extension lowercaseString] isEqualToString:@"jpg"] || [[extension lowercaseString] isEqualToString:@"jpeg"]) {
        [UIImageJPEGRepresentation(image, 1.0) writeToFile:[directoryPath stringByAppendingPathComponent:[NSString stringWithFormat:@"%@.%@", imageName, @"jpg"]] options:NSAtomicWrite error:nil];
    }
    else {
        //默认png
        [UIImagePNGRepresentation(image) writeToFile:[directoryPath stringByAppendingPathComponent:[NSString stringWithFormat:@"%@.%@", imageName, @"png"]] options:NSAtomicWrite error:nil];
    }
}

+ (UIImage *)loadOrderImageOfOrderId:(NSString *)orderId InDirectory:(NSString *)directoryPath {
    if (!directoryPath) {
        directoryPath = OrderImagePath();
    }
    UIImage *image = [UIImage imageWithContentsOfFile:[NSString stringWithFormat:@"%@/%@.png", directoryPath, orderId]];
    if (!image) {
        //默认图片替换
        image = nil;
    }
    return image;
}

+ (NSData *)loadOrderImageDataOfOrderId:(NSString *)orderId InDirectory:(NSString *)directoryPath {
    if (!directoryPath) {
        directoryPath = OrderImagePath();
    }
    NSData *imageData = [NSData dataWithContentsOfFile:[NSString stringWithFormat:@"%@/%@.png", directoryPath, orderId]];
    
    return imageData;
}


+ (UIImage *)imageCompressForWidth:(UIImage *)sourceImage targetWidth:(CGFloat)defineWidth {
    
    CGSize imageSize = sourceImage.size;
    CGFloat width = imageSize.width;
    CGFloat height = imageSize.height;
    CGFloat targetWidth = defineWidth;
    CGFloat targetHeight = (targetWidth / width) * height;
    UIGraphicsBeginImageContext(CGSizeMake(targetWidth, targetHeight));
    [sourceImage drawInRect:CGRectMake(0,0,targetWidth, targetHeight)];
    UIImage* newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return newImage;
}

+ (NSData *)imageCutData:(UIImage *)myimage
{
    NSData *data = UIImageJPEGRepresentation(myimage, 1.0);
    if (data.length >4*1024*1024) {
        //4M以及以上
        myimage = [Tools imageCompressForWidth:myimage targetWidth:myimage.size.width/2];
        data = UIImageJPEGRepresentation(myimage, 1.0);
    }
    if (data.length >100*1024) {
        if (data.length >2*1024*1024) {
            //2M以及以上
            data = UIImageJPEGRepresentation(myimage, 0.1);
        } else if (data.length >1024*1024) {
            //1M以及以上
            data = UIImageJPEGRepresentation(myimage, 0.2);
        } else if (data.length >512*1024) {
            //0.5M-1M
            data = UIImageJPEGRepresentation(myimage, 0.5);
        } else if (data.length >200*1024) {
            //0.25M-0.5M
            data = UIImageJPEGRepresentation(myimage, 0.9);
        }
    }
    return data;
}


@end
