//
//  CutPictureTools.h
//  MiTang_Client
//
//  Created by OTT on 16/5/18.
//  Copyright © 2016年 Heaven. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AssetsLibrary/AssetsLibrary.h>
#import <MobileCoreServices/MobileCoreServices.h>

@interface CutPictureTools : NSObject

+ (UIImage *)imageByScalingToMaxSize:(UIImage *)sourceImage;

+ (BOOL)isCameraAvailable;
+ (BOOL)doesCameraSupportTakingPhotos;
+ (BOOL)isFrontCameraAvailable;
+ (BOOL)isPhotoLibraryAvailable;

@end
