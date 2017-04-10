//
//  EditAvatarViewController.m
//  JiaoDaBang
//
//  Created by ott001 on 2017/4/10.
//  Copyright © 2017年 Heaven. All rights reserved.
//

#import "EditAvatarViewController.h"

#import "CutPictureTools.h"
#import "PhotoAlbumOrCameraHandler.h"
#import "UpLoadHeadImageHandler.h"

@interface EditAvatarViewController () <UIActionSheetDelegate, PhotoAlbumOrCameraHandlerDelegate>

@property (nonatomic, strong) UIImageView *avatarView;
@property (nonatomic, strong) PhotoAlbumOrCameraHandler *cameraHandler;
@property (nonatomic, strong) MBProgressHUD *uploadHud;

@end

@implementation EditAvatarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"编辑头像";
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem barButtonWithTitle:nil titleFont:[UIFont systemFontOfSize:16] titleColor:[UIColor whiteColor] imageName:@"btn_close" target:self action:@selector(leftBarButtonItemDidClicked)];
    [self configVisualEffect];
    [self configAvatarView];
    
}

- (void)configVisualEffect {
    UIBlurEffect *beffect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleDark];
    UIVisualEffectView *VisualView = [[UIVisualEffectView alloc]initWithEffect:beffect];
    VisualView.frame = self.view.bounds;
    [self.view addSubview:VisualView];
}

- (void)configAvatarView {
    
    UIImageView *avatarView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 100, 120, 120)];
    avatarView.yt_centerX = self.view.yt_centerX;
    avatarView.layer.cornerRadius = 59;
    avatarView.layer.masksToBounds = YES;
    avatarView.layer.borderColor = [[UIColor grayColor] CGColor];
    avatarView.layer.borderWidth = 1;
    UIImage *avatarImage = [GlobalManager sharedManager].localAvatarImage?[GlobalManager sharedManager].localAvatarImage:[UIImage imageNamed:@"iconfont-lluseraavatar"];
    [avatarView sd_setImageWithURL:[[[GlobalManager sharedManager] userInfoData] userAvatar] placeholderImage:avatarImage];
    avatarView.userInteractionEnabled = YES;
    [self.view addSubview:avatarView];
    self.avatarView = avatarView;
    
    UITapGestureRecognizer *tapGestur = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(showImagePicker)];
    [self.avatarView addGestureRecognizer:tapGestur];
    
    UILabel *nicknamelabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 120, 20)];
    nicknamelabel.yt_centerX = avatarView.yt_centerX;
    nicknamelabel.yt_centerY = avatarView.yt_centerY +60 +40;
    nicknamelabel.textColor = [UIColor whiteColor];
    nicknamelabel.textAlignment = NSTextAlignmentCenter;
    nicknamelabel.font = [UIFont fontWithName: @"HelveticaNeue" size:15];
    NSString *nickNameStr = [GlobalManager sharedManager].userInfoData.userNickName ? [GlobalManager sharedManager].userInfoData.userNickName : [GlobalManager sharedManager].userInfoData.userName;
    nicknamelabel.text = [NSString stringWithFormat:@"昵称：%@",nickNameStr];
    [self.view addSubview:nicknamelabel];
}

// 关闭页面
- (void)leftBarButtonItemDidClicked {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)showImagePicker {
    UIActionSheet *choiceSheet = [[UIActionSheet alloc] initWithTitle:nil delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:nil otherButtonTitles:@"拍照",@"选择本地图库",nil];
    [choiceSheet showInView:self.view];
}

- (void)actionSheet:(UIActionSheet *)actionSheet didDismissWithButtonIndex:(NSInteger)buttonIndex {
    if (buttonIndex == 0) {
        // 拍照
        if ([CutPictureTools isCameraAvailable] && [CutPictureTools doesCameraSupportTakingPhotos]) {
            
            self.cameraHandler = [[PhotoAlbumOrCameraHandler alloc] init];
            self.cameraHandler.delegate = self;
            [self.cameraHandler getPhotoPickerControllerForDelegate:self present:^(BOOL notify) {
                
            }];
        }
    } else if (buttonIndex == 1) {
        // 从相册中选取
        if ([CutPictureTools isPhotoLibraryAvailable]) {
            self.cameraHandler = [[PhotoAlbumOrCameraHandler alloc] init];
            self.cameraHandler.delegate = self;
            [self.cameraHandler getimagePickerControllerForDelegate:self present:^(BOOL notify) {
                
            }];
        }
    }
}

#pragma mark - PhotoAlbumOrCameraHandlerDelegate

- (void)photoFromCameraOrPicker:(UIImage *)cropimage fullImage:(UIImage *)fullImage {
    
    self.avatarView.image = cropimage;
    self.cameraHandler = nil;
    
    UpLoadHeadImageHandler *uploadHandler = [[UpLoadHeadImageHandler alloc]init];
    [uploadHandler headImageUploadRequestWithheadImage:cropimage uploadSuccess:^(id object, id responseObject) {
        [GlobalManager sharedManager].localAvatarImage = cropimage;
        [[NSNotificationCenter defaultCenter] postNotificationName:NOTIFCATION_USERHEAD_INFOCHANGE object:nil];
        
        [self dismissViewControllerAnimated:YES completion:^{
            UIView *hudBackView = [UIApplication sharedApplication].keyWindow;
            MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:hudBackView animated:YES];
            hud.mode = MBProgressHUDModeText;
            hud.margin = 22.f;
            hud.removeFromSuperViewOnHide = YES;
            hud.label.text = @"上传成功";
            [hud hideAnimated:YES afterDelay:2];
        }];
        
    } uploadFailer:^(NSInteger error, id responseObject) {
        
        UIView *hudBackView = [UIApplication sharedApplication].keyWindow;
        MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:hudBackView animated:YES];
        hud.mode = MBProgressHUDModeText;
        hud.margin = 22.f;
        hud.removeFromSuperViewOnHide = YES;
        hud.label.text = @"上传失败";
        [hud hideAnimated:YES afterDelay:2];
        
    }];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
