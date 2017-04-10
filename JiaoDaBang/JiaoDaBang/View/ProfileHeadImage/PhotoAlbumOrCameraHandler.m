//
//  PhotoAlbumOrCameraHandler.m
//  MiTang_Client
//
//  Created by OTT on 16/5/18.
//  Copyright © 2016年 Heaven. All rights reserved.
//

#import "PhotoAlbumOrCameraHandler.h"
#import "MacroInfo.h"
#import <UIKit/UIKit.h>
#import <Photos/Photos.h>

@interface PhotoAlbumOrCameraHandler ()<VPImageCropperDelegate,UINavigationControllerDelegate,UIImagePickerControllerDelegate,UIPopoverPresentationControllerDelegate>

@property (nonatomic, copy) BlockForPresent presentCancelBlock;
@property (nonatomic, strong) UIViewController *parentController;

@end

@implementation PhotoAlbumOrCameraHandler


- (void)getPhotoPickerControllerForDelegate:(id)delegate present:(BlockForPresent)block{
    self.presentCancelBlock = block;
    self.parentController = delegate;
    
    UIImagePickerController *controller = [[UIImagePickerController alloc] init];
    controller.sourceType = UIImagePickerControllerSourceTypeCamera;
    if ([CutPictureTools isFrontCameraAvailable]) {
        controller.cameraDevice = UIImagePickerControllerCameraDeviceFront;
    }
    NSMutableArray *mediaTypes = [[NSMutableArray alloc] init];
    [mediaTypes addObject:(__bridge NSString *)kUTTypeImage];
    controller.mediaTypes = mediaTypes;
    controller.delegate = self;
    
    [self.parentController presentViewController:controller animated:YES completion:^(void){
        DLog(@"Picker View Controller is presented");
    }];
    
    ALAuthorizationStatus authStatus = [ALAssetsLibrary authorizationStatus];
    if (authStatus == ALAuthorizationStatusDenied) {
        
        NSDictionary *mainInfoDictionary = [[NSBundle mainBundle] infoDictionary];
        NSString *appName = [mainInfoDictionary objectForKey:@"CFBundleDisplayName"];
        NSString *tipTextWhenNoPhotosAuthorization = [NSString stringWithFormat:@"请在设备的\"设置-隐私-照片\"选项中，允许%@访问您的手机相机",  appName?appName:@""];
        [self tipTheAlertViewWithTitle:@"请允许使用相机" message:tipTextWhenNoPhotosAuthorization];
        return;
    }
}

//选择图片
- (void)getimagePickerControllerForDelegate:(id)delegate present:(BlockForPresent)block{
    
    self.presentCancelBlock = block;
    self.parentController = delegate;
    
    UIImagePickerController *controller = [[UIImagePickerController alloc] init];
    controller.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    if ([CutPictureTools isPhotoLibraryAvailable]) {
        
    }
    
    NSMutableArray *mediaTypes = [[NSMutableArray alloc] init];
    [mediaTypes addObject:(__bridge NSString *)kUTTypeImage];
    controller.mediaTypes = mediaTypes;
    controller.delegate = self;
    
    [self.parentController presentViewController:controller animated:YES completion:^(void){
        DLog(@"Picker View Controller is presented");
    }];
    
    ALAuthorizationStatus authStatus = [ALAssetsLibrary authorizationStatus];
    if (authStatus == ALAuthorizationStatusDenied) {
        
        NSDictionary *mainInfoDictionary = [[NSBundle mainBundle] infoDictionary];
        NSString *appName = [mainInfoDictionary objectForKey:@"CFBundleDisplayName"];
        NSString *tipTextWhenNoPhotosAuthorization = [NSString stringWithFormat:@"请在设备的\"设置-隐私-照片\"选项中，允许%@访问您的手机相册", appName?appName:@""];
        [self tipTheAlertViewWithTitle:@"请允许使用相册" message:tipTextWhenNoPhotosAuthorization];
        return;
    }
}


#pragma mark - UIImagePickerControllerDelegate

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    //选择相机后执行的方法
    [picker dismissViewControllerAnimated:YES completion:^() {
        UIImage *portraitImg = [info objectForKey:@"UIImagePickerControllerOriginalImage"];
        portraitImg = [CutPictureTools imageByScalingToMaxSize:portraitImg];
        // 裁剪
        VPImageCropperViewController *imgEditorVC = [[VPImageCropperViewController alloc] initWithImage:portraitImg cropFrame:CGRectMake(0,0, SCREEN_WIDTH, SCREEN_WIDTH) limitScaleRatio:3.0];
        imgEditorVC.delegate = self;
        imgEditorVC.view.backgroundColor = [UIColor clearColor];
        imgEditorVC.modalPresentationStyle = UIModalPresentationOverCurrentContext;
        [self.parentController presentViewController:imgEditorVC animated:YES completion:nil];
    }];
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    
    [picker dismissViewControllerAnimated:YES completion:^(){
        
    }];
    if (self.presentCancelBlock) {
        self.presentCancelBlock(NO);
    }
}


#pragma mark - VPImageCropperDelegate

//编辑头像后返回的方法
- (void)imageCropper:(VPImageCropperViewController *)cropperViewController didFinished:(UIImage *)editedImage {

    if ([self.delegate respondsToSelector:@selector(photoFromCameraOrPicker:fullImage:)]) {
        [self.delegate photoFromCameraOrPicker:editedImage fullImage:cropperViewController.originalImage];
    }
    
    [cropperViewController dismissViewControllerAnimated:YES completion:nil];
}

- (void)imageCropperDidCancel:(VPImageCropperViewController *)cropperViewController {
    
    [cropperViewController dismissViewControllerAnimated:YES completion:nil];
    if (self.presentCancelBlock) {
        self.presentCancelBlock(NO);
    }
}


#pragma mark - alertView

- (void)tipTheAlertViewWithTitle:(NSString *)title message:(NSString *)message {
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:title message:message delegate:self cancelButtonTitle:@"确定" otherButtonTitles: nil];
    alert.delegate = self;
    [alert show];
}

@end




