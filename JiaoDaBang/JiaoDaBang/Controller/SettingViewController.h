//
//  SettingViewController.h
//  JiaoDaBang
//
//  Created by Heaven on 05/04/2017.
//  Copyright © 2017 Heaven. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol SettingViewControllerDelegate <NSObject>

- (void)settingLogout;

@end

@interface SettingViewController : UIViewController

@property (nonatomic, weak) id <SettingViewControllerDelegate> delegate;

@end
