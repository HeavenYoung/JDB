//
//  LanguageManager.h
//  PrivateTalk
//
//  Created by Heaven on 2016/12/13.
//  Copyright © 2016年 Heaven. All rights reserved.
//

#import <Foundation/Foundation.h>

#define EN  @"en"
#define ZH_HANT @"zh-Hant"
#define ZH_HANS @"zh-Hans"

typedef NS_ENUM(NSInteger , LangageType) {
    LangageType_ZH_TRA = 1,
    LangageType_ZH_SIM = 2,
    LangageType_EN = 3
};

@interface LanguageManager : NSObject

+ (void)writeLanguageId:(NSInteger)languageId;

+ (NSInteger)getCurrentLanguageId;

+ (LangageType)getCurrentLanguageType;

+ (void)writeLanguageType:(LangageType)languageType;

@end
