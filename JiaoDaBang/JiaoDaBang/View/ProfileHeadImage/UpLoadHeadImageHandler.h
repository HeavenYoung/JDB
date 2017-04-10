//
//  UpLoadHeadImageHandler.h
//  MiTang_Client
//
//  Created by OTT on 16/5/18.
//  Copyright © 2016年 Heaven. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^UploadHeadImageSuccess)(id object, id responseObject);
typedef void(^UploadHeadImageFailer)(NSInteger error, id responseObject);

@interface UpLoadHeadImageHandler : NSObject

@property (nonatomic,strong) UIImage *headImge;
@property (nonatomic,strong) UIImage *originalImage;

- (void)headImageUploadRequestWithheadImage:(UIImage *)headImage uploadSuccess:(UploadHeadImageSuccess)uploadSuccess uploadFailer:(UploadHeadImageFailer)uploadFailer;

@end
