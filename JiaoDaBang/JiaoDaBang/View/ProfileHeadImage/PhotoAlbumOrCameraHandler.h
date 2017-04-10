//
//  PhotoAlbumOrCameraHandler.h
//  MiTang_Client
//
//  Created by OTT on 16/5/18.
//  Copyright © 2016年 Heaven. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AssetsLibrary/AssetsLibrary.h>
#import <AVFoundation/AVCaptureDevice.h>
#import <AVFoundation/AVMediaFormat.h>
#import "VPImageCropperViewController.h"
#import "CutPictureTools.h"

typedef void(^BlockForPresent)(BOOL notify);

@protocol PhotoAlbumOrCameraHandlerDelegate;

@interface PhotoAlbumOrCameraHandler : NSObject

@property (nonatomic, weak) id<PhotoAlbumOrCameraHandlerDelegate> delegate;

//相机
- (void)getPhotoPickerControllerForDelegate:(id)delegate present:(BlockForPresent)block;

//图片库
- (void)getimagePickerControllerForDelegate:(id)delegate present:(BlockForPresent)block;

@end


@protocol PhotoAlbumOrCameraHandlerDelegate <NSObject>

@optional
//返回照片
- (void)photoFromCameraOrPicker:(UIImage *)cropimage fullImage:(UIImage *)fullImage;

@end
