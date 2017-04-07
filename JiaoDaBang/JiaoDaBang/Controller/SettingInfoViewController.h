//
//  SettingInfoViewController.h
//  JiaoDaBang
//
//  Created by Heaven on 07/04/2017.
//  Copyright © 2017 Heaven. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, SettingInfoType) {
    SettingInfoTypeNickName,
    SettingInfoTypeGender,
    SettingInfoTypeSchool,
};

typedef void (^SettingInfoSuccessBlock) (NSString *contentString);

@interface SettingInfoViewController : UIViewController

- initWithInfoType:(SettingInfoType)settingInfoType contentString:(NSString *)contentString settingBlock:(SettingInfoSuccessBlock)block;

@end
