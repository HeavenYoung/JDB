//
//  LanguageManager.m
//  PrivateTalk
//
//  Created by Heaven on 2016/12/13.
//  Copyright © 2016年 Heaven. All rights reserved.
//

#import "LanguageManager.h"

@implementation LanguageManager

+ (NSInteger)getCurrentLanguageId {
    
    NSInteger currentLanguageId = [[[NSUserDefaults standardUserDefaults] objectForKey:@"currentLanguageId"] integerValue];
    
    if (currentLanguageId != 0) {
        return currentLanguageId;
    }
    return 0;
}

+ (LangageType)getCurrentLanguageType {

    return [[self class] getCurrentLanguageId];
}

+ (void)writeLanguageId:(NSInteger)languageId {

    switch (languageId) {
        case 1: {
            [[NSUserDefaults standardUserDefaults] setObject:[NSNumber numberWithInteger:languageId] forKey:@"currentLanguageId"];
            [[NSUserDefaults standardUserDefaults] synchronize];
            [[NSUserDefaults standardUserDefaults] setObject:@"zh-Hant" forKey:@"appLanguage"];
            [[NSUserDefaults standardUserDefaults] synchronize];
        }
            break;
        case 2: {
            [[NSUserDefaults standardUserDefaults] setObject:[NSNumber numberWithInteger:languageId] forKey:@"currentLanguageId"];
            [[NSUserDefaults standardUserDefaults] synchronize];
            [[NSUserDefaults standardUserDefaults] setObject:@"zh-Hans" forKey:@"appLanguage"];
            [[NSUserDefaults standardUserDefaults] synchronize];
        }
            break;
        case 3: {
            [[NSUserDefaults standardUserDefaults] setObject:[NSNumber numberWithInteger:languageId] forKey:@"currentLanguageId"];
            [[NSUserDefaults standardUserDefaults] synchronize];
            [[NSUserDefaults standardUserDefaults] setObject:@"en" forKey:@"appLanguage"];
            [[NSUserDefaults standardUserDefaults] synchronize];
            }
            break;
        default:
            break;
    }
}

+ (void)writeLanguageType:(LangageType)languageType {

    [[self class] writeLanguageId:languageType];
}

@end
