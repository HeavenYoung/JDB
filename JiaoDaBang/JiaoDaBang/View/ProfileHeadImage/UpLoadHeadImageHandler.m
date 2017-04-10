//
//  UpLoadHeadImageHandler.m
//  MiTang_Client
//
//  Created by OTT on 16/5/18.
//  Copyright © 2016年 Heaven. All rights reserved.
//

#import "UpLoadHeadImageHandler.h"

#define USERHEADIMAGE_FILE       @"image"   //image
#define USERHEADIMAGE_TOKEN      @"token"   //token

@implementation UpLoadHeadImageHandler

- (void)headImageUploadRequestWithheadImage:(UIImage *)headImage uploadSuccess:(UploadHeadImageSuccess)uploadSuccess uploadFailer:(UploadHeadImageFailer)uploadFailer {
    
    NSData *imageData = UIImageJPEGRepresentation(headImage, 0.5);
    UserAvatarRequest *request = [[UserAvatarRequest alloc] init];
    [request setParametersWithUserId:[GlobalManager sharedManager].userId ImageData:imageData];
    [request setSuccessBlock:^(id object, id responseObject) {
        
    DLog(@"-----头像修改成功-----");
        
        [GlobalManager sharedManager].userInfoData.userAvatar = (NSString *)object;
        
        uploadSuccess(object, responseObject);

    }];
    [request setFailureBlock:^(NSInteger errorCode, id responseObject) {
        DLog(@"-----头像修改失败-----");

        uploadFailer(errorCode, responseObject);

    }];
    [request sendRequest];
}

@end
